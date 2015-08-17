//: [Previous](@previous)

var aGraph = Graph()

let arad = aGraph.addVertex("Arad")
let zerind = aGraph.addVertex("Zerind")
let sibiu = aGraph.addVertex("Sibiu")
let timisoara = aGraph.addVertex("Timisoara")
let oradea = aGraph.addVertex("Oradea")
let lugoj = aGraph.addVertex("Lugoj")
let mehadia = aGraph.addVertex("Mehadia")
let dobreta = aGraph.addVertex("Dobreta")
let fagaras = aGraph.addVertex("Fagaras")
let craiova = aGraph.addVertex("Craiova")
let pitesti = aGraph.addVertex("Pitesti")
let bucharest = aGraph.addVertex("Bucharest")
let giurgiu = aGraph.addVertex("Giurgiu")
let urziceni = aGraph.addVertex("Urziceni")
let rimnicu = aGraph.addVertex("Rimnicu Vilea")
let hirsova = aGraph.addVertex("Hirsova")
let eforie = aGraph.addVertex("Eforie")
let vaslui = aGraph.addVertex("Vaslui")
let iasi = aGraph.addVertex("Iasi")
let neamt = aGraph.addVertex("Neamt")

aGraph.addEdge(arad, neighbour: zerind, weight: 75)
aGraph.addEdge(arad, neighbour: sibiu, weight: 140)
aGraph.addEdge(arad, neighbour: timisoara, weight: 118)
aGraph.addEdge(zerind, neighbour: oradea, weight: 71)
aGraph.addEdge(oradea, neighbour: sibiu, weight: 151)
aGraph.addEdge(sibiu, neighbour: fagaras, weight: 99)
aGraph.addEdge(sibiu, neighbour: rimnicu, weight: 80)
aGraph.addEdge(rimnicu, neighbour: pitesti, weight: 97)
aGraph.addEdge(rimnicu, neighbour: craiova, weight: 146)
aGraph.addEdge(bucharest, neighbour: giurgiu, weight: 90)
aGraph.addEdge(timisoara, neighbour: lugoj, weight: 111)
aGraph.addEdge(lugoj, neighbour: mehadia, weight: 70)
aGraph.addEdge(mehadia, neighbour: dobreta, weight: 75)
aGraph.addEdge(dobreta, neighbour: craiova, weight: 120)
aGraph.addEdge(craiova, neighbour: pitesti, weight: 138)
aGraph.addEdge(fagaras, neighbour: bucharest, weight: 211)
aGraph.addEdge(pitesti, neighbour: bucharest, weight: 101)
aGraph.addEdge(bucharest, neighbour: urziceni, weight: 85)
aGraph.addEdge(urziceni, neighbour: vaslui, weight: 142)
aGraph.addEdge(vaslui, neighbour: iasi, weight: 92)
aGraph.addEdge(iasi, neighbour: neamt, weight: 87)
aGraph.addEdge(urziceni, neighbour: hirsova, weight: 98)
aGraph.addEdge(hirsova, neighbour: eforie, weight: 86)

aGraph.depthFirstSearch(arad, dest: bucharest)
aGraph.breadthFirstSearch(arad, dest: bucharest)
aGraph.dijkstra(arad, dest: bucharest)

func heuristicValue(of: Vertex) -> Int {
	let lookup = [arad: 366, bucharest: 0, craiova: 160, dobreta: 242, eforie: 161, fagaras: 178, giurgiu: 77, hirsova: 151, iasi: 226, lugoj: 244, mehadia: 241, neamt: 234, oradea: 380, pitesti: 98, rimnicu: 193, sibiu: 253, timisoara: 329, urziceni: 80, vaslui: 199, zerind: 374]
	return lookup[of]!
}

aGraph.aStar(arad, dest: bucharest, heuristic: heuristicValue)


//: [Next](@next)
