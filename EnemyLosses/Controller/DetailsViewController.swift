//
//  DetailsViewController.swift
//  EnemyLosses
//
//  Created by Yu_SHMBR on 20.07.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var totalLable: UILabel!
    @IBOutlet weak var prewDayLabel: UILabel!
    
    var row = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLable.text = equipmentCellData[row].title
        totalLable.text = String(equipmentCellData[row].amount)
        prewDayLabel.text = String(equipmentCellData[row].amount - equipmentCellData[row].prewDayAmount)
        mainImage.image = equipmentCellData[row].image
    }
}
