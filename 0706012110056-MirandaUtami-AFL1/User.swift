//
//  User.swift
//  0706012110056-MirandaUtami-AFL1
//
//  Created by miranda on 30/03/23.
//

import Foundation
/* struct */
struct User{
    var username: String?
    var health = 80
    var energi = 30
    
    
    
/* Tampilan heal wound */
    mutating func healWound(){
        while index == 0 {
            print ("""
               
               Your HP is \(health)
               Your have \(healthPotion.amount) Potion
               
               Are you sure want to use 1 potion to heal wound? [Y/N]
               
               """)
            
            input = readLine()?.uppercased()
            
            if input == "Y" {
                if healthPotion.amount > 0{
                    if health == 100{
                        print("Health is Full")
                    } else if health < 100 {
                        health += 20
                        healthPotion.amount -= 1
                        if health > 100 {
                            health = 100
                        }
                    }
                } else {
                    while index == 0 {
                        print("""
                              You don't have any potion left. Be careful of your next journey.
                              
                              press [return] to go back:
                              """)
                        
                        input = readLine()
                        
                        if input == "" {
                            break
                        }else if input != ""{
                            print ("MOHON MAAF INPUT SALAH!!")
                        }
                    }
                }
            } else if input == "N" {
                break
            } else {
                print("MOHON MAAF INPUT SALAH!!")
            }
        }
    }
    
    
    
/* function mana wound */
    mutating func manaWound(){
        while index == 0 {
            print ("""
               
               Your Mana is \(energi)
               Your have \(manaPotion.amount) Potion
               
               Are you sure want to use 1 potion to Mana wound? [Y/N]
               
               """)
            
            input = readLine()?.uppercased()
            
            if input == "Y" {
                if manaPotion.amount > 0{
                    if energi == 50{
                        print("Mana is Full")
                    } else if energi < 50 {
                        energi += 20
                        manaPotion.amount -= 1
                        if energi > 50 {
                            energi = 50
                        }
                    }
                } else {
                    while index == 0 {
                        print("""
                              You don't have any mana potion left. Be careful of your next journey.
                              
                              press [return] to go back:
                              """)
                        
                        input = readLine()
                        
                        if input == "" {
                            break
                        }else if input != ""{
                            print ("MOHON MAAF INPUT SALAH!!")
                        }
                    }
                }
            } else if input == "N" {
                break
            } else {
                print("MOHON MAAF INPUT SALAH!!")
            }
        }
    }
    
    
    
/* function shield */
    mutating func shield(){
        if energi > 10 {
            energi -= 10
            print("You use shield, your health is \(health)")
        } else {
            print("Your mana is \(energi), you can't use shield")
        }
    }
    
    
    
/* function physical Golem */
    mutating func physicalGolem(){
        if health > 0 && golem.golem.health > 0 {
            golem.golem.health -= 5
            golem.attacks()
            golem.spikedShield()
            print("Your health is \(health)")
            
            if health <= 0 {
                health = 0
                print("You lose")
                exit(1)
            }
            if golem.golem.health < 0 {
                golem.golem.health = 0
                print("You win")
            }
        }
    }
    
    
    
/* function physical Troll */
    mutating func physicalTroll(){
        if health > 0 && troll.troll.health > 0 {
            troll.troll.health -= 5
            troll.attacks()
            troll.doubleAttack()
            print("Your health is \(health)")
            
            if health <= 0 {
                health = 0
                print("You lose")
                exit(1)
            }
            if troll.troll.health < 0 {
                troll.troll.health = 0
                print("You win")
            }
        }
    }
    
    
    
/* function meteor Golem */
    mutating func meteorGolem(){
        if energi > 15{
            if health > 0 && golem.golem.health > 0 {
                golem.golem.health -= 50
                energi -= 15
                golem.attacks()
                golem.spikedShield()
                print("Your health is \(health)")
                
                if health <= 0 {
                    health = 0
                    print("You lose")
                    exit(1)
                }
                if golem.golem.health < 0 {
                    golem.golem.health = 0
                    print("You win")
                }
            }
        } else {
            print("Your mana is \(user.energi), you can't use this attack")
        }
    }
    
    
    
/* function meteor troll */
    mutating func meteorTroll(){
        if energi > 15{
            if health > 0 && troll.troll.health > 0 {
                troll.troll.health -= 50
                troll.attacks()
                troll.doubleAttack()
                energi -= 15
                print("Your health is \(health)")
                
                if health <= 0 {
                    health = 0
                    print("You lose")
                    exit(1)
                }
                if troll.troll.health < 0 {
                    troll.troll.health = 0
                    print("You win")
                }
            }
        } else {
            print("Your mana is \(user.energi), you can't use this attack")
        }
    }
    
    
    
/* function vital Golem */
    mutating func vitalGolem(){
        if health > 0 && golem.golem.health > 0 {
            golem.golem.health -= 20
            golem.attacks()
            golem.spikedShield()
            print("You attack monster vital with 20 damage")
            print("Your health is \(health)")
            
            if health <= 0 {
                health = 0
                print("You lose")
                exit(1)
            }
            if golem.golem.health < 0 {
                golem.golem.health = 0
                print("You win")
            }
        }
    }
    
    
    
/* function vital Troll */
    mutating func vitalTroll(){
        if health > 0 && troll.troll.health > 0 {
            troll.troll.health -= 20
            troll.attacks()
            troll.doubleAttack()
            print("You attack monster vital with 20 damage")
            print("Your health is \(health)")
            
            if health <= 0 {
                health = 0
                print("You lose")
                exit(1)
            }
            if troll.troll.health < 0 {
                troll.troll.health = 0
                print("You win")
            }
        }
    }
}
