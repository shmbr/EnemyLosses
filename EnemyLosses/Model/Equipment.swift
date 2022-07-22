//
//  Equipment.swift
//  EnemyLosses
//
//  Created by Yu_SHMBR on 19.07.2022.
//

import Foundation

/// russia_losses_equipment.json data model
struct Equipment: Codable {
    
    var date: String?
    var day: Day
    var aircraft: Int?
    var helicopter: Int?
    var tank:Int?
    var APC: Int?
    var MRL: Int?
    var drone: Int?
    var artillery: Int?
    var auto: Int?
    var fuel: Int?
    var ship: Int?
    var PPO: Int?
    var specialEquipment: Int?
    var SRBM: Int?
    var venicleAndFuel: Int?
    var rocket: Int?
    
    enum CodingKeys: String, CodingKey {
        case artillery = "field artillery"
        case auto = "military auto"
        case fuel = "fuel tank"
        case ship = "naval ship"
        case PPO = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case SRBM = "mobile SRBM system"
        case venicleAndFuel = "vehicles and fuel tanks"
        case rocket = "cruise missiles"
        case date, day, aircraft, helicopter, tank, APC, MRL, drone
    }
}

/// 'Day' created to avoid collision with wrong data types ("9" day is the ony String day)
enum Day: Codable {
    case int(Int)
    case string(String)

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .int(let v): try container.encode(v)
        case .string(let v): try container.encode(v)
        }
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()

        if let v = try? value.decode(Int.self) {
            self = .int(v)
            return
        } else if let v = try? value.decode(String.self) {
            self = .string(v)
            return
        }
        throw Day.ParseError.notRecognizedType(value)
    }

    enum ParseError: Error {
        case notRecognizedType(Any)
    }
}
