package main

import "fmt"

func main() {
	sequence := []string{"a", "b", "c", "d", "e", "f", "g", "h"}
	fmt.Println("Secuencia Original:", sequence)

	rotations := []struct {
		count     int
		direction int // 0 = izquierda, 1 = derecha
	}{
		{3, 0},
		{2, 1},
	}

	for _, rotation := range rotations {
		rotate(&sequence, rotation.count, rotation.direction)
		fmt.Printf("Secuencia final rotada (%s %d): %v\n", directionName(rotation.direction), rotation.count, sequence)
	}
}

func rotate(arr *[]string, count, direction int) {
	length := len(*arr)
	if length == 0 || count == 0 {
		return
	}

	if direction == 0 { // izquierda
		count %= length
		*arr = append((*arr)[count:], (*arr)[:count]...)
	} else if direction == 1 { // derecha
		count %= length
		*arr = append((*arr)[length-count:], (*arr)[:length-count]...)
	}
}

func directionName(direction int) string {
	if direction == 0 {
		return "izquierda"
	} else if direction == 1 {
		return "derecha"
	}
	return ""
}
