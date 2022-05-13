// 二分木の通りがけ順
// https://algo-method.com/tasks/913

class Rec {
    let number: Int
    var left: Rec? = nil
    var right: Rec? = nil

    init(_ number: Int) {
        self.number = number
    }
}

func inputIntTuple() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

let N = Int(readLine()!)!
var rec = (0..<N).map { Rec($0) }
(0..<N).map {
    let (l, r) = inputIntTuple()
    if l != -1 { rec[$0].left = rec[l] }
    if r != -1 { rec[$0].right = rec[r] }
}

func printRec(_ rec: Rec) {
    if let l = rec.left {
        printRec(l)
    }
    print(rec.number, terminator: " ")
    if let r = rec.right {
        printRec(r)
    }
}

printRec(rec[0])
print()
