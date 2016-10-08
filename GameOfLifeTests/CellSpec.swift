//
//  CellSpec.swift
//  GameOfLifeTests
//
//  Created by Edu Caselles on 10/8/16.
//  Copyright © 2016 Edu Caselles. All rights reserved.
//

import Quick
import Nimble

class CellSpec: QuickSpec {
    override func spec() {
        
        describe("nextEvolution") {
            context("when the cell is live") {
                context("and it has less than 2 neighbours") {
                    it("will be dead") {
                        
                    }
                }
                
                context("and it has 2 neighbours") {
                    it("will be live") {
                        
                    }
                }
                
                context("and it has 3 neighbours") {
                    it("will be live") {
                        
                    }
                }
                
                context("and it has more than 3 neighbours") {
                    it("will be dead") {
                        
                    }
                }
            }
            
            context("when the cell is dead") {
                context("and it has 3 neighbours") {
                    it("will be live") {
                        
                    }
                }
                
                context("and it does not have 3 neighbours") {
                    it("will be dead") {
                        
                    }
                }
            }
        }
    }
}
