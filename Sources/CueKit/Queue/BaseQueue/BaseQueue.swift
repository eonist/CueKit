import Foundation
/**
 * - Caution: ⚠️️ using extension is not supported with generic or protocols as params etc
 * - Fixme: ⚠️️ Could we replace enqueue and dequeue with didSet and get etc?
 */
open class BaseQueue<T>: Queuable {
   internal var items: [T] = [] // - Fixme: ⚠️️ Rename to elements? collection?
   public init() {}
   /**
    * Add
    * - Parameter task: task with work to be done
    */
   open func enqueue(_ item: T) { // - Fixme: ⚠️️ Make param explicit
      items.append(item)
   }
   /**
    * Remove and return top item or nil if queue is empty
    */
   open func dequeue() -> T? {
      guard !items.isEmpty else { return nil } // Nothing more in the queue
      return items.removeFirst()
   }
   /**
    * Clear the queue
    */
   open func clear() {
      items = []
   }
   /**
    * Add (bulk)
    * - Parameter items: Tasks with work to be done
    */
   public func enqueue(_ items: [T]) { // - Fixme: ⚠️️ make param explicit
      items.forEach { enqueue($0) }
   }
}
