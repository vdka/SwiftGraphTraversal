import Foundation

extension Array {
	func forEach(iterator: (Element) -> Void) -> Array {
		for item in self {
			iterator(item)
		}
		
		return self;
	}
}
