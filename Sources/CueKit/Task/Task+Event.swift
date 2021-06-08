import Foundation

extension Task {
   /**
    * When execution has produced a value, this is called
    * - Note: if value is nil, then task failed
    * - Note: this is called by the work closure that is added to the task
    * - Parameter value: the value passed from work done in the execute method
    */
   @objc open func handleComplete(value: Any?) {
      // Swift.print("Task.handleComplete state: \(state) value: \(String(describing: value))")
      if value == nil { fail() } // nil value, means closure failed
      else {
         state = .didSucceed
         onComplete(value)
      } // Set state to success
      //      guard state != .didFail else { return } // if task was canceled don't call complete
      // Swift.print("before onComplete")
   }
}
