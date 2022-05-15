// 二分探索木への挿入
// https://algo-method.com/tasks/918

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
}


let N = Int(readLine()!)!
let root = Rec(Int(readLine()!)!)
for _ in (0..<N-1) {
    let v = Rec(Int(readLine()!)!)
    root.insert(v)
}

func printRec(_ rec: Rec) {
    print(rec.number, terminator: " ")
    if let l = rec.left {
        printRec(l)
    }
    if let r = rec.right {
        printRec(r)
    }
}

printRec(root)
print()
