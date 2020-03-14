//
//  main.swift
//  a3
//
//  Created by Dong Pei on 2020-03-10.
//  Copyright © 2020 COMP1601. All rights reserved.
//
import Darwin
import Foundation

func correctTypeDouble()->Double{
    var returnVal:Double = -1
    let input = readLine()
    if let input = input {
        if input.lowercased() == "quit" {
            print("Quit the programme now")
            exit(0)
        }
        else{
            let con = Double(input)
            if(con == nil){
                print("Nor Quit nor float")
                returnVal = con ?? -1.0
            }
            else{
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
        if input.lowercased() == "quit" {
            print("Quit the programme now")
            exit(0)
        }
        else{
            let con = Int(input)
            if(con == nil){
                print("Nor Quit nor float")
                returnVal = con ?? -1
            }
            else{
                returnVal = con ?? -1
            }
        }
    }
    return returnVal
}

var flag = true
while(flag){
    print("Please enter initial height of the projectile above the ground (in meters)")
    let height:Double = correctTypeDouble()
    print("Please enter initial angle of release (in degrees)")
    let angle:Double = correctTypeDouble()
    print("Please enter initial velocity of the projectile (in meters/s")
    let velocity:Double = correctTypeDouble()
    print("Please enter number of divisions per second for the simulation to use (e.g. 100)")//integer value fot this
    let performance:Int = correctTypeInt()
    if height < 0 || angle < 0 || velocity < 0 || performance < 0 {
        print("Initilized failed,REENTER INFORMAION"+" 😑")
        flag = true
    }
    else{
        print("Initilized Successfully, now Initized data for you"+"😃")
        let ball = Ball(height: height, angle: angle, veloctiy: velocity,num: performance)
        ball.action()
            //850 30 70 50
    }
}



