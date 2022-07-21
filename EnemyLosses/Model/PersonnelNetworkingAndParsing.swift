//
//  PersonnelNetworkAndParsing.swift
//  EnemyLosses
//
//  Created by Yu_SHMBR on 19.07.2022.
//

import Foundation

var personnelLossesArr: Array<Personnel> = []

func getPersonnelData(){
    guard let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json") else{
        return
    }
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        if let data = data, let string = String(data: data, encoding: .utf8){

            //print(string)
            let json = string
            // simulated api data
            let data = json.data(using: .utf8)!
            // convert to string
            let jsString = String(data: data, encoding: .utf8)!
            // convert back to data after replacements
            let newData = jsString.replacingOccurrences(of: "NaN", with: "null").data(using: .utf8)!
            DispatchQueue.main.async {
                do {
                    personnelLossesArr = try JSONDecoder().decode([Personnel].self, from: newData)
                    //print("pers data loaded")
                    
                } catch (let error) {
                    print("\n---> error: \(error)")
                }
                
            }
            
        }
    }
    task.resume()
}
