import Foundation
/**
 * We might want to call iterate on the main thread, as closures might call onComplete on other threads etc
 * We deal with retry on the task level
 * - Fixme: ⚠️️ We could make this generic, but protocol also works. Generics sometimes is confusing/limited to override etc, see TestRunner, PaginationService etc for inspo regarding generic collection classes like this
 * - Fixme: ⚠️️ Consider making queue an instance class and not static. And then making a singleton in the code that uses queue? We might want to have queues within queues etc?
 * ## Examples:
 * let a: Task = .init() { onComplete in Timer(sec: 2) { print("Add account"); onComplete() } }
 * let b: Task = .init() { onComplete in Timer(sec: 4) { print("Update account"); onComplete() } }
 * let c: Task = .init() { onComplete in Timer(sec: 3) { print("Remove account"); onComplete() } }
 * Queue.enqueue([a, b, c]) // Add and begin iterating
 */
final public class Queue: BaseQueue<TaskKind> {
   public var onComplete: OnComplete = { print("Queue.onComplete - default") }
   internal var state: QueueState = .idle
   public override init() {}
   /**
    * Add
    * - Note: Begins executing if in idle state, or else will be executed later
    * - Parameter task: task with work to be done
    */
   public override func enqueue(_ task: TaskKind) {
      // Swift.print("enqueue")
      super.enqueue(task)
      guard case .idle = state else { return } // Only execute one task at the time
      guard let task: TaskKind = dequeue() else { return }
      execute(task: task)
   }
   /**
    * Remove and return top item or nil if queue is empty
    */
   public override func dequeue() -> TaskKind? {
      // Swift.print("dequeue")
      if items.isEmpty { onComplete() } // Nothing more in the queue
      return super.dequeue()
   }
   /**
    * Clear the queue
    * - Note:
    */
   public override func clear() {
      super.clear()
      state = .idle
   }
}
