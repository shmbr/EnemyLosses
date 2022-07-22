//
//  Extentions.swift
//  EnemyLosses
//
//  Created by Yu_SHMBR on 19.07.2022.
//

import UIKit

extension ViewController: UICollectionViewDataSource{

    /// set amount of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        /// due to input data changing after 67 we are hiding unnecessary separeted auto and fuel cells to avoid duplicate information
        if Int(dayLabel.text!)! >= 67{ return equipmentCellData.count - 2 }
        else { return equipmentCellData.count }
    }
    
    /// set cells main params
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TechniqueCollectionViewCell", for: indexPath) as! TechniqueCollectionViewCell
        cell.setup(with: equipmentCellData[indexPath.row])
        return cell
    }
    
    /// cell pressed action, go to new storyboard
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        vc?.row = indexPath.row
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}


extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        /// spacing depends on device size
        let boundsWidth = collectionView.bounds.width
        /// spacing bettwen view bound and cell bound  depends on min cell witdh (111) * 2 +  prefereble space bettwen two cells (20)
        let spacing = (Int(boundsWidth) - 242) / 2
        
        /// two cells per row case and more than two cells case
        if (((Int(boundsWidth) - 60) / 111) == 2) == true{
            return UIEdgeInsets(top: 0, left: CGFloat(spacing), bottom: 0, right: CGFloat(spacing))
        } else {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    /// set cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 111, height: 128)
    }
    
    /// set cell spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    /// set cell spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

// add corner radius params setting
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
