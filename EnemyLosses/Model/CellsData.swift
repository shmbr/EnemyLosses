//
//  Technique.swift
//  EnemyLosses
//
//  Created by Yu_SHMBR on 15.07.2022.
//

import UIKit

struct Technique{
    let title: String
    let image: UIImage
    var amount: Int
    var prewDayAmount: Int
}

// default cell data (second day)
var equipmentCellData: [Technique] = [
    Technique(title: "Літаки", image: UIImage(named: "aircraft")!, amount: 10, prewDayAmount: 0),
    Technique(title: "Танки", image: UIImage(named: "tank")!, amount: 80, prewDayAmount: 0),
    Technique(title: "БТР", image: UIImage(named: "btr")!, amount: 516, prewDayAmount: 0),
    Technique(title: "Артилерія", image: UIImage(named: "artillery")!, amount: 49, prewDayAmount: 0),
    Technique(title: "РСЗВ", image: UIImage(named: "missile")!, amount: 4, prewDayAmount: 0),
    Technique(title: "Гелікоптери", image: UIImage(named: "helicopter")!, amount: 7, prewDayAmount: 0),
    Technique(title: "Дрони", image: UIImage(named: "drone")!, amount: 0, prewDayAmount: 0),
    Technique(title: "Кораблі", image: UIImage(named: "warship")!, amount: 2, prewDayAmount: 0),
    Technique(title: "ППО", image: UIImage(named: "air-defence")!, amount: 0, prewDayAmount: 0),
    Technique(title: "Спеціальне обладнання", image: UIImage(named: "specialEquipment")!, amount: 0, prewDayAmount: 0),
    Technique(title: "Транспорт і цистерни", image: UIImage(named: "fuelAndCar")!, amount: 0, prewDayAmount: 0),
    Technique(title: "Ракети", image: UIImage(named: "rocket")!, amount: 0, prewDayAmount: 0),
    Technique(title: "Автомобілі", image: UIImage(named: "car")!, amount: 100, prewDayAmount: 0),
    Technique(title: "Цистерни", image: UIImage(named: "fuel-tank")!, amount: 60, prewDayAmount: 0),
]
