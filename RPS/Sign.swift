//
//  Sign.swift
//  RPS
//
//  Created by Lucas da Silva Reis on 04/03/22.
//

import Foundation

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    }else if sign == 1 {
        return .paper
    }else {
        return .scissors
    }
}

enum Sign {
    case rock
    case paper
    case scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    func game (_ opponent: Sign) -> GameSate{
        switch self {
        case .rock:
            switch opponent {
            case .rock:
                return GameSate.tie
            case .paper:
                return GameSate.lose
            case .scissors:
                return GameSate.win
            }
        
        case .paper:
            switch opponent {
            case .rock:
                return GameSate.win
            case .paper:
                return GameSate.tie
            case .scissors:
                return GameSate.lose
            }
        case .scissors:
            switch opponent {
            case .rock:
                return GameSate.lose
            case .paper:
                return GameSate.win
            case .scissors:
                return GameSate.tie
            }
        }
    }
}


