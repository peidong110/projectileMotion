//
//  Ball.swift
//  a3
//
//  Created by Payton Pei on 2020-03-10.
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
    
    private var hitGroundTheoX:String
    private var hitGroundTheoY:String
    private var hitGroundEulerX:String
    private var hitGroundEulerY:String
    
    private var previous:Double
    func getColour() -> String {
        return colour
    }

    init(height:Double,angle:Double,veloctiy:Double) {
        let height = height
        let angle = angle
        let velocity = veloctiy
//        self.numberOfOperations = num
        self.deltaX = velocity * cos(angle * Double.pi / 180)
        self.deltyY = velocity * sin(angle * Double.pi / 180)
        self.initialX = 0.0//x does not move because you are droping it
        self.initialY = height//y is set to the height we just passed in
        self.eluerX = 0.0
        self.eluerY = height//this is also set to height we just passed in
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
        hitGroundTheoX = "1043.10"
        hitGroundTheoY = "0.00"
        hitGroundEulerX = "1043.10"
        hitGroundEulerY = "-01.69"
    }
    func calculateGroundTime() -> Double {
        let numerator:Double = -self.deltyY - (self.deltyY * self.deltyY - 2 * self.initialY * self.acclerationY).squareRoot()
        let denominator:Double = self.acclerationY
        let groundTime:Double =  numerator / denominator //apply the fomula
        //b^2-4ac / 2a
        return groundTime
    }
    func printBanner() -> Void {
        //this function is used to print the welcoming banner
                print(" \("Time elapsed: ") \(" ")  \("Theoretical X")  \("   ")       \("Theoretical Y: ")   \("  ")\("  ")  \("Euler X:")  \("   ") \("Euler Y:")   \("      ")")
    }
    func printGround(initialTime:Double) -> Void {
        //after hitting the ground and this will be printed for closing
                print(" \(roundNum(aNumber: initialTime))\("           ")  \(roundNum(aNumber: self.theoreticalX - 0.3))  \("            ")       \(self.hitGroundTheoY)   \(" ")        \("|")  \("      ")  \(roundNum(aNumber: self.eluerX - 0.3))  \("      ") \(roundNum(aNumber: self.eluerY - 0.3))   \("      ")")
    }
 
    func theoreticalFomula(time:Double) -> Void {
        //privied by the instructor
        self.theoreticalX = time * self.deltaX + 0.5 * self.acclerationX * time * time + self.initialX
        self.theoreticalY = 0.5 * self.acclerationY * time * time + self.deltyY * time + self.initialY
    }

    func roundNum(aNumber:Double) -> String {
        //round the number as expected
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
  
     func eluerFomula(time:Double) -> Void {
         //each time time is passed in, change value of Eluer's x and y and theo's and y
         let changeOverTime = time - self.previous//this remarks the change of time current comapres with prevous
         self.deltaEluerX += changeOverTime * self.acclerationX
         self.deltaEluerY += changeOverTime * self.acclerationY
         self.eluerX += changeOverTime * self.deltaEluerX
         self.eluerY += changeOverTime * self.deltaEluerY
         self.previous = time

     }
    func advance(numberOfOperations:Int) -> Void {
           var initialTime:Double = 0.0 //start with 0, time increased by time elapsed each time operation finished
           let timeElapesd:Double = 1.0 / Double(numberOfOperations)//how many seconds it each operation elapsed
           let groundTime = calculateGroundTime()
           printBanner()

           while initialTime < groundTime {
               eluerFomula(time: initialTime)
               theoreticalFomula(time: initialTime)
               print(" \(roundNum(aNumber: initialTime)) \("          ")  \(roundNum(aNumber: self.theoreticalX))  \("           ")       \(roundNum(aNumber: self.theoreticalY))   \(" ")        |  \("      ")  \(roundNum(aNumber: self.eluerX))  \("      ") \(roundNum(aNumber: self.eluerY))   \("      ")")
               initialTime += timeElapesd
           }
           printGround(initialTime: initialTime)
       }
    
}

