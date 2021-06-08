import Foundation
/**
 * - Fixme: ⚠️️ Rename hasFailed, hasSucceeded, isIdle?
 * - Fixme: ⚠️️ Could also name things: case Ready, Executing, Finished
 * - Fixme: ⚠️️ Add to task class scope? maybe not?!
 * - Fixme: ⚠️️ Add isExecuting state? for when task has begun etc, not needed atm
 * - Note: didFail is symbolically the same as didCancel, less amounts of state is always better etc and is not needed for the scope this kit provides atm
 */
public enum TaskState {
	case idle // initial state
   case didFail // cancel or failed (can be called by external event, event in callback or by timeout)
   case didSucceed // callback produced expected result
}
// case didCancel // new
