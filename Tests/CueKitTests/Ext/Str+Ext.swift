import Foundation

extension String {
   /**
    * ## Examples:
    * randomString(str: .letters, len: 10) // cPNejXzp2p
    */
   static let letters: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
   static func randomString(str: String = .letters, len: Int) -> String {
      String((0..<len).compactMap { _ in str.randomElement() })
   }
}
