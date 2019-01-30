#Asynchronous Programming in DART 

## Futures
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

