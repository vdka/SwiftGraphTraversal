//: [Previous](@previous)

import Foundation

var graph = Graph()

let nNodes = 200
let nEdges = 200

var nodeNames = Set<String>()
var nodes = [Vertex]()

for _ in 1...nNodes {
    var uuid = NSUUID().UUIDString
    nodeNames.insert(uuid)
}

nodeNames.forEach {
    let vertex = graph.addVertex($0)
    nodes.append(vertex)
}

extension Array {
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

func generateRandomEdge() {
    let aNode = nodes.randomItem()
    var bNode = nodes.randomItem()
    while bNode == aNode {
        bNode = nodes.randomItem()
    }
    
    graph.addEdge(nodes.randomItem(), neighbour: nodes.randomItem())
}

for _ in 1...nEdges {
    generateRandomEdge()
}

let aNode = nodes.randomItem()
var bNode = nodes.randomItem()
while bNode == aNode {
    bNode = nodes.randomItem()
}

graph.seperation(aNode, dest: bNode)

var max = 0
var total = 0
var n = 0
var unreachable = 0
var checked = Set<Vertex>()
var unchecked = Set<Vertex>(nodes)
var reachable = Set<Vertex>()

while !unchecked.isEmpty {
    let a = unchecked.removeFirst()
    var r = false
    for b in unchecked {
        guard let dist = graph.seperation(a, dest: b, maxDepth: max + 10) else {
            continue
        }
        if dist > max {
            max = dist
        }
        total += dist
        n++
        r = true
    }
    if r {
        reachable.insert(a)
    }
}

print("max was: \(max) avg was: \(total/n) unreachable nodes: \(nNodes - reachable.count)")

//: [Next](@next)
