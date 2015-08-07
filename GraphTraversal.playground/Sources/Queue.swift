import Foundation

//generic queue node

class QNode<T> {
	
	var key: T? = nil
	var next: QNode? = nil
	
}

public class Queue<T> {
	
	private var top: QNode<T>! = QNode<T>()
	
	public init() {}
	
	//the number of items
	public var count: Int {
		
		
		if (top.key == nil) {
			return 0
		}
			
		else  {
			
			var current: QNode<T> = top
			var x: Int = 1
			
			
			//cycle through the list of items
			while (current.next != nil) {
				current = current.next!;
				x++
			}
			
			return x
			
		}
	}
	
	
	
	//enqueue the specified object
	public func enQueue(key: T) {
		
		
		//check for the instance
		if (top == nil) {
			top = QNode<T>()
		}
		
		
		//establish the top node
		if (top.key == nil) {
			top.key = key;
			return
		}
		
		let childToUse: QNode<T> = QNode<T>()
		var current: QNode = top
		
		
		//cycle through the list of items to get to the end.
		while (current.next != nil) {
			current = current.next!
		}
		
		
		//append a new item
		childToUse.key = key;
		current.next = childToUse;
		
	}
	
	
	//retrieve the top most item
	public func peek() -> T? {
		return top.key!
	}
	
	
	//retrieve items from the top level in O(1) constant time
	public func deQueue() -> T? {
		
		
		//determine if the key or instance exist
		let topitem: T? = self.top?.key
		
		if (topitem == nil) {
			return nil
		}
		
		//retrieve and queue the next item
		let queueitem: T? = top.key!
		
		
		//use optional binding
		if let nextitem = top.next {
			top = nextitem
		}
		else {
			top = nil
		}
		
		
		return queueitem
		
	}
	
	
	//check for the presence of a value
	public func isEmpty() -> Bool {
		
		//determine if the key or instance exist
		if let _: T = self.top?.key {
			return false
		}
			
		else {
			return true
		}
		
	}
	
	
	
	
	
} //end class
