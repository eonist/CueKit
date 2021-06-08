import Foundation
/**
 * - Note: Not really needed, but a nice overview of core methods
 */
protocol Queuable {
   associatedtype T
   var items: [T] { get set }
   func enqueue(_ items: T)
   func enqueue(_ items: [T])
   func dequeue() -> T?
   func clear()
}
