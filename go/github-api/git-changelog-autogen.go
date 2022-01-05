package main

import (
	"container/list"
	"fmt"
	"os"

	git "github.com/libgit2/git2go/v33"
)

type ChangeData struct {
	Author  string
	Message string
	Tag     string
}

func main() {
	//<path until repo root directory>
	path := os.Args[1]
	repo, _ := git.OpenRepository(path)
	changes, last_tag_commit := compute_log(repo)
	for change := changes.Front(); change != nil; change = change.Next() {
		change_data := ChangeData(change.Value.(ChangeData))
		fmt.Println("Author:", change_data.Author)
		fmt.Println("Message:", change_data.Message)
		fmt.Println("Tag:", change_data.Tag)
		fmt.Println("-------------------")
	}

	compute_dependency_version_changes(repo, last_tag_commit, path)
}

func compute_dependency_version_changes(repo *git.Repository, last_tag_commit *git.Commit, repo_dirpath string) {
	// compute version of each dependency on HEAD
	// compute and apply the diff of each dependency file from `last_tag_commit`
	// compute verions of each dependency on `last_tag_commit`
	// compute dependency versions differences between the two ones computed earlier
	return
}

func compute_log(repo *git.Repository) (*list.List, *git.Commit) {
	result_list := list.New()

	// options of `git --describe` command
	describeOpt, _ := git.DefaultDescribeOptions()
	describeOpt.Strategy = git.DescribeTags
	describeFmt, _ := git.DefaultDescribeFormatOptions()
	describeFmt.AbbreviatedSize = 0

	// initialize commit iterator
	walker, _ := repo.Walk()
	walker.PushHead()

	var current_tag = ""
	var current_tag_commit *git.Commit = nil
	walker.Iterate(func(commit *git.Commit) bool {
		current_tag_commit = commit
		author := commit.Author().Name
		message := commit.Message()
		tag, _ := get_tag_name(commit, &describeOpt, &describeFmt)

		if len(current_tag) == 0 {
			current_tag = tag
		} else if tag != current_tag {
			// end of iteration
			return false
		}

		result_list.PushBack(ChangeData{
			Author:  author,
			Message: message,
			Tag:     tag,
		})
		return true
	})
	return result_list, current_tag_commit
}

func get_tag_name(commit *git.Commit, decOpts *git.DescribeOptions,
	descFmt *git.DescribeFormatOptions) (string, error) {

	describeResult, err := commit.Describe(decOpts)
	if err != nil {
		return "", err
	} else {
		tag, err := describeResult.Format(descFmt)
		if err != nil {
			return "", err
		} else {
			return tag, nil
		}
	}
}
