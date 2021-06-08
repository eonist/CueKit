import Foundation
/**
 * - Note: has a timeout
 * - Fixme: ⚠️️ Maybe add UUID to each task to be able to debug easier
 */
open class Task: TaskKind {
	internal var state: TaskState = .idle // State of the task (idle, fail, success)
   /**
    * - Caution: ⚠️️ Must never be called from other than handleComplete (because Queue re-assigns the callback etc)
    */
	public var onComplete: OnComplete = defaultOnComplete // Work complete callback
   /**
    * Init
    * - Parameters:
    *   - onComplete: Final completion closure with the result of an work closure
    *   - timeOut: Timeout before cancel (fail) is called
    */
   public init(timeOut: Double = 30, onComplete: @escaping OnComplete = defaultOnComplete) {
		self.onComplete = onComplete
		DispatchQueue.main.asyncAfter(deadline: .now() + timeOut) {
         if self.state == .idle { // Must be still in idle mode
            Swift.print("Timeout 💥")
            self.fail() // Fail works like cancel
         }
		}
	}
}
