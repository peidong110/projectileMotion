//
//  main.swift
//  a3
//
//  Created by Dong Pei on 2020-03-10.
//  Copyright © 2020 COMP1601. All rights reserved.
//

import Foundation

func getInput() ->String{
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    let strData = String(data:inputData,encoding: String.Encoding.utf8)!
    return strData.trimmingCharacters(in: CharacterSet.newlines)
    //This function is meant to get input from user
    
}
func correctTypeDouble()->Double{
    var returnVal:Double = -1
    let input = readLine()
    if let input = input {
        if input == "quit" {
            print("Quit the programme now")
        }
        else{
    //        print(input) // -> the input will be printed out.
            let con = Double(input)
            if(con == nil){
                print("Nor Quit nor float")
                returnVal = con ?? -1.0
            }
            else{
                print(con!)
                returnVal = con ?? -1.0
            }
        }
    }
    return returnVal
}
func correctTypeInt()->Int{
    var returnVal:Int = -1
    let input = readLine()
    if let input = input {
        if input == "quit" {
            print("Quit the programme now")
        }
        else{
    //        print(input) // -> the input will be printed out.
            let con = Int(input)
            if(con == nil){
                print("Nor Quit nor float")
                returnVal = con ?? -1
            }
            else{
                print(con!)
                returnVal = con ?? -1
            }
        }
    }
    return returnVal
}



print("Please enter initial height of the projectile above the ground (in meters)")
var height:Double = correctTypeDouble()

print("Please enter initial angle of release (in degrees)")
var angle:Double = correctTypeDouble()
print("Please enter initial velocity of the projectile (in meters/s")
var velocity:Double = correctTypeDouble()
print("Please enter number of divisions per second for the simulation to use (e.g. 100)")//integer value fot this
var performance:Int = correctTypeInt()


