import Foundation
/**
 * - Note: Adds ability to retry work
 * - Note: timeout is for all retries. if all retries is not completed with n-amount of time. then timout is invoked
 * - Fixme: ⚠️️ Add Server class from mock network api, from pagination project 👈
 */
open class RetryTask: Task {
   var curRetry: Int = 0
   let retryCount: Int // - Fixme: ⚠️️ Rename to maxRetry?
   /**
    * - Fixme: ⚠️️ Add doc
    * - Parameters:
    *   - retryCount: Number of times the callback will try to get a result other than nil
    *   - timeOut: Seconds before onComplete is called with nil
    *   - onComplete: Callback to be called after the work is completed in the execute method
    */
   public init(retryCount: Int = 5, timeOut: Double = 30, onComplete: @escaping OnComplete = defaultOnComplete) {
      self.retryCount = retryCount
      super.init(timeOut: timeOut, onComplete: onComplete)
   }
}
