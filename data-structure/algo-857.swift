// Q1. 集計
// https://algo-method.com/tasks/857

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
var bucket: [Int:[Int]] = [:]
for (i, a) in A.enumerated() {
    bucket[a, default: []].append(i)
}
let Q = Int(readLine()!)!
for _ in (0..<Q) {
    let q = Int(readLine()!)!
    print(bucket[q, default: []].count)
}
