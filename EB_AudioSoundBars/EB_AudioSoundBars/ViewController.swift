//
//  ViewController.swift
//  EB_AudioSoundBars
//
//  Created by ERIC BARTLETT on 12/1/17.
//  Copyright © 2017 ERIC BARTLETT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var EQcontainer1 = UIView()
    var EQcontainer2 = UIView()
    var EQtimer1 = Timer()
    
    // ---------------------------------------------------------------
    // Config Vars for Audio Bars
    // ---------------------------------------------------------------
    // Measurements in pixels
    var numberOfBars = 20
    var barWidth = CGFloat(10)
    var barHeight = CGFloat(45)
    var barSpace = CGFloat(2)
    var barStopHeight = CGFloat(2)
    var startOff = true
    let timerSpeed = 0.20
    let barColor = UIColor(red: 0.000, green: 0.000, blue: 0.999, alpha: 1.0)
    let shouldReturnDown = true
    let shouldReturnAnimated = true
    
    
    var timer = Timer()
    var barArray: [AnyObject] = []
    
    
    // ---------------------------------------------------------------
    // IBActions for UIButton
    // ---------------------------------------------------------------
    @IBAction func startAudio(_ sender: Any) {
        start1()
    }
    @IBAction func stopWithOut(_ sender: Any) {
        EQtimer1.invalidate()
    }
    @IBAction func stopWith(_ sender: Any) {
        EQtimer1.invalidate()
        
        let tempX = barWidth + barSpace
        var i = 50
        var j = 0
        UIView.animate(withDuration: 0.35, animations: { () -> Void in
            for bar in self.barArray  {
                let tempButton = self.view.viewWithTag(i)
                var rect = bar.frame
                rect?.origin.x = CGFloat(j) * CGFloat(tempX)
                rect?.origin.y = CGFloat(0)
                rect?.size.width = CGFloat(self.barWidth)
                rect?.size.height = self.barStopHeight
                tempButton!.frame = rect!
                i = i + 1
                j += 1
            }
        })
    }
    
    // ---------------------------------------------------------------
    // Create Audio Bar - UIVIew
    // ---------------------------------------------------------------
    func CreateEQ1 (Xcoord: CGFloat, Ycoord: CGFloat) {
        // Create UIView container
        let mycontainer = EQcontainer1
        mycontainer.frame = CGRect(x: Xcoord, y: Ycoord, width: CGFloat(numberOfBars) * CGFloat(barWidth), height: CGFloat(barHeight))
        mycontainer.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        view.addSubview(mycontainer)
        mycontainer.tag = 1000
        
        // Create temp object array
        var tempArray: [AnyObject] = []
        
        // Create bar UIImageView
        for i in 0...numberOfBars - 1 {
            let myImage = UIImageView()
            if i == 0 {
                myImage.frame = CGRect(x: 0, y: 0, width: barWidth, height: barStopHeight)
            } else {
                myImage.frame = CGRect(x: (CGFloat(barSpace) * CGFloat(i)) + (CGFloat(barWidth) * CGFloat(i)) , y: 0, width: barWidth, height: barStopHeight)//  * CGFloat(-1)
            }
            myImage.backgroundColor = barColor
            myImage.tag = 50 + i
            mycontainer.addSubview(myImage)
            tempArray.append(myImage)
        }
        barArray = tempArray
        
        mycontainer.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2) * CGFloat(2.0))
    }
    
    // ---------------------------------------------------------------
    // Functions for UIButtons
    // ---------------------------------------------------------------
    func start1() {
        EQtimer1 = Timer.scheduledTimer(timeInterval: timerSpeed, target: self, selector: #selector(ViewController.ticker1), userInfo: nil, repeats: true)
    }
    @objc func ticker1() {
        let tempX = barWidth + barSpace
        var i = 50
        var j = 0
        UIView.animate(withDuration: 0.35, animations: { () -> Void in
            for bar in self.barArray  {
                let tempButton = self.view.viewWithTag(i)
                var rect = bar.frame
                rect?.origin.x = CGFloat(j) * CGFloat(tempX)
                rect?.origin.y = CGFloat(0)
                rect?.size.width = CGFloat(self.barWidth)
                rect?.size.height = CGFloat(arc4random_uniform(UInt32(self.barHeight)))
                tempButton!.frame = rect!
                i = i + 1
                j += 1
            }
        })
    }
    func stopNoAnimation1() {
        EQtimer1.invalidate()
    }
    func stopWithAnimation1() {
        EQtimer1.invalidate()
        
        let tempX = barWidth + barSpace
        var i = 50
        var j = 0
        UIView.animate(withDuration: 0.35, animations: { () -> Void in
            for bar in self.barArray  {
                let tempButton = self.view.viewWithTag(i)
                var rect = bar.frame
                rect?.origin.x = CGFloat(j) * CGFloat(tempX)
                rect?.origin.y = CGFloat(0)
                rect?.size.width = CGFloat(self.barWidth)
                rect?.size.height = self.barStopHeight
                tempButton!.frame = rect!
                i = i + 1
                j += 1
            }
        })
    }
    
    // ---------------------------------------------------------------
    // viewDidLoad
    // ---------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        CreateEQ1(Xcoord: 125.0, Ycoord: 200.0)
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

