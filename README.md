[![Tests](https://github.com/sentryco/CueKit/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/CueKit/actions/workflows/Tests.yml)

# CueKit 🚂
Interruptible queuing system for closures

> on cue - a signal for action

### Description 🏷
A way to run tasks one after the other. (with support for canceling tasks)

### Problem 🤯
- Hard to queue up tasks that needs to be preformed one after the other
- Hard to unit-test network code
- Async network code all over the place is hard to reason about and hard to make bug free
- Features such as `timeout` and `retry` are hard to build into DispatchWorkItem or NSOperationQueue

### Solution: 💊
- Ability to add and remove items to the queue
- The Queue should be able to be run from start to finish
- Has tasks that can .start() and .stop() and has .onComplete() callback
- Tasks should have the ability to support timeout and retry
- The Queue should be able to paused/stopped, resumed/started, reset/canceled (⚠️️ resume is not supported, only cancel ⚠️️)
- Queues should be able to be nested? Queues within queues? (maybe) (reach-goal, ⚠️️ not currently supported ⚠️️) 🤔

### Example:
```swift
let networkTasks: [NetworkTask] = (0..<5).map { _ in // Create 5 network tasks
   .init { (_ value: Any?) in
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
```

### Todo: 📝
- Look at pagination service project for mock-api inspo ✅
- Take a look at TestRunner (it has FIFO style architecture) ✅
- Add timeout callback? ✅ (would need to separate network and db transaction in one task, in order to cancel transaction if network task is not complete etc) (can use Dispatchueue with timeout ?)
- Do research on other cancelable closures in swift. ✅ There should be another one in your dispatch research etc  (DispatchWorkItem)
- Do tests with timers and background calls etc ✅
- Test with `run`, `add` and `cancel` buttons 👈
- Explain some of the use cases
- Maybe subclass NSOperation (investigation needed) see issues ✨
- Add support for result type? instead of just Any?
- Add hasNext() like TestRunner? 🚫
