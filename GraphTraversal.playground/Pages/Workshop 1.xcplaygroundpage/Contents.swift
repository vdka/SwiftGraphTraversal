//NOTE: Each Vertex is required to have a unique name. Behaviour without unique names is undefined.
//		This is a result of how equaltiy for nodes are checked.

public var graph = Graph()

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

graph.breadthFirstSearch(sNode, dest: gNode)
graph.depthFirstSearch(sNode, dest: gNode)
graph.dijkstra(sNode, dest: gNode)
