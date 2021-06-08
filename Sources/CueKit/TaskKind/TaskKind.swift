import Foundation
/**
 * - Fixme: ⚠️️ Rename to Executable? since Queue might need to adher to it as well?
 */
public protocol TaskKind: AnyObject {
   func execute()
   func fail() // Called from timeout, and
   var onComplete: OnComplete { get set }
}
