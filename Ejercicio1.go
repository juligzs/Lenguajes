package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	fmt.Println("Ingrese su texto:")
	text := getUserInput()

	numChars := countCharacters(text)
	numWords := countWords(text)
	numLines := countLines(text)

	fmt.Printf("Número de caracteres: %d\n", numChars)
	fmt.Printf("Número de palabras: %d\n", numWords)
	fmt.Printf("Número de líneas: %d\n", numLines)
}

func getUserInput() string {
	reader := bufio.NewReader(os.Stdin)
	text, _ := reader.ReadString('\n')
	return text
}

func countCharacters(text string) int {
	return len(text)
}

func countWords(text string) int {
	words := strings.Fields(text)
	return len(words)
}

func countLines(text string) int {
	lines := strings.Split(text, "\n")
	return len(lines)
}
