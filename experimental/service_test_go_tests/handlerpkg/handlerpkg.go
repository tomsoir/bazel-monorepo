package handlerpkg

import (
	"fmt"
	"net/http"

	"experimental/service_test_go_tests/mypkg"
)

func Handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, Bazel + Go!")
	fmt.Fprintf(w, "%s\n", mypkg.Message())
}
