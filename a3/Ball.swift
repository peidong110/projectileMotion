//
//  Ball.swift
//  a3
//
//  Created by Dong Pei on 2020-03-10.
//  Copyright © 2020 COMP1601. All rights reserved.
//

import Foundation
class Ball {
    private var colour:String = "red"
    private static let GRAVITY:Double = -9.81
    
    private var initialX:Double
    private var initialY:Double
    private var deltaX:  Double
    private var deltyY:  Double
    
    private var eluerX:Double
    private var eluerY:Double
    private var deltaEluerX:Double
    private var deltaEluerY:Double
    
    private var theoreticalX:Double
    private var theoreticalY:Double
    private var deltaTheoreticalX:Double
    private var deltaTheoreticalY:Double
    
    private var acclerationX:Double
    private var acclerationY:Double
    private var numberOfOperations:Int
    private var previous:Double
    func getColour() -> String {
        return colour
    }

    init(height:Double,angle:Double,veloctiy:Double,num:Int) {
        let height = height
        let angle = angle
        let velocity = veloctiy
        
        self.numberOfOperations = num
        self.deltaX = velocity * cos(angle * Double.pi / 180)
        self.deltyY = velocity * sin(angle * Double.pi / 180)
        self.initialX = 0.0//x does not move because you are droping it
        self.initialY = height//y is set to the hegith just passed
        self.eluerX = 0.0
        self.eluerY = height
        self.theoreticalX = 0.0
        self.theoreticalY = height
        self.deltaEluerX = velocity * cos(angle * Double.pi / 180)
        self.deltaEluerY = velocity * sin(angle * Double.pi / 180)
        self.deltaTheoreticalX = velocity * cos(angle * Double.pi / 180)
        self.deltaTheoreticalY = velocity * sin(angle * Double.pi / 180)
        self.acclerationX = 0
        self.acclerationY = Ball.GRAVITY  //gravity is a static value so we do not change it
        self.previous = 0.0
        //Initialize all the members we just declared
        
    }
    func action() -> Void {
        var time:Double = 0.0 //start with 0, time increased by time elapsed each time operation finished
        let timeElapesd:Double = 1.0 / Double(numberOfOperations)//how many seconds it each operation elapsed
        let numerator:Double = -self.deltyY - (self.deltyY * self.deltyY - 2 * self.initialY * self.acclerationY).squareRoot()
        let denominator:Double = self.acclerationY
        let groundTime:Double =  numerator / denominator //apply the fomula
        while time < groundTime {
            eluerFomula(time: time)
            theoreticalFomula(time: time)
            print(" \(roundNum(aNumber: time)) \("      ")  \(roundNum(aNumber: self.theoreticalX))  \("      ")       \(roundNum(aNumber: self.theoreticalY))   \("      ")        |  \("      ")  \(roundNum(aNumber: self.eluerX))  \("      ") \(roundNum(aNumber: self.eluerY))   \("      ")")
            time += timeElapesd
        }
    
    }
    func eluerFomula(time:Double) -> Void {
        //each time time is passed in, change value of Eluer's x and y and theo's and y
        let changeOverTime = time - self.previous//this remarks the change of time current comapres with prevous
        self.deltaEluerX += changeOverTime * self.acclerationX
        self.deltaEluerY += changeOverTime * self.acclerationY
        self.eluerX += changeOverTime * self.deltaEluerX
        self.eluerY += changeOverTime * self.deltaEluerY
        self.previous = time

    }
    func theoreticalFomula(time:Double) -> Void {
        self.theoreticalX = time * self.deltaX + 0.5 * self.acclerationX * time * time + self.initialX
        self.theoreticalY = 0.5 * self.acclerationY * time * time + self.deltyY * time + self.initialY
    }

    func roundNum(aNumber:Double) -> String {
        let roundedNum = Double(round(100 * aNumber) / 100)
        var newString:String;
        if roundedNum < 10 {
            newString = String(format:" %4.2f",roundedNum)

        }
        else{
            newString = String(format:"%4.2f",roundedNum)

        }
        return newString
    }
    
}

