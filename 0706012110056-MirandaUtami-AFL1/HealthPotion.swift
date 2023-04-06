//
//  HealthPotion.swift
//  0706012110056-MirandaUtami-AFL1
//
//  Created by miranda on 01/04/23.
//

import Foundation

class HealthPotion : Item {
    var amount: Int = 20
    
    func regeneration() {
        amount -= 1
    }
}
