import Foundation
import CueKit
/**
 * Single unit of work, with completion callback
 * - Fixme: ⚠️️ Maybe add retry count to task? or make RetryTask? 🏀
 * - Fixme: ⚠️️ Look over notes, also look at the repos from get lotus 👈
 * - Fixme: ⚠️️ Rename to Transaction? or ASyncTask? or is task better and shorter?
 * - Note: This class is a subclass example, but usefull for general purpouse async tasks
 * ## Examples:
 * override func execute() {
 *   DispatchQueue.global(qos: .background).async {
 *      sleep(2) // Simulates some remote service taking 2.0 sec
 *      callBack(Bool.random() ? "Payload" : nil) // heads or tails
 *   }
 * }
 */
class NetworkTask: RetryTask {}
