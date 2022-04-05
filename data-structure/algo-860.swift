// 最頻値
// https://algo-method.com/tasks/860

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }

let AMAX = 5 * 100000

var container = Array(repeating: 0, count: AMAX + 1)

for a in A {
    container[a] += 1
}

var result = AMAX + 1
var max = 0
for (i, v) in container.enumerated() {
    if v == max {
        result = min(i, result)
    } else if v > max {        
        result = i
        max = v
    }
}

print(result)
