// 箱の内部の箱の個数
// https://algo-method.com/tasks/909

let N = Int(readLine()!)!
var box: [[Int]] = Array(repeating: [], count: N)
readLine()!.split(separator: " ")
           .map { Int($0)! }
           .enumerated()
           .forEach { (index, a) in
               box[a].append(index + 1)
           }

var result = 0
func rec(_ v: Int) {        
    for v2 in box[v] {
        result += 1
        rec(v2)
    }
}

let v = Int(readLine()!)!
rec(v)
print(result)
