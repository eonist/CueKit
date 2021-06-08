import Foundation
/**
 * Core
 */
extension MockAPI {
   /**
    * Simulate a server call for a data
    * - Abstract: This is the Outward main API call for users to consume.
    * - Parameter complete: The completion call-back when the pseudo work has completed
    */
   public static func getData(complete: @escaping GetDataComplete) {  // We might have to use a method to be able to use T
      DispatchQueue.global(qos: .background).async {
         sleep(UInt32(networkLatency.randomElement()!)) // Sleep between 1 and 4 secs to simulate network call
         // Fix maybe only fail in 1 out of 5 not 1 out of 2?
         let eitherOr: Bool = !(Bool.random() && Bool.random()) // 1 in 4 arc4random_uniform(2) == 0 // heads or tails // Bool.random()
         // Swift.print("Doing some work 💪, success: \(eitherOr ? "✅" : "🚫")")
         // - Fixme: ⚠️️ maybe call on mainthread?
         complete(eitherOr ? data : nil)
      }
   }
}
