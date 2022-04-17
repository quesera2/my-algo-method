// 挿入・削除・検索 (3)
// https://algo-method.com/tasks/868

let N = Int(readLine()!)!
var A = Dictionary(readLine()!.split(separator: " ").map { (String($0), 1) }, 
                   uniquingKeysWith: +)
let Q = Int(readLine()!)!

enum Query: Int {
    case insert
    case delete
    case count
}

(0..<Q).map { _ -> (query: Query, value: String) in
    let input = readLine()!.split(separator: " ")
    return (Query(rawValue: Int(input[0])!)!, String(input[1]))
}.forEach { (query, value) in
    switch query {
        case .insert:
            A[value, default: 0] += 1
        case .delete:
            A[value] = 0
        case .count:
            print(A[value, default: 0])
    }
}
