//
//  main.swift
//  0706012110056-MirandaUtami-AFL1
//
//  Created by miranda on 28/02/23.
//

import Foundation

/* Inisiasliasi object */
var enemy = Enemy()
var troll = Troll()
var golem = Golem()
var user = User()
var healthPotion = HealthPotion()
var manaPotion = ManaPotion()



/* Inisialisasi variable dan attribute dari user dan monster */
var index = 0
var input: String? = nil



/* Creating an empty array */
var enemyName: [String] = ["Troll","Golem"]
let actions = ["Physical Attack", "Meteor", "Shield", "Use Potion", "Scan Enemy", "Flee"]



/* Panggil function */
tampilanAwal()
welcome()
journey()



/* Tampiilan awal */
func tampilanAwal() {
    while index == 0 {
        print("""
            ========================================= WELCOME TO THE WORD OF MAGIC! 🧙‍♀️🧌 ==========================================

            You have been chosen to embark on an epic journey as young wizard on the path to becoming a master of the arcane arts.
            Your adventures will take you throught forests 🌲, mountain 🏔️, and dungeons 🏰,where you will face challenges, make
            allies and fight enemies.
            
            ========================================================================================================================

            Press [return] to continue:
            """)
        
        input = readLine()
        
        if input == "" {
            break
        }else if input != ""{
            print ("MOHON MAAF INPUT SALAH!!")
        }
    }
}



/* Tampilan welcome */
func welcome(){
    while index == 0 {
        print ("May I know your name, a young wizard?")
        if let input = readLine() {
            if input.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil && input != "" {
                user.username = input
                break
            }
        }
        print("Masukkan huruf saja, hindari space !")
    }
/* Merubah Optional menjadi fix */
    if let usernameFix = user.username{
        print("")
        print("""
              ===============================
              
              Nice to meet you \(usernameFix)
              
              ===============================
              """)
    }else{
        print ("MOHON MAAF INPUT SALAH!!")
    }
}



/* tampilan journey */
func journey(){
    while index == 0 {
        print ("""
               From here, you can
               
               [C] Check your health and start
               [H] Heal your wounds with potion
               [R] Regen mana with mana potion
               
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
                user.healWound()
            case "R":
                user.manaWound()
            case "F":
                forestOfTroll()
            case "M":
                mountainOfGolem()
            case "Q":
                exit(1)
            default:
                print("MOHON MAAF INPUT SALAH!!")
        }
    }
}



/* Tampilan player stats */
func playerStats(){
    while index == 0 {
/* Merubah optional menjadi fix */
        if let usernameFix = user.username{
            print("")
            print("Player Name \(usernameFix)")
        }else{
            print ("MOHON MAAF INPUT SALAH!!")
        }
       
        print ("""
               HP = 100/\(user.health)
               MP = 50/\(user.energi)
               
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
            print ("MOHON MAAF INPUT SALAH!!")
        }
    }
}



/* Tampilan forrest of troll */
func forestOfTroll(){
    while index == 0 {
        print("""
              As you enter the forest, you fell a sense of unease wash over you.
              Suddenly, you hear the sound of twigs snapping behind you. you quickly spin around, and find a troll emerging from the shadows.
              
              😈 Nama   : \(enemyName[0]) x1
              😈 Health : \(troll.troll.health)
              
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
            user.physicalTroll()
        }else if input == "2"{
            user.meteorTroll()
        }else if input == "3"{
            user.shield()
        }else if input == "4"{
            user.healWound()
        }else if input == "5"{
            user.vitalTroll()
        }else if input == "6"{
            keluarPertandingan()
            break
        }else{
            print("MOHON MAAF INPUT SALAH!!")
        }
    }
}



/* Tampilan mountain of golem */
func mountainOfGolem(){
    while index == 0 {
        print("""
              As you make your way through the rugged montain terrain, you can fell the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your freeze in your tracks. that's when you see it - a massive ,snarling Golem emerging from the shadows.
              
              😈 Nama   : \(enemyName[0]) x1
              😈 Health : \(golem.golem.health)
              
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
            user.physicalGolem()
        }else if input == "2"{
            user.meteorGolem()
        }else if input == "3"{
            user.shield()
        }else if input == "4"{
            user.healWound()
        }else if input == "5"{
            user.vitalGolem()
        }else if input == "6"{
            keluarPertandingan()
            break
        }else{
            print("MOHON MAAF INPUT SALAH!!!")
        }
    }
}



/* Tampilan keluar dari pertandingan / flee from battle */
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
            print ("MOHON MAAF INPUT SALAH!!")
            continue
        }
    }
}


