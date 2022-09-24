package main

import (
	"fmt"
	zet "github.com/coopernetes/note-cmd/pkg/zet"
)

func main() {
	fmt.Printf("Note cmd run!")
	fmt.Printf(Run())
}

func Run() string {
	return zet.Cmd()
}
