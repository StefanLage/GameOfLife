//
//  DetailViewController.swift
//  GameOfLife
//
//  Created by Edu Caselles on 10/8/16.
//  Copyright © 2016 Edu Caselles. All rights reserved.
//

import UIKit

fileprivate let reuseIdentifier = "GameOfLifeCell"

class DetailViewController: UIViewController {
    
    lazy var game: GameOfLife = {
        return GameOfLife(seed: [[0, 0, 0, 0, 0],
                                 [0, 0, 0, 0, 0],
                                 [0, 1, 1, 1, 0],
                                 [0, 0, 0, 0, 0],
                                 [0, 0, 0, 0, 0]])
        
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.update), userInfo: nil, repeats: true);
    }
    
    func update() {
        game.evolve()
        collectionView.reloadData()
    }
}

extension DetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.rows * game.columns
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = indexPath.row / game.columns
        let column = indexPath.row % game.columns
        let cell = game.matrix[row][column]
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                                for: indexPath)
        collectionCell.backgroundColor = (cell == .Live ? UIColor.black : UIColor.white)
        // Configure the cell
        return collectionCell
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
