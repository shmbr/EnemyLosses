//
//  Personnel.swift
//  EnemyLosses
//
//  Created by Yu_SHMBR on 18.07.2022.
//

import Foundation

struct Personnel: Codable {
    
    var date: String?
    var day: Int?
    var soldiers: Int?
    var prisoners: Int?
    
    enum CodingKeys: String, CodingKey {
        case soldiers = "personnel"
        case prisoners = "POW"
        case date, day
    }
}
