import Foundation
/**
 * - Note: Use these getters to reason about state, as state it self is internal
 */
extension Task {
   /**
    * A Boolean value indicating whether the operation has failed
    */
   public var hasFailed: Bool { state == .didFail }
   /**
    * A Boolean value indicating whether the operation is currently executing or has not begun.
    */
   public var isIdle: Bool { state == .idle }
   /**
    * A Boolean value indicating whether the operation has finished executing its task.
    */
   public var hasSucceded: Bool { state == .didSucceed }
}
