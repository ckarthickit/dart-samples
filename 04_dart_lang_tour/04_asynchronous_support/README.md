#Asynchronous Programming in DART 
  - Dart code runs in `single thread` of execution.
  - `Future` objects represents `result of asynchronous operation`.
  - Use `then()` (or) `await` to suspend execution of code that comes after the 
    current asynchronous operation.
  - Use `catchError()` (or) `try-catch` to catch errors (or) Exceptions in the 
    current asyncrhonous operation.
  - `If all we want is concurrent execution` we must use `Isolate` for that . 
    (for a web app it would be `worker`).
  - `2 options` for writing code depending on future.
    - Using `async` and `await`. (OR)
    - Use the `Future` API. (`then()` and `catchError()`).

## Futures
  - `async` functions
    - SHOULD return Future<void> (or) Future<null> even if the async function doesn't return a value
      - DO NOT return just void from an async function.
    - Implicitly returns Future objects of types that `return expression` evaluates to.
    - Can `Explicitly` return Future objects as well. (in which case implicit conversion is not done)

  - `await` results/returns
    - Automatically Blocks the asynchronous function/block on that line
    - awaiting a function that is synchronous doesn't have any effect.
    - Automcatically UnWraps the value returned by future on return (if any).
    - CAN be done ONLY inside `async` functions . 




