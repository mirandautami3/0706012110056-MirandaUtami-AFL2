//
//  main.swift
//  0706012110056-MirandaUtami-AFL1
//
//  Created by miranda on 28/02/23.
//

import Foundation

// inisialisasi variable dan attribute dari user dan monster
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


// Tampiilan awal
func tampilanAwal() {
    while index == 0 {
        print("""
            Welcome to the world of magic! 🧙‍♀️🧌

            You have been chosen to embark on an epic journey as young wizard on the path to becoming a master of the arcane arts. Your adventures will take you throught forests 🌲, mountain 🏔️, and dungeons 🏰, where you will face challenges, make allies and fight enemies.

            Press [return] to continue:
            """)
        
//        Cek apakah inputan enter
        input = readLine()
        if input == "" {
            break
        }else if input != ""{
            print ("mohon maaf input salah")
        }
    }
}


// Tampilan welcome
func welcome(){
    while index == 0 {
        print ("May I know your name, a young wizard?")
        
//        Cek apakah inputan huruf saja atau tidak
        if let input = readLine() {
            if input.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil && input != "" {
                username = input
                break
            }
        }
        print("Masukkan huruf saja, hindari space !")
    }
//    Merubah Optional menjadi fix
    if let usernameFix = username{
        print("")
        print("Nice to meet you \(usernameFix)")
    }else{
        print ("mohon maaf input salah")
    }
}


// tampilan journey
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
        
//        Switch untuk membuat sebuah kondisi inputan
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


// Tampilan player stats
func playerStats(){
    while index == 0 {
//        Merubah optional menjadi fix
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
        
//        Cek apakah inputan enter
        input = readLine()
        if input == "" {
            break
        }else if input != ""{
            print ("mohon maaf input salah !!")
        }
    }
}


// Tampilan heal wound
func healWound(){
    while index == 0 {
        print ("""
           
           Your HP is \(health)
           Your have \(potion) Potion
           
           Are you sure want to use 1 potion to heal wound? [Y/N]
           
           """)
        
        input = readLine()?.uppercased()
        
        if input == "Y" {
//            Cek apakah potion masih ada
            if potion > 0{
                if health == 100{
                    print("Health is Full")
//                    Cek apakah nyawa kurang dari 100
                } else if health < 100 {
                    health += 20
                    potion -= 1
//                    Cek apakah nyawa lebih dari 100
                    if health > 100 {
                        health = 100
                    }
                }
//                Cek apakah potion sudah habis
            } else {
                while index == 0 {
//                    Kodisi jika potion habis
                    print("""
                          You don't have any potion left. Be careful of your next journey.

                          press [return] to go back:
                          """)

//                    Cek apakah inputan enter
                    input = readLine()
                    if input == "" {
                        break
                    }else if input != ""{
                        print ("mohon maaf input salah")
                    }
                }
            }
//            Kondisi jika klik N
        } else if input == "N" {
            break
        } else {
            print("Inputan salah")
        }
    }
}


// Tampilan forrest of troll
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
        
        
//        Kondisi untuk cek inputan user
        if input == "1" {
//            Kondisi physical attack
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
//            Kondisi meteor attack
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
//            Kondisi shield
            if energi > 10 {
                energi -= 10
                print("You use shield, your health is \(health)")
            } else {
                print("Your mana is \(energi), you can't use shield")
            }
        }else if input == "4"{
//            Kondisi untuk memanggil fungsi heal wound
            healWound()
        }else if input == "5"{
//            Kondisi untuk scan enemy vital
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
//            Kondisi untuk keluar dari pertandingan atau flee from batle
            keluarPertandingan()
            break
//            Kondisi jika inputan salah / error handling
        }else{
            print("Input not valid !!")
        }
    }
}


// Tampilan mountain of golem
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
        
//        Kondisi untuk cek inputan user
        if input == "1" {
//            Kondisi physical attack
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
//            Kondisi meteor attack
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
//            Kondisi shield
            if energi > 10 {
                energi -= 10
                print("You use shield, your health is \(health)")
            } else {
                print("Your mana is \(energi), you can't use shield")
            }
            
        }else if input == "4"{
//            Kondisi untuk memanggil fungsi heal wound
            healWound()
            
        }else if input == "5"{
//            Kondisi untuk scan enemy vital
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
//            Kondisi untuk keluar dari pertandingan atau flee from batle
            keluarPertandingan()
            break
        }else{
//            Kondisi jika inputan salah / error handling
            print("Mohon maaf Input salah !!")
        }
    }
}


// Tampilan keluar dari pertandingan / flee from battle
func keluarPertandingan(){
    while index == 0 {
        print("""
              You fell that if you don't escape soon,you won't be able to continue the fight. You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.
              
              Your save for now.
              press [return] to go back:
              """)
        
//        Cek apakah inputan enter
        input = readLine()
        if input == "" {
            break
        }else if input != ""{
            print ("mohon maaf input salah")
            continue
        }
    }
}
