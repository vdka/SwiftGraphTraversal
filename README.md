# SwiftGraphTraversal
This repo contains swift code that models a graph. It also implements various graph search methods using various data structures.

## Graph Creation

```swift
var graph = Graph()
```
This line of code will give you a graph with no vertices.
Adding a vertex is done with:
```swift
let a = graph.addVertex("A")
let b = graph.addVertex("B")
```
__Note:__ Vertices should have unique names as the name is used to identify the vertex within the graph. References should also be kept to each node for use with the graphs methods.

Edges can be added between two Vertices with:
```swift
graph.addEdge(a, neighbour: b)
```
or
```swift
graph.addEdge(a, neighbour: b, weight: 8)
```
for weighted graphs.

Traversal techniques include:
```swift
Graph.depthFirstSearch(source: Vertex, dest: Vertex) -> String
Graph.breadthFirstSearch(source: Vertex, dest: Vertex) -> String
Graph.dijkstra(source: Vertex, dest: Vertex) -> String
Graph.aStar(source: Vertex, dest: Vertex, heuristic: (Vertex) -> (Int)) -> String
```
All return a String that details the path found.
