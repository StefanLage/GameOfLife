//
//  Cell.swift
//  GameOfLife
//
//  Created by Edu Caselles on 10/8/16.
//  Copyright © 2016 Edu Caselles. All rights reserved.
//

import Foundation

enum Cell: Int {
    case Dead = 0
    case Live
    
    func nextEvolution(forNeighboursCount neighboursCount: Int) -> Cell {
        switch self {
        case .Dead:
            return neighboursCount == 3 ? .Live : .Dead
        case .Live:
            switch neighboursCount {
            case 0..<2:
                return .Dead
            case 2...3:
                return .Live
            default:
                return .Dead
            }
        }
    }
}
