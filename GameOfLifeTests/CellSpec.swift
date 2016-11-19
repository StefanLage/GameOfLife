//
//  CellSpec.swift
//  GameOfLifeTests
//
//  Created by Edu Caselles on 10/8/16.
//  Copyright © 2016 Edu Caselles. All rights reserved.
//

import Quick
import Nimble
@testable import GameOfLife

class CellSpec: QuickSpec {
    override func spec() {
        
        describe(".nextEvolution") {
            context("when the cell is live") {
                let cell = Cell.Live
                
                context("and it has less than 2 neighbours") {
                    it("will be dead") {
                        let result = cell.nextEvolution(forNeighboursCount: 1)
                        expect(result).to(equal(Cell.Dead))
                    }
                }
                
                context("and it has 2 neighbours") {
                    it("will be live") {
                        let result = cell.nextEvolution(forNeighboursCount: 2)
                        expect(result).to(equal(Cell.Live))
                    }
                }
                
                context("and it has 3 neighbours") {
                    it("will be live") {
                        let result = cell.nextEvolution(forNeighboursCount: 3)
                        expect(result).to(equal(Cell.Live))
                    }
                }
                
                context("and it has more than 3 neighbours") {
                    it("will be dead") {
                        let result = cell.nextEvolution(forNeighboursCount: 4)
                        expect(result).to(equal(Cell.Dead))
                    }
                }
            }
            
            context("when the cell is dead") {
                let cell = Cell.Dead
                
                context("and it has 3 neighbours") {
                    it("will be live") {
                        let result = cell.nextEvolution(forNeighboursCount: 3)
                        expect(result).to(equal(Cell.Live))
                    }
                }
                
                context("and it does not have 3 neighbours") {
                    it("will be dead") {
                        let result = cell.nextEvolution(forNeighboursCount: 2)
                        expect(result).to(equal(Cell.Dead))
                    }
                }
            }
        }
    }
}
