//
//  YellowCell.swift
//  Bidirectional Layout
//
//  Created by Mariam on 12/19/20.
//
import UIKit

class YellowCell: UITableViewCell{
    static let nibName = "YellowCell"
    static let identifier = "YellowCell"
    
    @IBOutlet var collectionView: UICollectionView!
    
    static func nib() -> UINib{
        return UINib(nibName: nibName, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
        
    }
    
    func setUp(){
        registerCells()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func registerCells(){
        collectionView.register(YellowCellLittleFirst.nib(), forCellWithReuseIdentifier: "YellowCellLittleFirst")
        collectionView.register(YellowCellBigFirst.nib(), forCellWithReuseIdentifier: "YellowCellBigFirst")
    }
}

extension YellowCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        
        if indexPath.row % 2 == 0{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: YellowCellLittleFirst.identifier, for: indexPath)
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: YellowCellBigFirst.identifier, for: indexPath)
        }
            
        return cell
    }
}
