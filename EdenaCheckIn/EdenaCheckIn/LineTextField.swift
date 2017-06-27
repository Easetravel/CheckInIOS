//
//  LineTextField.swift
//  EdenaCheckIn
//
//  Created by peiming on 2017/6/25.
//  Copyright © 2017年 EdenaResorts. All rights reserved.
//

import UIKit
@IBDesignable
class LineTextField: UITextField {
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.textColor = UIColor.red
//    }

    override var tintColor: UIColor! {
        
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let startingPoint   = CGPoint(x: rect.minX, y: rect.maxY)
        let endingPoint     = CGPoint(x: rect.maxX, y: rect.maxY)
        
        let path = UIBezierPath()
        
        path.move(to: startingPoint)
        path.addLine(to: endingPoint)
        path.lineWidth = 2.0
        
        tintColor.setStroke()
        
        path.stroke()
    }
    
    
    
    
}
