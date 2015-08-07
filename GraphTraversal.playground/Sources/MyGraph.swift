import Foundation

public class Vertex: Hashable, Equatable, CustomStringConvertible, CustomDebugStringConvertible {
	//A Vertex is required to have a unique name.
	var name: String
	init (_ name: String) {
		self.name = name
	}
	
	public var hashValue: Int {
		return name.hashValue
	}
	
	public var description: String {
		return name
	}
	
	public var debugDescription: String {
		return name
	}
}

public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
	return lhs.name == rhs.name
}

public class Graph {
	//follows the adjacency matrix format.
	var vertices: [Vertex] = []
	
	typealias Edge = (destination: Vertex, weight: Int)
	var edges: [Vertex: [Edge]] = [:]
	
	public init() {}
	
	public func addVertex(name: String) -> Vertex {
		let newVertex = Vertex(name)
		
		vertices.append(newVertex)
		return newVertex
	}
	
	public func addEdge(source: Vertex, neighbour: Vertex, weight: Int = 1) {
		let newEdge = (destination: neighbour, weight: weight)
		let revEdge = (destination: source, weight: weight)
		if edges[source] != nil {
			edges[source]!.append(newEdge)
		} else {
			edges[source] = [newEdge]
		}
		
		if edges[neighbour] != nil {
			edges[neighbour]!.append(revEdge)
		} else {
			edges[neighbour] = [revEdge]
		}
		
	}
	
	public func adjacent(source: Vertex, neighbour: Vertex) -> Bool {
		let surrounding = neighbours(source)
		
		if surrounding.contains(neighbour) {
			return true
		}
		
		return false
	}
	
	public func neighbours(source: Vertex) -> [Vertex] {
		var found = [Vertex]()
		if let leavingEdges = edges[source] {
			leavingEdges.forEach {
				found.append($0.destination)
			}
		}
		
    	return found
	}
	
	public func length(source: Vertex, destination: Vertex) -> Int? {
		let edge = edges[source]?.filter({ $0.destination == destination })
		return edge?.first?.weight
	}
	
	enum Discovered {
		case Not
		case Yes
		case Visited
	}
	
	public func breadthFirstSearch(source: Vertex, dest: Vertex) -> String {
		var discovered = [source: Discovered.Not]
		var parent: [Vertex: Vertex] = [:]
		var distance = [source: 0]
		
		let queue = Queue<Vertex>()
		queue.enQueue(source)
		
		print("BreadthFirstSearch")
		
		while !queue.isEmpty() {
			
			let u = queue.deQueue()!
			print(u)
			
			neighbours(u).forEach {
				if discovered[$0] == nil {
					$0
					discovered[$0] = .Yes
					distance[$0] = distance[u]! + 1
					
					parent[$0] = u
					
					queue.enQueue($0)
				}
			}
    	}
		
		var pathStr = String()
		var revRoute: [Vertex] = []
		var backtrack: Vertex? = dest
		while backtrack != nil {
			revRoute += [backtrack!]
			backtrack = parent[backtrack!]
		}
		
		revRoute.reverse().forEach {
			pathStr += "\($0) -> "
		}
		
		return pathStr.substringToIndex(advance(pathStr.endIndex, -4)) + ". steps: \(distance[dest]!)"
	}
	
	public func depthFirstSearch(source: Vertex, dest: Vertex) -> String {
		var discovered = [source: Discovered.Not]
		var parent: [Vertex: Vertex] = [:]
		var distance = [source: 0]
		let stack = SwiftStack<Vertex>()
		stack.push(source)
		
		print("DepthFirstSearch")
		
		while !stack.isEmpty() {
			let u = stack.pop()!
			print(u)
			
			neighbours(u).forEach {
    			if discovered[$0] == nil {
					parent[$0] = u
					distance[$0] = distance[u]! + 1
					stack.push($0)
				}
			}
			discovered[u] = .Yes
		}
		
		var pathStr = String()
		var revRoute: [Vertex] = []
		var backtrack: Vertex? = dest
		while backtrack != nil {
			revRoute += [backtrack!]
			backtrack = parent[backtrack!]
		}
		
		revRoute.reverse().forEach {
			pathStr += "\($0) -> "
		}
		
		return pathStr.substringToIndex(advance(pathStr.endIndex, -4)) + ". steps: \(distance[dest]!)"
	}
	
	public func dijkstra(source: Vertex, dest: Vertex) -> String {
		
		var distance = [source: 0]
		var previous: [Vertex: Vertex] = [:]
		
		let pq = PriorityQueue<Vertex>()
		
		vertices.forEach {
			if $0 != source {
				distance[$0] = Int.max
			}
			pq.push(distance[$0]!, item: $0)
		}
		
		print("Dijkstra")
		
		while !pq.isEmpty {
			let (cost, u) = pq.pop()
			print("(\(u), \(cost))")
			
			neighbours(u).forEach {
				let alt = distance[u]! + self.length(u, destination: $0)!
				if alt < distance[$0] {
					distance[$0] = alt
					previous[$0] = u
					pq.updatePriority(alt, item: $0)
				}
			}
		}
		
		var pathStr = String()
		var revRoute: [Vertex] = []
		var backtrack: Vertex? = dest
		while backtrack != nil {
			revRoute += [backtrack!]
			backtrack = previous[backtrack!]
		}
		
		revRoute.reverse().forEach {
			pathStr += "\($0) -> "
		}
		
		return pathStr.substringToIndex(advance(pathStr.endIndex, -4)) + ". cost: \(distance[dest]!)"
	}
}