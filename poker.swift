enum PokerHands: String, CaseIterable {
    case FiveOfKind
    case StraightFlush
    case FourOfAKind
    case FullHouse
    case Flush
    case Staright
    case ThreeOfKind
    case TwoPair
    case OnePair
    case None
}

typealias Hand = (String, Int) // (type, value)

func isFlush(hand: [Hand]) -> Bool {
    if hand.count == 5 {
        let base = hand.first?.0
        let forJudge = hand.filter{ $0.0 == base }
        if forJudge.count == 5 {
            return true
        }
    }
    return false
}

func isStraight(hand: [Hand]) -> Bool {
    if hand.count == 5 {
        let sortedHand = hand.sorted{(lhs, rhs) -> Bool in 
            return lhs.1 < rhs.1
        }
        let base = sortedHand.first!.1
        let forJudge = sortedHand.enumerated().filter{ $0.1.1 == base + $0.0 }
        if forJudge.count == 5 {
            return true
        }
    }
    return false
}

// return value is card number
// when missing two pair, return value is 0
func findTwoOfAKindNoJoker(hand: [Hand]) -> Int {
    for one in hand {
        let base = one.1
        let forJudge = hand.filter{ $0.1 == base }
        if forJudge.count == 2 {
            return base
        }
    }
    return 0
}

func isTwoOfAKind(hand: [Hand]) -> Bool {
    // 手札2枚以上でジョーカーありなら確実に成立する
    if hand.count > 1 && hand.contains(where: { $0.0 == "j" }) {
        return true
    }
    return findTwoOfAKindNoJoker(hand: hand) != 0
}

func isThreeOfAKind(hand: [Hand]) -> Bool {
     for one in hand {
        let base = one.1
        let forJudge = hand.filter{ $0.1 == base || $0.0 == "j" }
        if forJudge.count == 3 {
            return true
        }
    }
    return false
}

let handFuncs = [
    // 0 five of a kind
    { (hand: [Hand]!) -> Bool in
        if hand.count == 5 {
            let base = hand.first?.1
            let forJudge = hand!.filter{ $0.1 == base || $0.0 == "j" }
            if forJudge.count == 5 {
                return true
            }
        }
        return false
    },
    // 1 straight flush
    { (hand: [Hand]!) -> Bool in
        return isStraight(hand: hand) && isFlush(hand: hand)
    },
    // 2 four of a kind
    { (hand: [Hand]!) -> Bool in
        if hand.count >= 4 {
            for one in hand {
                let base = one.1
                let forJudge = hand!.filter{ $0.1 == base || $0.0 == "j" }
                if forJudge.count == 4 {
                    return true
                }
            }
        }
        return false
    },
    // 3 full house
    { (hand: [Hand]!) -> Bool in
        let pairNumber = findTwoOfAKindNoJoker(hand: hand)
        if pairNumber != 0 {
            let filterdHand = hand.filter{ $0.1 != pairNumber }
            return isThreeOfAKind(hand: filterdHand)
        }
        return false
    },
    // 4 flush
    { (hand: [Hand]!) -> Bool in
        return isFlush(hand: hand)
    },
    // 5 straight
    { (hand: [Hand]!) -> Bool in
        return isStraight(hand: hand)
    },
    // three of a kind
    { (hand: [Hand]!) -> Bool in
        return isThreeOfAKind(hand: hand)
    },
    // two pair
    { (hand: [Hand]!) -> Bool in
        let pairNumber = findTwoOfAKindNoJoker(hand: hand)
        if pairNumber != 0 {
            let filterdHand = hand.filter{ $0.1 != pairNumber }
            return isTwoOfAKind(hand: filterdHand)
        }
        return false
    },
    // one pair
    { (hand: [Hand]!) -> Bool in
        return isTwoOfAKind(hand: hand)
    }
]

// var hand = [("d", 1), ("c", 3), ("d", 2), ("d", 3), ("s", 3)]
var hand = [("d", 4), ("c", 8), ("c", 1), ("c", 3), ("d", 9)]

for (i, f) in handFuncs.enumerated() {
    if f(hand) {
        print(PokerHands.allCases[i])
        break
    }
}

// while s.count != 0 {
//     let last = s.last

// }