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
    
    private var previous:Double
    func getColour() -> String {
        return colour
    }

    init(height:Double,angle:Double,veloctiy:Double) {
//        let h = height , a = angle, v = velocity  // abbrev for the input para
        self.deltaX = veloctiy * cos(angle * Double.pi / 180)
        self.deltyY = veloctiy * sin(angle * Double.pi / 180)
        self.initialX = 0.0//x does not move because you are droping it
        self.initialY = height//y is set to the hegith just passed
        self.eluerX = 0.0
        self.eluerY = height
        self.theoreticalX = 0
        self.theoreticalY = height
        
        self.deltaEluerX = veloctiy * cos(angle * Double.pi / 180)
        self.deltaEluerY = veloctiy * sin(angle * Double.pi / 180)
        self.deltaTheoreticalX = veloctiy * cos(angle * Double.pi / 180)
        self.deltaTheoreticalY = veloctiy * sin(angle * Double.pi / 180)
        self.acclerationX = 0
        self.acclerationY = Ball.GRAVITY  //gravity is a static value so we do not change it
        self.previous = 0.0
        
        //Initialize all the members we just declared
        
    }
    func action(numOperations:Int) -> Void {
        var time:Double = 0.0 //start with 0 but 
        
        let timeElapesd = 1 / numOperations//how many seconds it each operation elapsed
        
        
    }
    
}
