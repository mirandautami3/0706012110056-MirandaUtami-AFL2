//
//  Golem.swift
//  0706012110056-MirandaUtami-AFL1
//
//  Created by miranda on 01/04/23.
//

import Foundation

class Golem : Enemy{
    var golem = enemy(name: "Golem", health: 1000, attack: 5)

    func spikedShield(){
/* Untuk generate random number penggunaan skill troll*/
        let randomNumber = Int.random(in: 1...5)
        
        if randomNumber == 1 {
            print("Golem use Spiked Shield !!")
            attacks()
            golem.health += 30
            print("Your health \(user.health)")
        }
    }
    
    override func attacks() {
        user.health -= golem.attack
    }
}
