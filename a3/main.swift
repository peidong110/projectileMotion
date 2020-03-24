//
//  main.swift
//  a3
//
//  Created by Payton Pei on 2020-03-10.
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
                print("Wrong Information Parsed")
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
                print("Wrong Information Parsed")
                
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
    var height:Double = 0.0
    var angle:Double = 0.0
    var velocity:Double = 0.0
    var performance:Int = 0
    print("Please type quit to stop the programme at any time")
    print("Please enter initial height of the projectile above the ground (in meters)")
    height = correctTypeDouble()
    while height < 0{
        print("Please re-enter initial height of the projectile above the ground (in meters)")
        height = correctTypeDouble()
    }
    print("Please enter initial angle of release (in degrees)")
    angle = correctTypeDouble()
    while angle < 0 {
        print("Please re-enter initial angle of release (in degrees)")
        angle = correctTypeDouble()
    }
    print("Please enter initial velocity of the projectile (in meters/s")
    velocity = correctTypeDouble()
    while velocity < 0 {
        print("Please re-enter initial velocity of the projectile (in meters/s")
        velocity = correctTypeDouble()
    }
    print("Please enter number of divisions per second for the simulation to use (e.g. 100)")//integer value fot this
    performance = correctTypeInt()
    while performance < 0 {
            print("Please re-enter number of divisions per second for the simulation to use (e.g. 100)")
        performance = correctTypeInt()
    }
    if height < 0 || angle < 0 || velocity < 0 || performance < 0 {
        print("Initilized failed,REENTER INFORMAION"+" 😑")
        flag = true
    }
    else{
        print("Initilized Successfully, now Initized data for you"+"😃")
        print("Theortical :                                               Euler: ")
        let ball = Ball(height: height, angle: angle, veloctiy: velocity)
        ball.advance(numberOfOperations:performance)
            //850 30 70 50
    }
}
