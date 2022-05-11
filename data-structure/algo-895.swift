// 兄弟は誰だ？ (2)
// https://algo-method.com/tasks/895

final class Rec: CustomStringConvertible {
    let number: Int
    var parent: Rec?
    var children: [Rec] = []

    init(_ num: Int) {
        self.number = num
    }

    var description: String {
        return "\(number)"
    }
}

func inputIntTuple() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

let N = Int(readLine()!)!
let T = (0..<N).map { Rec($0) }
for _ in (0..<N-1) {
    let (a, b) = inputIntTuple()
    T[b].parent = T[a]
    T[a].children.append(T[b])
}

let Q = Int(readLine()!)!
for _ in 0..<Q {
    let q = Int(readLine()!)!
    if let parent = T[q].parent {
        let result = parent.children
            .map { $0.number }
            .sorted()
            .map { String($0) }
            .joined(separator: " ")
        print(result)
    }
}
