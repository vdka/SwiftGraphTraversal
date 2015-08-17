//: [Previous](@previous)

var graph = Graph()

let sNode = graph.addVertex("S")
let aNode = graph.addVertex("A")
let bNode = graph.addVertex("B")
let cNode = graph.addVertex("C")
let dNode = graph.addVertex("D")
let gNode = graph.addVertex("G")

graph.addEdge(sNode, neighbour: aNode, weight: 2)
graph.addEdge(sNode, neighbour: bNode, weight: 3)
graph.addEdge(aNode, neighbour: bNode, weight: 2)
graph.addEdge(aNode, neighbour: dNode, weight: 4)
graph.addEdge(bNode, neighbour: cNode, weight: 5)
graph.addEdge(bNode, neighbour: dNode, weight: 7)
graph.addEdge(dNode, neighbour: gNode, weight: 6)

func heuristicValue(of: Vertex) -> Int {
	let lookup = [sNode: 10, aNode: 8, bNode: 9, dNode: 5, cNode: 10, gNode: 0]
	return lookup[of]!
}

graph.aStar(sNode, dest: gNode, heuristic: heuristicValue)

//: [Next](@next)
