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



print("Please initial height of the projectile above the ground (in meters)")
var height = getInput()
if(self.stringValueOfInitialHeight == Int)

