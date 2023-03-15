//
//  main.swift
//  0706012110056-MirandaUtami-AFL1
//
//  Created by miranda on 28/02/23.
//

import Foundation

var index = 0
var input: String? = nil
var username: String?
var health = 100
var energi = 50
var potion = 20
var trollHealth = 1000
var golemHealth = 1000
var troll = 1
var golem = 1

// Creating an empty array //
var enemyName: [String] = ["Troll","Golem"]
let actions = ["Physical Attack", "Meteor", "Shield", "Use Potion", "Scan Enemy", "Flee"]


//panggil function
tampilanAwal()
welcome()
journey()


func tampilanAwal() {
    while index == 0 {
        print("""
            Welcome to the world of magic! 🧙‍♀️🧌

            You have been chosen to embark on an epic journey as young wizard on the path to becoming a master of the arcane arts. Your adventures will take you throught forests 🌲, mountain 🏔️, and dungeons 🏰, where you will face challenges, make allies and fight enemies.

            Press [return] to continue:
            """)
        
        input = readLine()
        if input == "" {
            break
        }else if input != ""{
            print ("mohon maaf input salah")
        }
    }
}


func welcome(){
    while index == 0 {
        print ("May I know your name, a young wizard?")
        
        if let input = readLine() {
            if input.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil && input != "" {
                username = input
                break
            }
        }
        print("Masukkan huruf saja, hindari space !")
    }
    if let usernameFix = username{
        print("")
        print("Nice to meet you \(usernameFix)")
    }else{
        print ("mohon maaf input salah")
    }
}


func journey(){
    while index == 0 {
        print ("""
               From here, you can
               
               [C] Check your health and start
               [H] Heal your wounds with potion
               
               Or choose where you want to go
               
               [F] Forest or troll
               [M] Mountain of golem
               [Q] Quit games
               
               Your choise?
               """)
        input = readLine()?.uppercased()
        
        switch input {
            case "C":
                playerStats()
            case "H":
                healWound()
            case "F":
                forestOfTroll()
            case "M":
                mountainOfGolem()
            case "Q":
                exit(1)
            default:
                print("inputan salah !")
        }
    }
}


func playerStats(){
    while index == 0 {
        if let usernameFix = username{
            print("")
            print("Player Name \(usernameFix)")
        }else{
            print ("mohon maaf input salah")
        }
       
        print ("""
               HP = 100/\(health)
               MP = 50/\(energi)
               
               Magic :
               - physical Attack. No mana required. Deal 5pt of damage.
               - Meteor. Use 15 pt of MP. Deal 50pt of damage.
               - Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
               
               Items :
               - Potion x10. Heal 20pt of your MP.
               - Elixir x5. Add 10pt of your MP
               
               press [return] to go back:
               """)
        
        input = readLine()
        if input == "" {
            break
        }else if input != ""{
            print ("mohon maaf input salah !!")
        }
    }
}


func healWound(){
    while index == 0 {
        print ("""
           
           Your HP is \(health)
           Your have \(potion) Potion
           
           Are you sure want to use 1 potion to heal wound? [Y/N]
           
           """)
        
        input = readLine()?.uppercased()
        
        if input == "Y" {
            if potion > 0{
                if health == 100{
                    print("Health is Full")
                } else if health < 100 {
                    health += 20
                    potion -= 1
                   // print("""
                     //     Anda sudah mengobati, nyawa anda jadi: \(health)
                       //   Potion anda tersisa \(potion) Potion
                       //   """)
                    
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
                        print ("mohon maaf input salah")
                    }
                }
            }
        } else if input == "N" {
            break
        } else {
            print("Inputan salah")
        }
    }
}


func forestOfTroll(){
    while index == 0 {
        print("""
              As you enter the forest, you fell a sense of unease wash over you.
              Suddenly, you hear the sound of twigs snapping behind you. you quickly spin around, and find a troll emerging from the shadows.
              
              😈 Nama   : \(enemyName[0]) x\(troll)
              😈 Health : \(trollHealth)
              
              Choose your action :
              [1] physical Attack. No mana required. Deal 5pt of damage.
              [2] Meteor. Use 15pt of MP. Deal 50pt of damage.
              [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
              
              [4] Use potion to heal wound.
              [5] Scan enemy's vital.
              [6] Flee from battle.
              
              Your Choice?
              """)
        
        input = readLine()
        
        if input == "1" {
            if health > 0 && trollHealth > 0 {
                trollHealth -= 5
                health -= 5
                
                if health < 0 {
                    health = 0
                    print("You lose")
                    exit(1)
                }
                if trollHealth < 0 {
                    trollHealth = 0
                    print("You win")
                    break
                }
            }
        }else if input == "2"{
            if energi > 15{
                if health > 0 && trollHealth > 0 {
                    trollHealth -= 50
                    health -= 5
                    energi -= 15
                    
                    if health < 0 {
                        health = 0
                        print("You lose")
                        exit(1)
                    }
                    if trollHealth < 0 {
                        trollHealth = 0
                        print("You win")
                        break
                    }
                }
            } else {
                print("Your mana is \(energi), you can't use this attack")
            }
        }else if input == "3"{
            if energi > 10 {
                energi -= 10
                print("You use shield, your health is \(health)")
            } else {
                print("Your mana is \(energi), you can't use shield")
            }
        }else if input == "4"{
            healWound()
        }else if input == "5"{
            if health > 0 && trollHealth > 0 {
                trollHealth -= 20
                health -= 5
                print("You attack monster vital with 20 damage")
                if health < 0 {
                    health = 0
                    print("You lose")
                    exit(1)
                }
                if trollHealth < 0 {
                    trollHealth = 0
                    print("You win")
                    break
                }
            }
        }else if input == "6"{
            keluarPertandingan()
            break
        }else{
            print("Input not valid !!")
        }
    }
}


func mountainOfGolem(){
    while index == 0 {
        print("""
              As you make your way through the rugged montain terrain, you can fell the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your freeze in your tracks. that's when you see it - a massive ,snarling Golem emerging from the shadows.
              
              😈 Nama   : \(enemyName[0]) x\(golem)
              😈 Health : \(golemHealth)
              
              Choose your action :
              [1] physical Attack. No mana required. Deal 5pt of damage.
              [2] Meteor. Use 15pt of MP. Deal 50pt of damage.
              [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
              
              [4] Use potion to heal wound.
              [5] Scan enemy's vital.
              [6] Flee from battle.
              
              Your Choice?
              """)
        
        input = readLine()
        if input == "1" {
            if health > 0 && golemHealth > 0 {
                golemHealth -= 5
                health -= 5
                
                if health < 0 {
                    health = 0
                    print("You lose")
                    exit(1)
                }
                if golemHealth < 0 {
                    golemHealth = 0
                    print("You win")
                    break
                }
            }
            
        }else if input == "2"{
            if energi > 15{
                if health > 0 && golemHealth > 0 {
                    golemHealth -= 50
                    health -= 5
                    energi -= 15
                    
                    if health < 0 {
                        health = 0
                        print("You lose")
                        exit(1)
                    }
                    if golemHealth < 0 {
                       golemHealth = 0
                        print("You win")
                        break
                    }
                }
            } else {
                print("Your mana is \(energi), you can't use this attack")
            }
            
        }else if input == "3"{
            if energi > 10 {
                energi -= 10
                print("You use shield, your health is \(health)")
            } else {
                print("Your mana is \(energi), you can't use shield")
            }
            
        }else if input == "4"{
            healWound()
            
        }else if input == "5"{
            if health > 0 && golemHealth > 0 {
                golemHealth -= 20
                health -= 5
                print("You attack monster vital with 20 damage")
                if health < 0 {
                    health = 0
                    print("You lose")
                    exit(1)
                }
                if golemHealth < 0 {
                    golemHealth = 0
                    print("You win")
                    break
                }
            }
            
        }else if input == "6"{
            keluarPertandingan()
            break
        }else{
            print("Mohon maaf Input salah !!")
        }
    }
}


func keluarPertandingan(){
    while index == 0 {
        print("""
              You fell that if you don't escape soon,you won't be able to continue the fight. You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.
              
              Your save for now.
              press [return] to go back:
              """)
        
        input = readLine()
        if input == "" {
            break
        }else if input != ""{
            print ("mohon maaf input salah")
            continue
        }
    }
}
