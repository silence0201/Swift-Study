
//==========泛型队列==============
struct Queue<T> {
    
    var items = [T]()
    
    mutating func queue(item: T) {
        items.append(item)
    }
    
    mutating func dequeue() -> T? {
        if items.isEmpty {
            return nil
        } else {
            return items.remove(at: 0)
        }
    }
}

//==========泛型扩展==============
extension Queue {
    func peek(position: Int) -> T? {
        if position < 0 || position > items.count {
            return nil
        } else {
            return items[position]
        }
    }
}

var genericDoubleQueue = Queue<Double>()
genericDoubleQueue.queue(item: 3.26)
genericDoubleQueue.queue(item: 8.86)
genericDoubleQueue.queue(item: 1.99)
genericDoubleQueue.queue(item: 7.68)

print(genericDoubleQueue.peek(position: 2)!)

