//
//  GameOfLife.swift
//  GameOfLife
//
//  Created by Edu Caselles on 10/8/16.
//  Copyright © 2016 Edu Caselles. All rights reserved.
//

import Foundation

class GameOfLife {
    var universe: [[Cell]]
    let rows: Int
    let columns: Int

    init(seed: [[Int]]) {
        rows = seed.count
        columns = seed.first?.count ?? 0
        universe = [[Cell]](repeating: [Cell](repeating: .Dead, count: columns), count: rows)
        
        for i in 0..<rows {
            for j in 0..<columns {
                universe[i][j] = Cell(rawValue: seed[i][j])!
            }
        }
    }
    
    func printUniverse() {
        for i in 0..<rows {
            var rowString = ""
            for j in 0..<columns {
                rowString += "\(universe[i][j].rawValue) "
            }
            print(rowString)
        }
        print("")
    }
    
    func evolve() {
        var nextGeneration = universe
        for i in 0..<rows {
            for j in 0..<columns {
                let liveNeighbours = countLiveNeighbours(row: i, column: j)
                nextGeneration[i][j] = universe[i][j].nextEvolution(forNeighboursCount: liveNeighbours)
            }
        }
        
        universe = nextGeneration
    }
    
    private func countLiveNeighbours(row:Int, column:Int) -> Int {
        var liveNeighbours = 0
        
        for i in row - 1 ... row + 1 {
            for j in column - 1 ... column + 1 {
                if i >= 0 && i < rows && j >= 0 && j < columns {
                    liveNeighbours += universe[i][j].rawValue
                }
            }
        }
        
        liveNeighbours -= universe[row][column].rawValue
        
        return liveNeighbours
    }
}
