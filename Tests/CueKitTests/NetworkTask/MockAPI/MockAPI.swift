import Foundation

final class MockAPI {
   /**
    * General network response time
    */
   static var networkLatency: Range<Int> { 1..<4 }
   /**
    * Returns mock data `cPNejXzp2p` etc as Data
    */
   static var data: Data { // - Fixme: ⚠️️ make optional
      let str: String = .randomString(str: .letters, len: 10) // cPNejXzp2p
      return str.data(using: .utf8) ?? .init()
   }
}

