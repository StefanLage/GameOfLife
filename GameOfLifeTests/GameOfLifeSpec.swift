//
//  GameOfLifeSpec.swift
//  GameOfLifeTests
//
//  Created by Edu Caselles on 10/8/16.
//  Copyright © 2016 Edu Caselles. All rights reserved.
//

import Quick
import Nimble
@testable import GameOfLife

class GameOfLifeSpec: QuickSpec {
    override func spec() {
        
        describe(".initWithSeed") {
            context("when the seed is empty") {
                it("initialises an empty matrix") {
                    let game = GameOfLife(seed:[])
                    expect(game.matrix).to(beEmpty())
                }
            }
            
            context("when the seed is valid") {
                it("initialises an equivalent matrix") {
                    let game = GameOfLife(seed:[[0, 1],
                                                [1, 0]])

                    expect(game.matrix[0][0]).to(equal(Cell.Dead))
                    expect(game.matrix[0][1]).to(equal(Cell.Live))
                    expect(game.matrix[1][0]).to(equal(Cell.Live))
                    expect(game.matrix[1][1]).to(equal(Cell.Dead))
                }
            }
        }
        
        describe(".evolution") {
            it("evolved the matrix to the next generation") {
                
            }
        }
    }
}
