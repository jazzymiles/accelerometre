//
//  ViewController.swift
//  accelerometr
//
//  Created by miles on 3/17/15.
//  Copyright (c) 2015 miles. All rights reserved.
//

import UIKit
import SpriteKit
import CoreMotion
import QuartzCore


class ViewController: UIViewController {

    let screenSize: CGRect = UIScreen.mainScreen().bounds
    var propertiesList = [[300, "#F3ADBEee"], [200, "#E65791ee"], [100, "#8F2D64ee"]]
    var circlesList:Array<CircleView> = Array<CircleView>()
    var animList:Array<CABasicAnimation> = Array<CABasicAnimation>()
    let scale = CGAffineTransformMakeScale(2, 2)
    let manager = CMMotionManager()
    var animated:Bool = true
    var deltaX:CGFloat = 0
    var deltaY:CGFloat = 0
    //let AcCntrl:CAAnimation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view: UIView = UIView(frame: CGRectMake(0, 0, 320, 640))
        
        self.view.backgroundColor = UIColor(rgba: "#2D2D2D")
        createCircles()
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        println(manager.accelerometerAvailable)
        if manager.accelerometerAvailable {
            manager.accelerometerUpdateInterval = 0.1
            manager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler:{
                data, error in
                if(data.acceleration.x > abs(0.25)){
                    self.deltaX = CGFloat(data.acceleration.x * 100)
                }else{
                    self.deltaX = 0
                }
                if(data.acceleration.y > abs(0.25)){
                    self.deltaY = CGFloat(data.acceleration.x * 100)
                }else{
                    self.deltaY = 0
                }
                //self.updateCircles()
                
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func createCircles(){
        for (var i = 0; i<3; i++){
            var radius = propertiesList [i][0] as Float
            var x = Float(screenSize.width * 0.5)-radius/2
            
            var y = Float(screenSize.height * 0.5)-radius/2
            var color = UIColor(rgba: propertiesList [i][1] as String)
            var bigCircle =  CircleView (frame: CGRectMake (CGFloat(x), CGFloat(y), CGFloat(radius), CGFloat(radius)), color: color)
            
            view.addSubview(bigCircle)
            
//            let anim = CABasicAnimation(keyPath: "position.x")
//            anim.keyPath = "position.x"
////            //anim.fromValue = 77
//            anim.toValue = 0
//            anim.duration = 1
//            bigCircle.layer.addAnimation(anim, forKey: "animate position")
           
            circlesList.append(bigCircle)
            
            //animList.append(anim)
            
        }
    }
    func update() {
        for (var i = 0; i<3; i++){
            var radius = propertiesList [i][0] as Float
            var x = (screenSize.width * 0.5)+deltaX
            var y = (screenSize.height * 0.5)+deltaY
            var tmp1 = self.circlesList [i]
            //var tmp2 = self.animList [i]
            tmp1.layer.position.x = tmp1.layer.position.x+(x-tmp1.layer.position.x)/CGFloat((i+1)*4)
            tmp1.layer.position.y = tmp1.layer.position.y+(y-tmp1.layer.position.y)/CGFloat((i+1)*4)
            tmp1.layer.zPosition=CGFloat(i*1000)
           // tmp1.layer.anim.toValue = 55
            
        }
        
    }

}

