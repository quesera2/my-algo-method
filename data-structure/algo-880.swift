// 4 つの整数 (2)
// https://algo-method.com/tasks/880
func inputIntTuple() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

func inputIntArray() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

let (N, M) = inputIntTuple()
let A = readLine()!.split(separator: " ").map { Int($0)! }

// a^2 + b^2のキャッシュを作る
var cache: [Int: Bool] = [:]
for a in A {
    for b in A {
        let key = a * a + b * b
        cache[key] = true
    }
}

// A^2 + B^2 のキャッシュを探索
var found = false
for (key, value) in cache {
     if cache[M - key] == true {
        found = true
        break
    }
}

print(found ? "Yes" : "No")
