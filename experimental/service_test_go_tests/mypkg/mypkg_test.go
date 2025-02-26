package mypkg_test

import (
	"testing"

	"experimental/service_test_go_tests/mypkg"
)

func TestMessage(t *testing.T) {
	expected := "Hello from the MYPKG package!"
	result := mypkg.Message()

	if result != expected {
		t.Errorf("Expected %s, but got %s", expected, result)
	}
}
