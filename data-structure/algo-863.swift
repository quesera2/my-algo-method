// 数式クエリ
// https://algo-method.com/tasks/863
enum Query: Int {
    case insert
    case change
    case sum
}

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
let Q = Int(readLine()!)!

var bucket: [Int] = Array(repeating: 0, count: 100000 + 1)
var result: Int = 0
for a in A {
    bucket[a] += 1
    result += a
}

for _ in (0..<Q) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    switch Query(rawValue: input[0])! {
    case .insert:
        let v = input[1]
        bucket[v] += 1
        result += v
    case .change:
        let (x, y) = (input[1], input[2])
        result += (y - x) * bucket[x]
        bucket[y] += bucket[x]
        bucket[x] = 0
    case .sum:
        print(result)
    }
}
