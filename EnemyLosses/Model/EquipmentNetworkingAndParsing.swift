//
//  NetworkAndJSON.swift
//  EnemyLosses
//
//  Created by Yu_SHMBR on 18.07.2022.
//

import Foundation

var equimpentLossesArr: Array<Equipment> = []

func getEquipmentData(){
    guard let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json") else{
        return
    }
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        if let data = data, let string = String(data: data, encoding: .utf8){
            let json = string
            // simulated api data
            let data = json.data(using: .utf8)!
            // convert to string
            let jsString = String(data: data, encoding: .utf8)!
            // convert back to data after replacements
            let newData = jsString.replacingOccurrences(of: "NaN", with: "null").data(using: .utf8)!
           
            DispatchQueue.main.async {
                do {
                    equimpentLossesArr = try JSONDecoder().decode([Equipment].self, from: newData)
                    //print("equip data loaded")
                    
                } catch (let error) {
                    print("\n---> error: \(error)")
                }
            }
        }
        
    }
    task.resume()
}

