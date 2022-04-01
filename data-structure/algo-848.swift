// Q5. 列車つなぎ（改題後）
// https://algo-method.com/tasks/848

// MARK: - DataStructure

// 前後に接続できるブロック
class Block {
    
    let number: Int
    var forward: Block? = nil
    var back: Block? = nil
    
    init(_ number: Int) {
        self.number = number
    }

    // 前方にブロックをつなぐ
    func connect(_ other: Block) {
        guard
            forward == nil,
            other.back == nil
        else {
            return
        }
        forward = other
        other.back = self
    }
    
    // ブロックを分離して前後をつなげる
    func contract() {
        forward?.back = back
        back?.forward = forward
        back = nil
        forward = nil
    }
}

// MARK: - Input
var container: [Block] = []

func inputIntTuple() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

enum Operation {
    case connect(Block, Block)
    case contract(Block)
}

func paraseOperation() -> Operation {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    switch input[0] {
    case 0:
        return .connect(container[input[1]], container[input[2]])
    case 1:
        return .contract(container[input[1]])
    default:
        fatalError()
    }
}

// MARK: - Execute
let (N, Q) = inputIntTuple()

container.append(contentsOf: (0..<N).map(Block.init))

for _ in (0..<Q) {
    switch paraseOperation() {
    case .connect(let p, let q):
        p.connect(q)
    case .contract(let r):
        r.contract()
    }
}

// 車両番号0と連結されているものを抽出
var result = 1
let zeroBlock = container[0]

// 前方向
var car: Block? = zeroBlock.forward
while car != nil {
    result += 1
    car = car?.forward
}

// 後ろ方向
car = zeroBlock.back
while car != nil {
    result += 1
    car = car?.back
}
print(result)
