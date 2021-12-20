package main

import "github.com/libgit2/git2go/v33"
import "fmt"


func main () {
	//<path until repo root directory>
	path := "/path/to/root/directory/of/the/repo"
	repo, _ := git.OpenRepository(path)
	git_log(repo)
}

func git_log(repo *git.Repository) {
	// git default object
	oid := new(git.Oid)
	
	// options of `git --describe` command
	describeOpt,_ := git.DefaultDescribeOptions()
	describeOpt.Strategy = git.DescribeTags
	describeFmt, _:= git.DefaultDescribeFormatOptions()
	
	// initialize commit iterator
	walker, _ := repo.Walk()
	walker.PushHead()
	
	// getting next commit from HEAD
	var nxt = walker.Next(oid)
	if nxt != nil {
		fmt.Println("Err:", nxt)
	}
	var count = 0

	for nxt  == nil {
		count = count + 1
		commit, _ := repo.LookupCommit(oid)
		if count > 4 {
			break
		}
		// get commit Signature
		author := commit.Author()
		fmt.Println("Author:", author.Name)
		
		fmt.Println("Message:", commit.Message())
		
		// get commit tag
		describeResult, err := commit.Describe(&describeOpt)
		if err != nil {
			fmt.Println("Descbribe err:", err)
		} else {
			tag, err := describeResult.Format(&describeFmt)
			if err != nil {
				fmt.Println("Described result error:", err)
			} else {
				fmt.Println("Tag:", tag)
			}
		}
		fmt.Println("-------------------")
		nxt = walker.Next(oid)
	}
}