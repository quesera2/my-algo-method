// Q3. 挿入・削除・検索 (2)
// https://algo-method.com/tasks/858
enum Query: Int {
    case insert
    case delete
    case count
}

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
let Q = Int(readLine()!)!

func parseQuery() -> (Query, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (Query(rawValue: input[0])!, input[1])
}

// [2, 1, 1, 3] みたいなものを { [1: 2], [2:1], [3:1] } に変換する
var result = Dictionary(A.map { ($0, 1) }, uniquingKeysWith: +)

for _ in (0..<Q) {
    let (query, value) = parseQuery()
    switch query {
    case .insert:
        result[value, default: 0] += 1
    case .delete:
        result[value] = 0
    case .count:
        print(result[value, default: 0])
    }
}