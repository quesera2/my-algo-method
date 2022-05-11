// 箱の内部の箱の個数 (2)
// https://algo-method.com/tasks/907

let N = Int(readLine()!)!
var box: [[Int]] = Array(repeating: [], count: N)
readLine()!.split(separator: " ")
           .map { Int($0)! }
           .enumerated()
           .forEach { (index, a) in
               box[a].append(index + 1)
           }

var cache:[Int:Int] = [:]
func recCount(_ v: Int) -> Int {
    if let cacheValue = cache[v] {
        return cacheValue
    }
    var result = 0
    for v2 in box[v] {
        result += recCount(v2)
        result += 1
    }
    cache[v] = result
    return result
}

let Q = Int(readLine()!)!
for _ in (0..<Q) {
    let v = Int(readLine()!)!
    print(recCount(v))
}
