import Foundation
/**
 * Core
 * - Fixme: ⚠️️ Add Server class from mock network API, from pagination project 👈
 * - Note: You should override fail, to clean up and disconnect etc in a real subclass
 */
extension NetworkTask {
   typealias Server = MockAPI // Convenient
   /**
    * - Note: Sleep random 1-3 secs
    * - Note: Return random nil or "payload"
    */
	override func execute() {
      // Swift.print("NetworkTask.execute")
      // - Fixme: ⚠️️ Add weak self etc
		Server.getData { data in
         self.handleComplete(value: data)
		}
	}
}
