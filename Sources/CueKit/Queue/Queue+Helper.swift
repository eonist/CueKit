import Foundation
/**
 * helper
 */
extension Queue {
   /**
    * Execute task
    * - Note: We don't use weak self in iterate closure, because queue is static
    * - Parameter task: Task with work to be done
    */
   internal func execute(task: TaskKind) {
      // Swift.print("Execute current state: \(state)")
      state = .executing // Only execute one task at the time
      let tempOnComplete = task.onComplete // Copy the prev onComplete, we call it later
      let iterate = makeIterate(task: task) // We have to make the iterator outside the closure bellow
      task.onComplete = { value in tempOnComplete(value); iterate() } // We call the old onComplete and then iterate (remove top item, as it was just completed)
      task.execute() // Execute task
   }
   typealias Iterate = () -> Void
   /**
    * Iterator maker
    */
   private func makeIterate(task: TaskKind) -> Iterate {
      let iterate: Iterate = { [weak self] in// Closure to call after onComplete is called etc
         // Swift.print("iterate - tasks.count: \(tasks.count)")
         self?.state = .idle // Executing state was concluded, reset queue state
         guard let task = self?.dequeue() else { Swift.print("Queue is empty"); return } // Don't execute if queue is empty etc
         self?.execute(task: task)
      }
      return iterate
   }
}
