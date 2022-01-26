package main

import (
	"fmt"
	"time"
)

func run(ch chan string, name string) {
	time.Sleep(time.Millisecond * 300)
	ch <- name
}

func run1(ch chan string, name string) {
	time.Sleep(time.Millisecond * 400)
	ch <- name
}

func main() {
	foo := make(chan string)
	bar := make(chan string)
	go run(bar, "bar")
	go run1(foo, "foo")
	select {
	case f := <-foo:
		fmt.Println(f)
	case b := <-bar:
		fmt.Println(b)
	}
}
