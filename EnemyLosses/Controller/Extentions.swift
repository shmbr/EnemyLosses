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
        return equipmentCellData.count
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
        
        let bound = collectionView.bounds.width
        let spacing = (Int(bound) - 242) / 2
        
        /// two cells per row case and more than two cells case
        if (((Int(bound) - 60) / 111) == 2) == true{
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
