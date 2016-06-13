package main

import (
	"fmt"
	"os"
)

func main() {
	f, err := os.OpenFile("./Dockerfile", os.O_CREATE|os.O_RDWR, 0644)
	if err != nil {
		panic(err)
	}
	defer f.Close()

	fmt.Fprintln(f, "FROM alpine:edge")
	fmt.Fprintln(f)
	fmt.Fprintln(f, "MAINTAINER ckeyer <docker@ckeyer.com>")
	fmt.Fprintln(f)
	for I := 'a'; I <= 'z'; I++ {
		for i, j := 'a', 'A'-'a'; i <= 'z'; i++ {
			fmt.Fprintf(f, "RUN touch /opt/%s%s\n", string(I), string(i))
			fmt.Fprintf(f, "ENV %s%s=%s%s\n", string(I+j), string(i+j), string(I), string(i))
		}
	}
}
