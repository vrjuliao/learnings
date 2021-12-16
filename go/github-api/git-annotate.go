package main

import "github.com/libgit2/git2go/v33"
import "fmt"
import "C"

func main () {
	repo, err := git.OpenRepository("/home/vrjuliao/workfolder/learnings/")
	if err != nil {
		fmt.Println("open repo problem")
		fmt.Println(err)
	}
	// repo.LookupBranch("master", 0)
	br, err := repo.LookupBranch("master", git.BranchAll)
	if err != nil {
		fmt.Println("Branch getting problem")
		fmt.Println(err)
	}
	fmt.Println(br.Name())
}

func git_log() {
	repo, err := git.OpenRepository("/home/vrjuliao/workfolder/learnings/")
	var oid *Oid
	var commit *Commit
	walker := repo.Walk()
	for walker.Next(oid) == nil {

	}

}