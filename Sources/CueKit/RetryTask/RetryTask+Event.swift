import Foundation

extension RetryTask {
   /**
    * Make sure to cleanup before retrying etc?
    * - Parameter value: the value passed from work done in the execute method
    */
   open override func handleComplete(value: Any?) { // - Fixme: ⚠️️ make this _ value: Any?
      // Swift.print("RetryTask.handleComplete value: \(String(describing: value))")
      if value == nil && curRetry < retryCount { curRetry += 1; execute() } // Attempt retry
      else { super.handleComplete(value: value) } // Default behaviour, value is not nil, or retry attempts are consumed
   }
}
