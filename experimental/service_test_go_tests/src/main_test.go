package main

import (
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"experimental/service_test_go_tests/handlerpkg"
	"experimental/service_test_go_tests/mypkg"
)

func TestHandler(t *testing.T) {
	req, err := http.NewRequest("GET", "/", nil)
	if err != nil {
		t.Fatal(err)
	}

	rr := httptest.NewRecorder()
	handlerpkg.Handler(rr, req) // Now accessible because it's public

	response := rr.Body.String()

	if !strings.Contains(response, "Hello, Bazel + Go!") {
		t.Errorf("Expected response to contain 'Hello, Bazel + Go!', got %s", response)
	}

	if !strings.Contains(response, mypkg.Message()) {
		t.Errorf("Expected response to contain message from mypkg, got %s", response)
	}
}
