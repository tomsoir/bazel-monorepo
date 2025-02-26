package main

import (
	"fmt"
	"net/http"

	"experimental/service_test_go_tests/handlerpkg"
)

func main() {
	http.HandleFunc("/", handlerpkg.Handler)
	port := ":8080"
	fmt.Println("Server running on http://localhost" + port)
	http.ListenAndServe(port, nil)
}
