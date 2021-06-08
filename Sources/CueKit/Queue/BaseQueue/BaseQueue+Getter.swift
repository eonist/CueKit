import Foundation

extension BaseQueue {
   public var size: Int { items.count }
   public var head: T? { items.first } // First
   public var tail: T? { items.last } // Last
   public var isEmpty: Bool { items.isEmpty }
}
