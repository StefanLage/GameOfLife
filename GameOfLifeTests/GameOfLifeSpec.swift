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
                it("initialises an empty universe") {
                    let game = GameOfLife(seed:[])
                    expect(game.universe).to(beEmpty())
                }
            }
            
            it("initialises an equivalent universe") {
                let game = GameOfLife(seed:[[0, 1],
                                            [1, 0]])
                
                expect(game.universe[0][0]).to(equal(Cell.Dead))
                expect(game.universe[0][1]).to(equal(Cell.Live))
                expect(game.universe[1][0]).to(equal(Cell.Live))
                expect(game.universe[1][1]).to(equal(Cell.Dead))
            }
        }
        
        describe(".evolve") {
            context("when the universe is empty") {
                it("evolves to an empty universe") {
                    let game = GameOfLife(seed:[])
                    game.evolve()
                    expect(game.universe).to(beEmpty())
                }
            }
            
            it("evolves the universe to the next generation") {
                let game = GameOfLife(seed:[[0, 0, 0],
                                            [1, 1, 1],
                                            [0, 0, 0]])
                game.evolve()
                
                expect(game.universe[0][0]).to(equal(Cell.Dead))
                expect(game.universe[0][1]).to(equal(Cell.Live))
                expect(game.universe[0][2]).to(equal(Cell.Dead))
                expect(game.universe[1][0]).to(equal(Cell.Dead))
                expect(game.universe[1][1]).to(equal(Cell.Live))
                expect(game.universe[1][2]).to(equal(Cell.Dead))
                expect(game.universe[2][0]).to(equal(Cell.Dead))
                expect(game.universe[2][1]).to(equal(Cell.Live))
                expect(game.universe[2][2]).to(equal(Cell.Dead))
            }
        }
    }
}
