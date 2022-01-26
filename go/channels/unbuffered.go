package main

import (
	"fmt"
)

func max_min(ch chan int, x, y int) {
	if x > y {
		ch <- x
		ch <- y
	} else {
		ch <- y
		ch <- x
	}
}

func main() {
	ch := make(chan int)
	go max_min(ch, 0, 1)
	max_val := <-ch
	min_val := <-ch

	fmt.Printf("Max: %d, Min: %d\n", max_val, min_val)
}
