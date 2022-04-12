// ４つの整数
// https://algo-method.com/tasks/861
func inputIntTuple() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

let (N, M) = inputIntTuple()
let A = readLine()!.split(separator: " ").map { Int($0)! }

// a^2 + b^2のキャッシュを作る
var cache: [Int:Bool] = [:]
for a in A {
    for b in A {
        let key = a * a + b * b
        cache[key] = true
    }
}

// A^2 + B^2 のキャッシュを探索
// 4重ループするとO(N^4)なので、問題を分割して半分全列挙する
var found = false
for v in cache.keys {
    // A^2 + B^2 == M の場合
    if v == M {
        found = true
        break
    }
    // A^2 + B^2 + C^2 + D^2の存在チェック
    if cache[M - v, default: false] {
        found = true
        break
    }
}

print(found ? "Yes" : "No")
