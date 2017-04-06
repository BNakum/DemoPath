//
//  ViewController.swift
//  DemoPath
//
//  Created by Bharat Nakum on 4/3/17.
//  Copyright © 2017 Bharat Nakum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
           //self.drawARectangle()
           self.drawAnimationUsingRadiiMethod()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func drawARectangle() {
        let theView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        theView.center = self.view.center
        theView.backgroundColor = UIColor.lightGray
        self.view.addSubview(theView)
        
        // Simple Rectangle
        //let thePath = UIBezierPath(rect: theView.bounds)
        
        // A Round Circle
        let thePath = UIBezierPath(ovalIn: theView.bounds)
        
        let theShapeLayer = CAShapeLayer()
        theShapeLayer.position = self.view.center
        theShapeLayer.bounds = theView.bounds
        theShapeLayer.path = thePath.cgPath
        
        theShapeLayer.fillColor = UIColor.cyan.cgColor
        theShapeLayer.strokeColor = UIColor.red.cgColor
        
        theShapeLayer.lineWidth = 4.0
        theShapeLayer.strokeStart = 0
        theShapeLayer.strokeEnd = 0
        
        self.view.layer.addSublayer(theShapeLayer)
        
        let startAnimation = CABasicAnimation(keyPath: "strokeStart")
        startAnimation.toValue = 0
        
        let endAnimation = CABasicAnimation(keyPath: "strokeEnd")
        endAnimation.toValue = 1
        
        let group = CAAnimationGroup()
        group.animations = [startAnimation, endAnimation]
        group.duration = 5
        group.repeatCount = HUGE
        group.autoreverses = false
        theShapeLayer.add(group, forKey: nil)
    }
    
    private func drawAnimationUsingRadiiMethod() {
        let thePath = UIBezierPath(arcCenter: CGPoint(x: 50, y: 50), radius: 50, startAngle: convertDegreesToRadians(degree: -90), endAngle: convertDegreesToRadians(degree: 270), clockwise: true)
        
        let theShapeLayer = CAShapeLayer()
        theShapeLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        theShapeLayer.position = self.view.center
        theShapeLayer.path = thePath.cgPath
        
        theShapeLayer.fillColor = UIColor.cyan.cgColor
        theShapeLayer.strokeColor = UIColor.red.cgColor
        
        theShapeLayer.lineWidth = 4.0
        theShapeLayer.lineCap = kCALineCapRound
        //theShapeLayer.lineDashPattern = [20]
        
        self.view.layer.addSublayer(theShapeLayer)
        
        let drawAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawAnimation.duration = 5.0
        drawAnimation.repeatCount = HUGE
        
        drawAnimation.fromValue = 0.0
        drawAnimation.toValue = 1.0
        
        drawAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        theShapeLayer.add(drawAnimation, forKey: "drawCircleAnimation")
    }
    
    private func convertDegreesToRadians(degree: Double) -> CGFloat {
        let radians = (degree * 0.0174533)
        return CGFloat(radians)
    }
}

