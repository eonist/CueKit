import Foundation
/**
 * String
 */
extension Data {
   /**
    * Returns String for Data (utf8)
    */
   public var stringUTF8: String? { // Convenience method
      return String(data: self, encoding: .utf8) // return NSString(data: self, encoding: String.Encoding.utf8.rawValue) as String?
   }
}
/**
 * Init
 */
extension Data {
   /**
    * Init from T (T -> Data)
    * - Note: Create data from any type
    * - Note: Maybe also do: guard let dataFromString = "".data(using: .utf8) else { return }
    * - Note: Was changed to fix warning in swift 5.3 Ref: https://stackoverflow.com/a/60955323
    * ## Examples:
    * let data: Data = .init(from: "cPNejXzp2p")
    * let str: String = data.to()
    * print(str) // "cPNejXzp2p"
    */
//   public init<T>(from value: T) {
//      var value = value
//      var myData = Data()
//      withUnsafePointer(to: &value) { (ptr: UnsafePointer<T>) -> Void in
//         myData = Data( buffer: UnsafeBufferPointer(start: ptr, count: 1))
//      }
//      self.init(myData)
//   }
   /**
    * Convert Data to type
    * - Parameter type: The type to convert to
    * ## Examples:
    * let str = Data().to(type: String.self)
    * // or
    * let string: String = Data().to()
    */
//   public func to<T>(type: T.Type? = nil) -> T {
//      return self.withUnsafeBytes { $0.load(as: T.self) }
//   }
}
