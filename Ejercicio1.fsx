let shiftMyList direction times myList =
    let length = List.length myList
    let adjusted =
        match direction with
        | "left" -> times % length
        | "right" -> length - times % length
        | _ -> 0

    if adjusted < 0 then
        List.init length (fun _ -> 0)
    else
        List.concat [List.skip adjusted myList; List.take adjusted myList]

//Test cases based on the examples
let listT1 = [1; 2; 3; 4; 5]
let resultT1 = shiftMyList "left" 3 listT1  // [4; 5; 0; 0; 0]

let listT2 = [1; 2; 3; 4; 5]
let resultT2 = shiftMyList "right" 2 listT2 // [0; 0; 1; 2; 3]

let listT3 = [1; 2; 3; 4; 5]
let resultT3 = shiftMyList "left" 6 listT3 // [0; 0; 0; 0; 0]

let listT4 = [1; 2; 3; 4; 5]
let resultT4 = shiftMyList "right" 3 listT4  // [3; 4; 5; 0; 0]

let listT5 = [1; 2; 3; 4; 5]
let resultT5 = shiftMyList "left" 2 listT5 // [0; 0; 0; 1; 2]

let listT6 = [1; 2; 3; 4; 5]
let resultT6 = shiftMyList "left" 6 listT6 // [0; 0; 0; 0; 0]

printf("Ejemplos de las indicaciones\n")
printfn "Resultado 1: %A" resultT1
printfn "Resultado 2: %A" resultT2
printfn "Resultado 3: %A" resultT3
printf("\n")
printf("Ejemplos adicionales\n")
printfn "Resultado 4: %A" resultT4 
printfn "Resultado 5: %A" resultT5
printfn "Resultado 6: %A" resultT6