package main

import (
	"fmt"
	"time"
)

func foo(ch chan string, name string) {
	time.Sleep(time.Second * 3)
	ch <- name
}

func main() {
	ch := make(chan string)
	go foo(ch, "foo")

	val, ok := <-ch
	if ok {
		fmt.Printf("Value: %s\n", val)
	} else {
		fmt.Printf("Channel have not done\n")
	}
}
