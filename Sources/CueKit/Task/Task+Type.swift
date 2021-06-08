import Foundation
/**
 * Type
 */
extension Task {
   /**
    * Default callback
    * - Note: variables cant be stored in protocols, so its stored here
    */
   public static let defaultOnComplete: TaskKind.OnComplete = { _ in }
}
