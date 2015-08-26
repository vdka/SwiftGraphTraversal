public extension Graph {
    public func seperation(source: Vertex, dest: Vertex, maxDepth: Int = Int.max) -> Int? {
		var discovered = [source: true]
		var parent: [Vertex: Vertex] = [:]
		var distance = [source: 0]
		
		let queue = Queue<Vertex>()
		queue.enQueue(source)
		
		while !queue.isEmpty() {
			
			let u = queue.deQueue()!
            
            if distance[u]! > maxDepth {
                return nil
            }
			
			neighbours(u).forEach {
				if discovered[$0] == nil {
					discovered[$0] = true
					distance[$0] = distance[u]! + 1
					
					parent[$0] = u
					
					queue.enQueue($0)
				}
			}
    	}
		
		return distance[dest]
	}
}