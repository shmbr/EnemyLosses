//
//  TechniqueCollectionViewCell.swift
//  EnemyLosses
//
//  Created by Yu_SHMBR on 15.07.2022.
//

import UIKit

class TechniqueCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var techniqueImage: UIImageView!
    @IBOutlet weak var techniqueNameLabel: UILabel!
    @IBOutlet weak var techniqueAmountLabel: UILabel!
    
    func setup(with technique: Technique){
        techniqueImage.image = technique.image
        techniqueNameLabel.text = String(technique.title)
        techniqueAmountLabel.text = String(technique.amount)
    }
}
 
