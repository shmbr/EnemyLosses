//
//  ViewController.swift
//  EnemyLosses
//
//  Created by Yu_SHMBR on 14.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var soldiersAmountLabel: UILabel!
    @IBOutlet weak var prisonersAmountLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dataTextField: UITextField!
    
    let dataPicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPersonnelData()
        getEquipmentData()
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        createDataPicker()
    }
    
    func createToolBar() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneButton], animated: true)
        toolBar.backgroundColor = UIColor.black
        
        return toolBar
    }
    
    func createDataPicker(){
        dataPicker.preferredDatePickerStyle = .inline
        dataPicker.datePickerMode = .date
        dataPicker.backgroundColor = myMiddleGreenColor
        
        dataPicker.minimumDate = Calendar(identifier: .gregorian).date(from: DateComponents(year: 2022, month: 2, day: 25))
        dataPicker.maximumDate = Calendar(identifier: .gregorian).date(from: DateComponents(year: 2022, month: 7, day: 21))
        
        dataTextField.inputView = dataPicker
        dataTextField.inputAccessoryView = createToolBar()
    }
    
    @objc func donePressed(){
        
        /// animation section
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.subtype = CATransitionSubtype.fromTop
        animation.duration = 0.25
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeZone = .none

        let dayyy = dataPicker.date
        let fmt = ISO8601DateFormatter()
        let date0 = fmt.date(from: "2022-2-22T00:00:00+0000")!
        let diffs = Calendar.current.dateComponents([ .day], from: date0, to: dayyy)
        
        self.dataTextField.text = dateFormatter.string(from: dataPicker.date)
        self.dataTextField.layer.add(animation, forKey: CATransitionType.fade.rawValue)

        self.dayLabel.text = "\(diffs.day!)"
        self.dayLabel.layer.add(animation, forKey: CATransitionType.fade.rawValue)
        
        self.soldiersAmountLabel.text = "\(personnelLossesArr[diffs.day! - 2].soldiers ?? 0)"
        self.soldiersAmountLabel.layer.add(animation, forKey: CATransitionType.fade.rawValue)
        
                
        if(personnelLossesArr[diffs.day! - 2].prisoners == nil){
            prisonersAmountLabel.font = prisonersAmountLabel.font.withSize(15)
            prisonersAmountLabel.text = "Немає даних"
        } else {
            prisonersAmountLabel.font = prisonersAmountLabel.font.withSize(18)
            self.prisonersAmountLabel.text = "\(personnelLossesArr[diffs.day! - 2].prisoners!)"
            self.prisonersAmountLabel.layer.add(animation, forKey: CATransitionType.fade.rawValue)
        }
        
        self.view.endEditing(true)
        
        equipmentCellData[0].amount = equimpentLossesArr[diffs.day! - 2].aircraft ?? 0
        equipmentCellData[1].amount = equimpentLossesArr[diffs.day! - 2].tank ?? 0
        equipmentCellData[2].amount = equimpentLossesArr[diffs.day! - 2].APC ?? 0
        equipmentCellData[3].amount = equimpentLossesArr[diffs.day! - 2].artillery ?? 0
        equipmentCellData[4].amount = equimpentLossesArr[diffs.day! - 2].MRL ?? 0
        equipmentCellData[5].amount = equimpentLossesArr[diffs.day! - 2].helicopter ?? 0
        equipmentCellData[6].amount = equimpentLossesArr[diffs.day! - 2].drone ?? 0
        equipmentCellData[7].amount = equimpentLossesArr[diffs.day! - 2].ship ?? 0
        equipmentCellData[8].amount = equimpentLossesArr[diffs.day! - 2].PPO ?? 0
        equipmentCellData[9].amount = equimpentLossesArr[diffs.day! - 2].specialEquipment ?? 0
        equipmentCellData[10].amount = equimpentLossesArr[diffs.day! - 2].venicleAndFuel ?? 0
        equipmentCellData[11].amount = equimpentLossesArr[diffs.day! - 2].rocket ?? 0
        equipmentCellData[12].amount = equimpentLossesArr[diffs.day! - 2].auto ?? 0
        equipmentCellData[13].amount = equimpentLossesArr[diffs.day! - 2].fuel ?? 0
        
        if diffs.day! > 2{
            equipmentCellData[0].prewDayAmount = equimpentLossesArr[diffs.day! - 3].aircraft ?? 0
            equipmentCellData[1].prewDayAmount = equimpentLossesArr[diffs.day! - 3].tank ?? 0
            equipmentCellData[2].prewDayAmount = equimpentLossesArr[diffs.day! - 3].APC ?? 0
            equipmentCellData[3].prewDayAmount = equimpentLossesArr[diffs.day! - 3].artillery ?? 0
            equipmentCellData[4].prewDayAmount = equimpentLossesArr[diffs.day! - 3].MRL ?? 0
            equipmentCellData[5].prewDayAmount = equimpentLossesArr[diffs.day! - 3].helicopter ?? 0
            equipmentCellData[6].prewDayAmount = equimpentLossesArr[diffs.day! - 3].drone ?? 0
            equipmentCellData[6].prewDayAmount = equimpentLossesArr[diffs.day! - 3].ship ?? 0
            equipmentCellData[8].prewDayAmount = equimpentLossesArr[diffs.day! - 3].PPO ?? 0
            equipmentCellData[9].prewDayAmount = equimpentLossesArr[diffs.day! - 2].specialEquipment ?? 0
            equipmentCellData[10].prewDayAmount = equimpentLossesArr[diffs.day! - 3].venicleAndFuel ?? 0
            equipmentCellData[11].prewDayAmount = equimpentLossesArr[diffs.day! - 3].rocket ?? 0
            equipmentCellData[12].prewDayAmount = equimpentLossesArr[diffs.day! - 3].auto ?? 0
            equipmentCellData[13].prewDayAmount = equimpentLossesArr[diffs.day! - 3].fuel ?? 0
        } else {
            for i in 0...13 {
                equipmentCellData[i].prewDayAmount = 0
            }
        }
        collectionView.reloadData()
    }
}
