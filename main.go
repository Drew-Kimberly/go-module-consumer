package main

import (
	"fmt"

	"github.com/Drew-Kimberly/go-exploration/str"
)

func main() {
	result := str.IndexOf("abc", "b")
	fmt.Printf("str.IndexOf('abc', 'b') = %d", result)
}
