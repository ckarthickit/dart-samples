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

## Streams 
  - Three ways of creating streams 
    - `Transforming` existing Streams.
    - Creating a stream from the scratch using `async*` and `yield`ing some values 
      - Eg., We can yield values delivered by some Future objects 
      ```
      Stream<int> timedCounter(Duration interval, [int maxCount]) async* {
        int i = 0;
        while (true) {
          await Future.delayed(interval);
          yield i++;
          if (i == maxCount) break;
        }
      }
      ```
    - Creating a stream using `StreamController`.
      - When a stream has no-subscriber , StreamController buffers event,
      which could lead to `memory-leak` if stream never gets a subscriber.
  - `Stream`s *SHOULD* wait for subscribers before starting their work
  - `await for` can be used only on Streams
    - If a stream has `error events`, when reading the stream using await for,
     the error is thrown by the loop statement. `This ends the loop, as well`. 
  - `yield` can be used only inside `async*` functions
  - `async*` functions *MUST* return a Stream object




