//
//  PersonnelNetworkAndParsing.swift
//  EnemyLosses
//
//  Created by Yu_SHMBR on 19.07.2022.
//

import Foundation

/// input arr
var personnelLossesArr: Array<Personnel> = []

func getPersonnelData(){
    guard let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json") else{
        return
    }
    /// get and parse JSON file initialize input arr
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        if let data = data, let string = String(data: data, encoding: .utf8){
            /// check JSON for 'NaN' and changing it to 'null'
            let newData = string.replacingOccurrences(of: "NaN", with: "null").data(using: .utf8)!
            DispatchQueue.main.async {
                do {
                    personnelLossesArr = try JSONDecoder().decode([Personnel].self, from: newData)
                } catch (let error) {
                    print("\n---> error: \(error)")
                }
            }
        }
    }
    task.resume()
}
