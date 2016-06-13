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
	fmt.Fprintln(f, "MAINTAINER Chuanjian Wang <me@ckeyer.com>")
	fmt.Fprintln(f)
	for i := 0; i < 123; i++ {
		fmt.Fprintf(f, "RUN mkdir -p /opt/%d\n", i)
	}
}
