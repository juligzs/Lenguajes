type Maze = (int * int list) list
let graphMaze : Maze = [
                                    (1,[7]);     
                                    (2,[3;8]);     
                                    (3,[2;4;9]);     
                                    (4,[3;10]);     
                                    (5,[6;11]);   
                                    (6,[5]);         
                                    (7,[1;13]);     
                                    (8,[2;9]);       
                                    (9,[3;8]);       
                                    (10,[4;16]);     
                                    (11,[5;17]);    
                                    (12,[18]);     
                                    (13,[7;14]);     
                                    (14,[13;15;20]);  
                                    (15,[14;21]);     
                                    (16,[10;22]);   
                                    (17,[11;23]);     
                                    (18,[12;24]);   
                                    (19,[25]);      
                                    (20,[14;26]);    
                                    (21,[15;22]);   
                                    (22,[16;21]);     
                                    (23,[17;29]);      
                                    (24,[18;30]);    
                                    (25,[19;31]);    
                                    (26,[20;27]);    
                                    (27,[26;28]);     
                                    (28,[27;29;34]); 
                                    (29,[23;28]);     
                                    (30,[24;36]);     
                                    (31,[25;32]);     
                                    (32,[31;33]);     
                                    (33,[32;34]);     
                                    (34,[28;33;35]);  
                                    (35,[34;36]);     
                                    (36,[35;30]);     
                        ]

let findAllPathsDFS (graph: Maze) start endCase =
    let rec dfs path currentCase =
        if currentCase = endCase then
            [List.rev (currentCase::path)]  
        else
            match List.tryFind (fun (case, neighbors) -> case = currentCase) graph with
            | Some (_, neighbors) ->
                let validNeighbors = List.filter (fun c -> not (List.contains c path)) neighbors
                List.collect (dfs (currentCase::path)) validNeighbors  
            | None -> []

    dfs [] start

let printPaths paths =
    paths |> List.iter (fun path ->
        printfn "Path found: %A" path
    )

let allPaths = findAllPathsDFS graphMaze 2 32

printPaths allPaths

let findShortestPathBFS (graph: Maze) start endCase =
    let rec bfs queue visited =
        match queue with
        | [] -> None 
        | (currentCase, path) :: rest when currentCase = endCase -> Some (List.rev (currentCase::path)) 
        | (currentCase, path) :: rest ->
            // Get neighbors of the current case that haven't been visited
            match List.tryFind (fun (case, _) -> case = currentCase) graph with
            | Some (_, neighbors) ->
                let unvisitedNeighbors =
                    neighbors
                    |> List.filter (fun c -> not (List.contains c visited))
                    |> List.map (fun c -> (c, currentCase::path))
                let newQueue = rest @ unvisitedNeighbors
                bfs newQueue (currentCase :: visited)
            | None -> None 

    bfs [(start, [])] []

match findShortestPathBFS graphMaze 2 32 with
| Some shortestPath -> printfn "Shortest path: %A" shortestPath
| None -> printfn "No path found"