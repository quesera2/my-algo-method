// 二分探索木のキー検索
// https://algo-method.com/tasks/919
class Rec {
    let number: Int
    var left: Rec? = nil
    var right: Rec? = nil

    init(_ number: Int) {
        self.number = number
    }

    func insert(_ rec: Rec) {
        if rec.number <= number {
            if let left = left {
                left.insert(rec)
            } else {
                left = rec
            }

        } else {
            if let right = right {
                right.insert(rec)
            } else {
                right = rec
            }
        }
    }

    func search(_ searchNum: Int) -> Bool {
        if searchNum == number {
            return true
        } else if searchNum < number {
            if let left = left {
                return left.search(searchNum)
            } else {
                return false
            }

        } else {
            if let right = right {
                return right.search(searchNum)
            } else {
                return false
            }
        }
    }
}

func inputIntTuple() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

let N = Int(readLine()!)!
let root = Rec(0)

for _ in (0..<N) {
    let (o, v) = inputIntTuple()
    if o == 0 {
        root.insert(Rec(v))
    } else if o == 1 {
        print(root.search(v) ? "Yes" : "No")
    }
}
