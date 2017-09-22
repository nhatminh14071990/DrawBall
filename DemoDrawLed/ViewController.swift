//
//  ViewController.swift
//  DemoDrawLed
//
//  Created by Van Ho Si on 9/22/17.
//  Copyright © 2017 Van Ho Si. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberBall:Int = 2
    let marginTop: CGFloat = 80
    let marginBottom: CGFloat = 20
    let marginLeft: CGFloat = 20
    let marginRight: CGFloat = 20
    var widthBall: CGFloat = 0
    var heightBall: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.drawBall()
    }
    
    func drawBall(){
        self.removeAllUIImageView()
        
        if(numberBall > 0){
            let image = UIImage(named: "green")
            widthBall = CGFloat(image!.size.width)
            heightBall = CGFloat(image!.size.height)
            
            let spaceWith = self.spaceWidthBetweenBall()
            let spaceHeight = self.spaceHeightBetweenBall()
            
            for index in 1...numberBall{
                
                let positionX = marginLeft + (CGFloat(index - 1) * spaceWith)
                
//                let viewWidthSize = self.view.bounds.size.width
//                print("viewWidthSize: \(viewWidthSize)")
                print("positionX: \(positionX)")
                
                for i in 1...numberBall{
                    let positionY = marginTop + (CGFloat(i - 1) * spaceHeight)
                    
                    let ball = UIImageView(image: image)
                    if(numberBall == 1){
                        ball.center = self.view.center
                    }else{
                        ball.center = CGPoint(x: positionX, y: positionY)
                    }
                    
                    
                    self.view.addSubview(ball)
                    
                }
                
            }
        }
        
        
    }
    
    func removeAllUIImageView(){
        let allUIImageView = self.view.subviews.filter{$0 is UIImageView}
        for subView in allUIImageView{
            subView.removeFromSuperview()
        }
    }
    
    func spaceHeightBetweenBall() -> CGFloat{
        
        let totalHeightBalls = CGFloat(numberBall) * heightBall
        let totalHeightSpace = self.view.bounds.size.height - marginTop - marginBottom
        
        let space = totalHeightSpace / CGFloat(numberBall - 1)
        return space
        
    }
    
    func spaceWidthBetweenBall() -> CGFloat{
        
        let totalWidthBalls = CGFloat(numberBall) * widthBall
        let totalWidthSpace = self.view.bounds.size.width - marginLeft - marginRight
        
        let space = totalWidthSpace / CGFloat(numberBall - 1)
        return space
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBOutlet weak var inputNumberBall: UITextField!
    
    @IBAction func buttonDrawBall(_ sender: UIButton) {
        //print("buttonDrawBall")
        
        let text = inputNumberBall.text!
        if let number = Int(text){
            numberBall = number
            self.drawBall()
        }else{
            
            print("Not a number")
        }
        
        
    }
    
}

