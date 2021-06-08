import XCTest
/*@testable */import CueKit

final class CueKitTests: XCTestCase {
   /**
    * Tests
    */
   func tests() {
      Swift.print("tests")
      testNetworkTask()
      testQueue()
      testCancel()
   }
}
extension CueKitTests {
   /**
    * - Fixme: ⚠️️ Add string ext that can pull string from data with variable call
    */
   private func testNetworkTask() {
      Swift.print("testNetworkTask ⚡️")
      let expectation = self.expectation(description: "Waiting for server to complete.") // Make a ref to the expectation.
      // Wait for expectations for a maximum of 2 seconds.
      let networkTask: NetworkTask = .init()
      networkTask.onComplete = { /*[weak self]*/ (_ value: Any?) in
         // Swift.print("networkTask.onComplete")
         guard let strValue: String = (value as? Data)?.stringUTF8 else { XCTFail(); return }
         Swift.print("networkTask.strValue:  \(strValue) ✅")
         expectation.fulfill() // if this line is called, then test passed
      }
      networkTask.execute()
      waitForExpectations(timeout: 15) { error in // wait
         XCTAssertNil(error)
      }
   }
   /**
    * Test queue
    */
   private func testQueue() {
      Swift.print("testQueue begin 🚂")
      let expectation = self.expectation(description: "Waiting for all network calls to complete.") // Make a ref to the expectation.
      let networkTasks: [NetworkTask] = (0..<5).map { _ in // Create 5 network tasks
         .init { /*[weak self] */ (_ value: Any?) in
            guard let strValue: String = (value as? Data)?.stringUTF8 else { XCTFail(); return }
            Swift.print("strValue:  \(strValue) ✨")
         }
      } // For loop network task
      let queue: Queue = .init()
      queue.onComplete = {
         Swift.print("queue test completed ✅")
         expectation.fulfill() // If this line is called, then test passed
      }
      queue.enqueue(networkTasks) // Add tasks and begin executing
      waitForExpectations(timeout: 60 * 2) { error in // Wait max 2 minutes
         XCTAssertNil(error)
      }
   }
   /**
    * Test cancel
    * - Fixme: ⚠️️ Add Queue that is instance?
    * - Fixme: ⚠️️ Make queue support TaskKind?
    * 1. Create many tasks
    * 2. Enque many tasks
    * 3. Randomly cancel some of them etc
    * 4. After 12 seconds cancel queue.last
    */
   private func testCancel() { // - Fixme: ⚠️️ Rename to testCancelMultiple ?
      Swift.print("testCancel begin 🚫")
      let expectation = self.expectation(description: "Waiting for all network calls to complete (some may cancel).") // Make a ref to the expectation.
      let networkTasks: [NetworkTask] = (0..<10).map { _ in // Create 5 network tasks
         .init { /* [weak self] */ (_ value: Any?) in
            guard let strValue: String = (value as? Data)?.stringUTF8 else { /*XCTFail(); */ Swift.print("completed with nil 👎"); return }
            Swift.print("Completed with strValue:  \(strValue) 👍")
         }
      } // For loop network task
      let queue: Queue = .init()
      queue.onComplete = {
         Swift.print("queue w/ cancel test completed ✅")
         expectation.fulfill() // If this line is called, then test passed
      }
      queue.enqueue(networkTasks) // Add tasks and begin executing
      DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(5)) { // block after some time etc:
         Swift.print("⚠️️ Cancel after 5secs ⚠️️")
         // - Fixme: ⚠️️ here we could use better range and maybe random items?
         networkTasks[3..<networkTasks.count-2].enumerated().forEach { (idx, block) in // You skip the first three download blocks by slicing the blocks array.
            if Bool.random() { // Here you use Bool.random() to randomly pick between true and false. It's like a coin toss.
               Swift.print("⚠️️ Cancel idx: \(idx) ⚠️️")
               block.cancel() // If the random value is true, you cancel the block. This can only cancel blocks that are still in a queue and haven't began executing. You can't cancel a block in the middle of execution.
            }
         }
      }
      DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(10)) { // block after some time etc:
         Swift.print("⚠️️ Cancel last item after 10secs ⚠️️: \(queue.size)")
         networkTasks.last?.cancel() // Stop after 2 items are processed etc
      }
      waitForExpectations(timeout: 60 * 3) { error in // Wait max 3 minutes
         XCTAssertNil(error)
      }
   }
   /**
    *
    */
   func testNestedQueues() {
      // make sure QueueTask has ability to cancel all tasks in queues etc
   }
}
/**
 * - Fixme: ⚠️️ Could also use result type?
 */
extension CueKitTests {
   /**
    * Test (complex pseudo test)
    * - Fixme: ⚠️️ make nested queue test
    */
   func testingSomethingComplex() {
      // If we make mock calls, we can actually UnitTest the sync processes etc
      
      // Tasks: propegate updates to devices (multiple) // 👉 We need nested task support 👈
      // // Task: (send payload) (timeout 20sec)
      // // Task: if success -> receive remote update (timeout 20sec)
      
      // look for devices to sync to
      
      // send handshake
      
      // listen for handshake
      
      // look for devices if they are connectable (for device list last seen flag / date)
   }
}
