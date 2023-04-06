//
//  Troll.swift
//  0706012110056-MirandaUtami-AFL1
//
//  Created by miranda on 01/04/23.
//

import Foundation

class Troll : Enemy{
    var troll = enemy(name: "Troll", health: 1000, attack: 5)
    
    func doubleAttack(){
/* Untuk generate random number penggunaan skill troll*/
        let randomNumber = Int.random(in: 1...5)
        
        if randomNumber == 1 {
            user.health -= (troll.attack * 2)
            print("Troll attack with double attack")
            print("Your health is \(user.health)")
        }
    }
    
    override func attacks(){
        user.health -= troll.attack
    }
}
