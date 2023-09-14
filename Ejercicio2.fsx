let filterArrayWithSubArray (subArray:string) (arrayList: string list) =
   List.filter (fun (str: string) -> str.Contains(subArray)) arrayList

printf("Ejemplos de las indicaciones\n")

let checkMyList = ["la casa"; "el perro"; "pintando la cerca"]
let subArray = "la"
let result = filterArrayWithSubArray subArray checkMyList
printfn "Resultado: %A" result

printf("\n")
printf("Ejemplos adicionales\n")
let checkMyList2 = ["la casa"; "El perro"; "pintando la cerca"; "La casa"; "pintando. La cerca"]
let subArray2 = "la"
let result2 = filterArrayWithSubArray subArray2 checkMyList2
printfn "Resultado: %A" result2