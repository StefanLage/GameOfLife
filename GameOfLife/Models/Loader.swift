//
//  Loader.swift
//  GameOfLife
//
//  Created by Edu Caselles on 10/15/16.
//  Copyright © 2016 Edu Caselles. All rights reserved.
//

import Foundation

struct Seed {
    let name: String
    let values: [[Int]]
    
    init(name: String, values: [[Int]]) {
        self.name = name
        self.values = values
    }
}

class Loader {
    class func loadSeeds() -> [Seed] {
        
        var seeds = [Seed]()
        do {
            let seedsPath = Bundle.main.path(forResource: "Seeds", ofType: nil)!
            let directoryContents = try FileManager.default.contentsOfDirectory(at: URL(fileURLWithPath: seedsPath),
                                                                                includingPropertiesForKeys: nil,
                                                                                options: .skipsSubdirectoryDescendants)
            let jsonFiles = directoryContents.filter{ $0.pathExtension == "json" }
            for seedFile in jsonFiles {
                let data = try Data(contentsOf: seedFile)
                let seedJSON = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                if let name = seedJSON?["name"] as? String,
                    let values = seedJSON?["values"] as? [[Int]] {
                    let seed = Seed(name: name, values: values)
                    seeds.append(seed)
                    print("Loaded seed: \(name)")
                }
            }
            
        } catch let error as NSError {
            print("Could not read JSON dictionary with error: \(error.localizedDescription)")
        }
        
        return seeds
    }
}
