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
    
    let secondDayData = equipmentCellData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// load data
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
    
    /// majority of app logic depends on date changing, so choosing new date is main trigger
    @objc func donePressed(){
        
        /// animation section
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.subtype = CATransitionSubtype.fromTop
        animation.duration = 0.25
        
        /// date formatting
        let dateFormatter1 = ISO8601DateFormatter()
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateStyle = .short
        dateFormatter2.timeZone = .none
        
        /// count dates difference
        let mainDay = dataPicker.date
        let date0 = dateFormatter1.date(from: "2022-2-22T00:00:00+0000")!
        let diffs = Calendar.current.dateComponents([ .day], from: date0, to: mainDay)
        
        /// change textField text with animation
        self.dataTextField.text = dateFormatter2.string(from: dataPicker.date)
        self.dataTextField.layer.add(animation, forKey: CATransitionType.fade.rawValue)
        
        /// change label text with animation
        self.dayLabel.text = "\(diffs.day!)"
        self.dayLabel.layer.add(animation, forKey: CATransitionType.fade.rawValue)
        
        /// change label text with animation
        self.soldiersAmountLabel.text = "\(personnelLossesArr[diffs.day! - 2].soldiers ?? 0)"
        self.soldiersAmountLabel.layer.add(animation, forKey: CATransitionType.fade.rawValue)
        
        /// updete view due to available information about prisoners amount
        if(personnelLossesArr[diffs.day! - 2].prisoners == nil){
            prisonersAmountLabel.font = prisonersAmountLabel.font.withSize(15)
            prisonersAmountLabel.text = "Немає даних"
        } else {
            prisonersAmountLabel.font = prisonersAmountLabel.font.withSize(18)
            self.prisonersAmountLabel.text = "\(personnelLossesArr[diffs.day! - 2].prisoners!)"
            self.prisonersAmountLabel.layer.add(animation, forKey: CATransitionType.fade.rawValue)
        }
        
        /// update cells information        
        if diffs.day! > 2{
            equipmentCellData[0] = Technique(title: equipmentCellData[0].title, image: equipmentCellData[0].image, amount: equimpentLossesArr[diffs.day! - 2].aircraft ?? 0, prewDayAmount: equimpentLossesArr[diffs.day! - 3].aircraft ?? 0)
            equipmentCellData[1] = Technique(title: equipmentCellData[1].title, image: equipmentCellData[1].image, amount: equimpentLossesArr[diffs.day! - 2].tank ?? 0, prewDayAmount: equimpentLossesArr[diffs.day! - 3].tank ?? 0)
            equipmentCellData[2] = Technique(title: equipmentCellData[2].title, image: equipmentCellData[2].image, amount: equimpentLossesArr[diffs.day! - 2].APC ?? 0, prewDayAmount: equimpentLossesArr[diffs.day! - 3].APC ?? 0)
            equipmentCellData[3] = Technique(title: equipmentCellData[3].title, image: equipmentCellData[3].image, amount: equimpentLossesArr[diffs.day! - 2].artillery ?? 0, prewDayAmount: equimpentLossesArr[diffs.day! - 3].artillery ?? 0)
            equipmentCellData[4] = Technique(title: equipmentCellData[4].title, image: equipmentCellData[4].image, amount: equimpentLossesArr[diffs.day! - 2].MRL ?? 0, prewDayAmount: equimpentLossesArr[diffs.day! - 3].MRL ?? 0)
            equipmentCellData[5] = Technique(title: equipmentCellData[5].title, image: equipmentCellData[5].image, amount: equimpentLossesArr[diffs.day! - 2].helicopter ?? 0, prewDayAmount: equimpentLossesArr[diffs.day! - 3].helicopter ?? 0)
            equipmentCellData[6] = Technique(title: equipmentCellData[6].title, image: equipmentCellData[6].image, amount: equimpentLossesArr[diffs.day! - 2].drone ?? 0, prewDayAmount: equimpentLossesArr[diffs.day! - 3].drone ?? 0)
            equipmentCellData[7] = Technique(title: equipmentCellData[7].title, image: equipmentCellData[7].image, amount: equimpentLossesArr[diffs.day! - 2].ship ?? 0, prewDayAmount: equimpentLossesArr[diffs.day! - 3].ship ?? 0)
            equipmentCellData[8] = Technique(title: equipmentCellData[8].title, image: equipmentCellData[8].image, amount: equimpentLossesArr[diffs.day! - 2].PPO ?? 0, prewDayAmount: equimpentLossesArr[diffs.day! - 3].PPO ?? 0)
            equipmentCellData[9] = Technique(title: equipmentCellData[9].title, image: equipmentCellData[9].image, amount: equimpentLossesArr[diffs.day! - 2].specialEquipment ?? 0, prewDayAmount: equimpentLossesArr[diffs.day! - 3].specialEquipment ?? 0)
            equipmentCellData[10] = Technique(title: equipmentCellData[10].title, image: equipmentCellData[10].image, amount: equimpentLossesArr[diffs.day! - 2].venicleAndFuel ?? 0, prewDayAmount: equimpentLossesArr[diffs.day! - 3].venicleAndFuel ?? 0)
            equipmentCellData[11] = Technique(title: equipmentCellData[11].title, image: equipmentCellData[11].image, amount: equimpentLossesArr[diffs.day! - 2].rocket ?? 0, prewDayAmount: equimpentLossesArr[diffs.day! - 3].rocket ?? 0)
            equipmentCellData[12] = Technique(title: equipmentCellData[12].title, image: equipmentCellData[12].image, amount: equimpentLossesArr[diffs.day! - 2].auto ?? 0, prewDayAmount: equimpentLossesArr[diffs.day! - 3].auto ?? 0)
            equipmentCellData[13] = Technique(title: equipmentCellData[13].title, image: equipmentCellData[13].image, amount: equimpentLossesArr[diffs.day! - 2].fuel ?? 0, prewDayAmount: equimpentLossesArr[diffs.day! - 3].fuel ?? 0)
        } else {
            equipmentCellData = secondDayData
        }

        /// reload data and end editing
        collectionView.reloadData()
        self.view.endEditing(true)
    }
}
