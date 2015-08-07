public class PriorityQueue<T: Equatable> {
	private var heap = Array<(Int, T)>()
	
	public init() {}
	
	public func push(priority: Int, item: T) {
		heap.append((priority, item))
		
		if heap.count == 1 {
			return
		}
		
		var current = heap.count - 1
		while current > 0 {
			let parent = (current - 1) >> 1
			if heap[parent].0 <= heap[current].0 {
				break
			}
			(heap[parent], heap[current]) = (heap[current], heap[parent])
			current = parent
		}
	}
	
	public func pop() -> (Int, T) {
		(heap[0], heap[heap.count - 1]) = (heap[heap.count - 1], heap[0])
		let pop = heap.removeLast()
		heapify(0)
		return pop
	}
	
	public func updatePriority(priority: Int, item: T) {
		let index = heap.indexOf { $0.1 == item }
		heap.removeAtIndex(index!)
		push(priority, item: item)
	}
	
	public func contains(item: T) -> Bool {
		return heap.contains { $0.1 == item }
	}
	
	func heapify(index: Int) {
		let left = index * 2 + 1
		let right = index * 2 + 2
		var smallest = index
		
		if left < heap.count && heap[left].0 < heap[smallest].0 {
			smallest = left
		}
		if right < heap.count && heap[right].0 < heap[smallest].0 {
			smallest = right
		}
		if smallest != index {
			(heap[index], heap[smallest]) = (heap[smallest], heap[index])
			heapify(smallest)
		}
	}
	
	public var count: Int {
		get {
			return heap.count
		}
	}
	
	public var isEmpty: Bool {
		if count == 0 {
			return true
		}
		return false
	}
}