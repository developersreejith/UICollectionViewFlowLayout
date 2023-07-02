//
//  ViewController.swift
//  Sample Collection View using Flow delegate
//
//  Created by Sreejith np on 01/07/23.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Variables and Constants
    let imageNamesArray = ["pencil","eraser","trash","folder","paperplane","archivebox","doc","clipboard","note","calendar","book","book.circle","magazine","graduationcap","doc","pencil","eraser","trash","folder","paperplane","archivebox","doc","clipboard","note","calendar","book","book.circle","magazine","graduationcap","doc"]
    
    //MARK: - Outlets
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting Delegate and DataSource of CollectionView
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
    }
}
//MARK: -Extension 1 - Collection View Delegate and Data Source
extension ViewController: UICollectionViewDelegate ,UICollectionViewDataSource{
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNamesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Creating a cell as Deque Reusable cell
        let collectionViewCell = collectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        // Assigning Images to the Cell Image
        collectionViewCell.cellDisplayImage.image = UIImage(systemName: imageNamesArray[indexPath.row])
        // Return the cell
        return collectionViewCell
    }
}

//MARK: - Extension 2 - UICollectionViewDelegateFlowLayout


extension ViewController:UICollectionViewDelegateFlowLayout{
    // Method 1
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 30, left: 10, bottom: 30, right: 10)
    }
    // Method 2
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5
    }
    // Method 3
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 60
    }
    //Method 4
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionViewOutlet.frame.width
        let collectionViewHeight =  collectionViewOutlet.frame.height
        
        let cellWidth = (collectionViewWidth - 30 ) / 3
        let cellHeight = cellWidth * 0.5
        
        return CGSize(width: cellWidth , height: cellHeight)
        
    }
}
