import Foundation

enum Hogehoge: String {
    case AAA
    case BBB
    case CCC

    var id: Int {
        switch self {
        case .AAA: return 10
        case .BBB: return 20
        case .CCC: return 30
        }
    }

    func hoge() -> Int {
        switch self {
            case .AAA: return 10000
            default: return 0
        }
    }
}

let buttonId = Hogehoge(rawValue: "ABC")
if buttonId != nil {
    print(buttonId!.id)
    print(buttonId!.hoge())
}
else {
    print("nilnilnilnil")
}