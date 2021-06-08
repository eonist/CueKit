import Foundation
/**
 * Core
 */
extension Task {
   /**
    * Begins and performs the execution of work.
    * - Note: Default run method, execute operation / sync/async call, called by queue, should be overridden
    * - Note: Here we begin async callbacks that end with a final onComplete
    * - Note: We can add single or nested callbacks
    * - Note: Avoid changing state inside callbacks, should be clean begin, clean exit with result
    */
	@objc open func execute() {
      fatalError("⚠️️ Should be overridden in subclass ⚠️️") // Add work in overriding method in subclass
	}
   /**
    * Advises the task object that it should stop executing it's work.
    * - Note: Called if timeout is invoked or if the user calls it like a cancel call
    * - Note: This method exist as an opportunity to clean up (override it)
    * - Note: Override this method and stop network calls, and set callbacks to void etc, cleanup
    * - Note: This method also works as a cancel method, as the final onComplete never will be called if state is: .didFail
    * - Caution: ⚠️️ Only the final onComplete should change state. Because we basically block it with the isCanceled flag
    * - Caution: ⚠️️ Override this and call onComplete in subclasses, or elese Queue wont finish etc
    */
	@objc open func fail() {
		state = .didFail 
      self.onComplete(nil) // needed to make cancel work
	}
   /**
    * - Note: Cancel avoids retry
    */
   @objc open func cancel() {
      guard self.state == .idle else { /*Swift.print("Already completed: \(self.state)"); */return } // must be idle
      self.fail()
   }
}
