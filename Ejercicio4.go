package main

import (
	"fmt"
)

type calzado struct {
	Modelo string
	Precio float64
	Talla  int
	Stock  int
}

func main() {
	inventario := []calzado{
		{"Nike", 50000, 42, 5},
		{"Adidas", 45000, 40, 3},
		{"Puma", 40000, 38, 8},
		// ... Puedes agregar más zapatos al inventario aquí
	}

	fmt.Println("Inventario Inicial:")
	printInventory(inventario)

	venderZapatos(&inventario, "Nike", 42, 3)
	venderZapatos(&inventario, "Adidas", 40, 2)
	venderZapatos(&inventario, "Puma", 38, 5)

	fmt.Println("\nInventario después de ventas:")
	printInventory(inventario)
}

func venderZapatos(inventario *[]calzado, modelo string, talla, cantidad int) {
	for i, zapato := range *inventario {
		if zapato.Modelo == modelo && zapato.Talla == talla {
			if cantidad <= zapato.Stock {
				(*inventario)[i].Stock -= cantidad
				fmt.Printf("Venta exitosa: %d pares de %s talla %d\n", cantidad, modelo, talla)
				return
			} else {
				fmt.Printf("No se puede vender. Stock insuficiente de %s talla %d\n", modelo, talla)
				return
			}
		}
	}
	fmt.Printf("No se encontró %s talla %d en el inventario\n", modelo, talla)
}

func printInventory(inventario []calzado) {
	for _, zapato := range inventario {
		fmt.Printf("Modelo: %s, Talla: %d, Precio: %.2f, Stock: %d\n", zapato.Modelo, zapato.Talla, zapato.Precio, zapato.Stock)
	}
}
