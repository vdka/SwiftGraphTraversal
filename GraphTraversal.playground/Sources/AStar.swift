public extension Graph {
	
	public func aStar(source: Vertex, dest: Vertex, heuristic: (Vertex) -> (Int)) -> String {
		
		var distance = [source: 0]
		var previous: [Vertex: Vertex] = [:]
		var discovered: [Vertex: Bool] = [source: true]
		var destinationFound = false
		
		let pq = PriorityQueue<Vertex>()
		
		pq.push(0, item: source)
		
		while !pq.isEmpty {
			
			let (cost, u) = pq.pop()	//get the next node in the PQueue
			print("(\(u), \(cost))")
			
			if u == dest {
				destinationFound = true
				break
			}
			
			neighbours(u).forEach {
				if discovered[$0] == nil {
    				let pDist: Int
    				if let pathDistance = distance[u] {
    					pDist = self.length(u, destination: $0)! + pathDistance
    				} else {
    					pDist = self.length(u, destination: $0)!
    				}
    				
    				pq.push(pDist + heuristic($0), item: $0)
					
    				if pDist < distance[u] {
    					pq.updatePriority(pDist + heuristic($0), item: $0)
    				}
					
					distance[$0] = pDist
					previous[$0] = u
					discovered[$0] = true
    			}
			}
		}
		
		var pathStr = String()
		var revRoute: [Vertex] = []
		var backtrack: Vertex? = dest
		
		while let previousNode = backtrack {
			revRoute += [previousNode]
			backtrack = previous[previousNode]
		}
		
		revRoute.reverse().forEach {
			pathStr += "\($0) -> "
		}
		if destinationFound {
    		return pathStr.substringToIndex(advance(pathStr.endIndex, -4)) + ". cost: \(distance[dest]!)"
		} else {
			return "Destination not found!"
		}
	}
}