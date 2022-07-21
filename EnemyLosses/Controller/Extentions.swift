//
//  Extentions.swift
//  EnemyLosses
//
//  Created by Yu_SHMBR on 19.07.2022.
//

import UIKit


extension ViewController: UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return equipmentCellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TechniqueCollectionViewCell", for: indexPath) as! TechniqueCollectionViewCell
        
        cell.setup(with: equipmentCellData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        
        vc?.row = indexPath.row
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}


extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let bound = collectionView.bounds.width
        
        var spacing = (Int(bound) - 242) / 2
        
        //spacing -= 2
        
        print("bound = \(bound)")
        
        print("spacing = \(spacing)")
    
        
        if (((Int(bound) - 60) / 111) == 2) == true{
            return UIEdgeInsets(top: 0, left: CGFloat(spacing), bottom: 0, right: CGFloat(spacing))
        } else {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        //return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let minWidth = 111
//        let screenBounds = collectionView.bounds
//        let amountOfCellsInRow = (Int(screenBounds.width) - 60) / minWidth
//
//        var cellWidth = minWidth
//
//        cellWidth = (Int(screenBounds.width) - 60) / 2
        
        return CGSize(width: 111, height: 128)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        

        //if (((Int(collectionView.bounds.width) - 60) / 111) == 2) == true{ return 40 }
        //else{ return 20 }
        
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}


extension UIView {
@IBInspectable var cornerRadius: CGFloat {
    get {
        return layer.cornerRadius
    }
    set {
        layer.cornerRadius = newValue
        layer.masksToBounds = newValue > 0
    }
}

}
