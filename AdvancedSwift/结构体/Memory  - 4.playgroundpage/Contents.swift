/*:
## Closures and Memory

Classes aren't the only kind of reference type in Swift. Functions are reference
types too, and this includes closures. As we saw in the section on closures and
mutability, a closure can capture variables. If these variables are reference
types, the closure will maintain a strong reference to them. For example, if you
have a variable `handle` that's a `FileHandle` object and you access it within a
callback, the callback will increment the reference count for that `handle`:

``` swift-example
let handle = FileHandle(forWritingAtPath: "out.html")
let request = URLRequest(url: URL(string: "http://www.objc.io")!)
URLSession.shared.dataTask(with: request) { (data, _, _) in
    guard let theData = data else { return }
    handle?.write(theData)
}
```

Once the callback is done, the closure gets released, and the variables it
closes over (in the example above, just `handle`) will have their reference
counts decremented. This strong reference to the closed-over variables is
necessary, otherwise the variable could already be deallocated when you access
it within the callback.

Only closures that can *escape* need to keep strong references to their
variables. In the chapter on functions, we'll look into more detail at escaping
vs. non-escaping functions.

*/
