//
//  DrawView.swift
//  Paint-iRobot
//
//  Created by Nikhil Venkatesh Dasari on 2/6/17.
//  Copyright © 2017 Nikhil Venkatesh Dasari. All rights reserved.
//

import Foundation
import UIKit

class DrawView : UIView {
    
    var Lines : [Line] = []
    var lastPoint: CGPoint!
    var currentSelectedColor : UIColor = UIColor.green
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastPoint = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Get the touch object
        let touchObject = touches[touches.startIndex] as UITouch
        //Determine where the touch occured
        let newPoint = touchObject.location(in: touchObject.view)
        //Update the position of the touch
        Lines.append(Line(start: lastPoint, end: newPoint))
        lastPoint = newPoint
        self.setNeedsDisplay()

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath()
        context?.setStrokeColor(currentSelectedColor.cgColor)
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath()
        
        for line in Lines {
            
            context?.move(to: CGPoint(x: line.start.x , y: line.start.y))
            context?.addLine(to: CGPoint(x: line.end.x , y: line.end.y))
        }
        
        context?.setLineCap(CGLineCap.round)
        context?.setStrokeColor(currentSelectedColor.cgColor)
        context?.setLineWidth(3)
        context?.strokePath()
        self.setNeedsDisplay(rect)
    }

}
