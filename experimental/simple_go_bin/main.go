package main

import (
	"flag"
	"fmt"
	"io"
	"os"
)

func main() {
	var inputPath string
	var outputPath string

	flag.StringVar(&inputPath, "file", "", "Path to the input file")
	flag.StringVar(&outputPath, "output", "", "Path to the output file (optional)")
	flag.Parse()

	if inputPath == "" {
		fmt.Println("Missing --file argument")
		os.Exit(1)
	}
	if outputPath == "" {
		fmt.Println("Missing --output argument")
		os.Exit(1)
	}

	// Open input file
	input, err := os.Open(inputPath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Failed to open input file: %v\n", err)
		os.Exit(1)
	}
	defer input.Close()

	// Create output file
	output, err := os.Create(outputPath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Failed to create output file: %v\n", err)
		os.Exit(1)
	}
	defer output.Close()

	// Copy input contents to output
	if _, err := io.Copy(output, input); err != nil {
		fmt.Fprintf(os.Stderr, "Failed to copy contents: %v\n", err)
		os.Exit(1)
	}

	// Append extra message
	if _, err := output.WriteString("HELLO WORKS FROM GO APP\n"); err != nil {
		fmt.Fprintf(os.Stderr, "Failed to write to output file: %v\n", err)
		os.Exit(1)
	}
}
