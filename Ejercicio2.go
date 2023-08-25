package main

import "fmt"

func main() {
	centerSize := 5 // Cambia este valor para ajustar el tamaño del centro
	printFigure(centerSize)
}

func printFigure(centerSize int) {
	if centerSize <= 0 || centerSize%2 == 0 {
		fmt.Println("El tamaño del centro debe ser impar y positivo.")
		return
	}

	for i := -centerSize + 1; i < centerSize; i += 2 {
		printLine(i, centerSize)
	}
}

func printLine(row, centerSize int) {
	spaces := (centerSize - 1 - row) / 2

	// Imprimir espacios iniciales
	for i := 0; i < spaces; i++ {
		fmt.Print("  ")
	}

	stars := centerSize - spaces*2
	for i := 0; i < stars; i++ {
		fmt.Print("*   ")
	}

	fmt.Println()
}
