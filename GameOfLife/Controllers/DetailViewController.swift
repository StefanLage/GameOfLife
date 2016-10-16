//
//  DetailViewController.swift
//  GameOfLife
//
//  Created by Edu Caselles on 10/8/16.
//  Copyright © 2016 Edu Caselles. All rights reserved.
//

import UIKit

protocol Injectable {
    associatedtype T
    func inject(_: T)
    func assertDependencies()
}

fileprivate let reuseIdentifier = "GameOfLifeCell"

class DetailViewController: UIViewController {

    fileprivate var game: GameOfLife!
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()
        print("New game initialised:")
        game.printUniverse()
        
        collectionView.reloadData()
        Timer.scheduledTimer(timeInterval: 0.5,
                             target: self,
                             selector: #selector(self.update),
                             userInfo: nil,
                             repeats: true);
    }
    
    func update() {
        game.evolve()
        collectionView.reloadData()
        
        print("Universe evolved:")
        game.printUniverse()
    }
}

extension DetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.rows * game.columns
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                                for: indexPath)
        let cell = self.cellForIndexPathRow(row: indexPath.row)
        collectionCell.backgroundColor = (cell == .Live ? UIColor.black : UIColor.white)
        return collectionCell
    }
    
    private func cellForIndexPathRow(row indexPathRow: Int) -> Cell {
        let row = indexPathRow / game.columns
        let column = indexPathRow % game.columns
        return game.universe[row][column]
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(game.columns - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(game.columns))
        
        return CGSize(width: size, height: size)
    }
}

extension DetailViewController: Injectable {
    typealias T = GameOfLife
    
    func inject(_ game: T) {
        self.game = game
    }
    
    func assertDependencies() {
        if self.game == nil {
            if let seed = Loader.loadSeeds().first {
                self.game = GameOfLife(seed: seed.values)
            }
        }
    }
}
