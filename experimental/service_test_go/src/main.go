package main

import (
	"fmt"
	"net/http"

	"experimental/service_test_go/mypkg"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, Bazel + Go!")
	fmt.Fprintf(w, "%s\n", Message())
	fmt.Fprintf(w, "%s\n", mypkg.Message())
}

func main() {
	http.HandleFunc("/", handler)
	port := ":8080"
	fmt.Println("Server running on http://localhost" + port)
	http.ListenAndServe(port, nil)
}
