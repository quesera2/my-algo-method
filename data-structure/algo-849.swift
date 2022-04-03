// Q7. マラソン
// https://algo-method.com/tasks/849
let N = Int(readLine()!)!

let A = readLine()!.split(separator: " ").map { Int($0)! }

// n番目の前の人、n番目の後の人を配列で保持
var before = Array(repeating: -1, count: N)
var after = Array(repeating: -1, count: N)

for i in (0..<N) {
    if i != 0 { before[A[i]] = A[i-1] }
    if i != N - 1 { after[A[i]] = A[i+1] }
}

func inputIntTuple() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

let Q = Int(readLine()!)!
for _ in (0..<Q) {
    let (o, v) = inputIntTuple()
    if o == 0 {
        // vが一つ前の選手を抜かす
        // 前がいなければエラー
        if before[v] == -1 {
            print("Error")
            continue
        }
        // 棄権済みの場合もエラー
        if before[v] == -1 && after[v] == -1 {
            print("Error")
            continue
        }
        let p = before[v]
        print(p)
        
        if before[p] != -1 {
            after[before[p]] = v
        }
        if after[v] != -1 {
            before[after[v]] = p
        }
        after[p] = after[v]
        before[v] = before[p]
        before[p] = v
        after[v] = p
    } else if o == 1 {
        // vが棄権する場合、vの前後をつなぐ
        if before[v] != -1 {
            after[before[v]] = after[v]
        }
        if after[v] != -1 {
            before[after[v]] = before[v]
        }
        before[v] = -1
        after[v] = -1
    }
}


