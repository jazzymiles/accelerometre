//
//  CircleView.swift
//  accelerometr
//
//  Created by miles on 3/17/15.
//  Copyright (c) 2015 miles. All rights reserved.
//

import UIKit

class CircleView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var color:UIColor
 
    init(frame: CGRect, color: UIColor) {
        self.color = color
        super.init(frame:frame)
        self.backgroundColor = UIColor.clearColor()
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        //color.set()
    
        
        var r=frame.size.height/2
        CGContextAddArc(context, frame.size.width/2, frame.size.height/2, r, 0, CGFloat(M_PI * 2), 2)
        CGContextFillPath(context)
    
        CGContextSetShadow(context, CGSize(width:5, height:5), 10)
        CGContextStrokePath(context)

       
        
    }

}
