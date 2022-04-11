// 共円
// https://algo-method.com/tasks/859
var answer: [Int:Int] = [:]
for i in (-100...100) {
    for j in (-100...100) {
        let p = i * i + j * j
        answer[p, default: 0] += 1
    }
}

let q = Int(readLine()!)!

for _ in (0..<q) {
    let p = Int(readLine()!)!
    print(answer[p, default: 0])
}
