import Foundation

extension Queue {
   public var isIdle: Bool { state == .idle }
   public var isExecuting: Bool { state == .executing }
   
}
