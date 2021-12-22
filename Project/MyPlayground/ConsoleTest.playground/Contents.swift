////: Playground - noun: a place where people can play
//
//class matrix
//{
//    var rows: Int
//    var colums: Int
//    var grid: [Double]
//    init(rows: Int, colums: Int) {
//        self.rows = rows
//        self.colums = colums
//        grid = Array(repeating: 0.0, count: rows*colums)
//    }
//
//    subscript (row: Int, colum: Int) -> Double
//    {
//        get{
//            return grid[(row*colums)+colum]
//        }
//        set{
//            grid[(row*colums)+colum] = newValue
//        }
//    }
//}
//
//var metrix = matrix(rows: 2, colums: 2)
//metrix[0,0] = 1
//metrix[0,1] = 2.5
//
//extension Int {
//    subscript (num: Int) -> Int {
//
//        var result: Int = 0
//        var a = self
//
//        for number in 0...num
//        {
//            result = a%10
//            a /= 10
//        }
//
//        return result
//    }
//}
//
//746381295[0]
//// returns 5
//746381295[1]
//// returns 9
//746381295[2]
//// returns 2
//746381295[8]
//// returns 7
//
//struct Stack<T>
//{
//    private var stackTemp:[T] = []
//
//    mutating func push(element: T)
//    {
//        stackTemp.append(element)
//    }
//
//    mutating func pop() -> T
//    {
//        return stackTemp.removeLast()
//    }
//}
//
struct Queue<T> //데이터의 타입에서의 타입을 정의(class, struct, enum등에서 정의 할 때 쓰이는 데이터타입)
{
    private var queue: [T] = []

    mutating func insertion(_ element: T)
    {
        queue.append(element)
    }

    mutating func deletion() -> T
    {
        return queue.removeFirst()
    }
}

let a: Int = 1
let b: Int = 2
let c: Int = 3

var que: Queue<Int> = Queue()
que.insertion(a)
que.insertion(b)
let e = que.deletion()
print(que)
que.insertion(c)
print(que)


