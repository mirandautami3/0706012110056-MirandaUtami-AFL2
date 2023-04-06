//
//  ManaPotion.swift
//  0706012110056-MirandaUtami-AFL1
//
//  Created by miranda on 01/04/23.
//

import Foundation

class ManaPotion : Item {
    var amount: Int = 30
    
    func regeneration() {
        amount -= 1
    }
}
