//
//  ViewController.swift
//  ButtonDesignDemo
//
//  Created by Gaurav on 25/07/16.
//  Copyright © 2016 Hexagonal Loop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cView: UIView!
    let imgArr = ["red", "green", "blue", "purple", "cyan", "orange", "brown"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        prepareCView()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareCView(){
        self.cView.subviews.map{$0.removeFromSuperview()}
        var btnArr =  [UIButton]()
        
        let mid = CGPoint(x: self.cView.frame.width/2, y: self.cView.frame.height/2)
        let btnHeight:CGFloat = 70.0
        let paddingFromCenter:CGFloat = 10.0
        let interval = CGFloat((2 * M_PI) / 7)
        var angle: CGFloat = CGFloat(interval)
        for i in 0 ... 6 {
            
            let btn = UIButton(frame: CGRect(x: mid.x,
                y: mid.y - btnHeight , width: 140, height: btnHeight))
            if let img = UIImage(named: self.imgArr[i]){
                btn.setBackgroundImage(img, forState: .Normal)
            }
            btn.setTitle("\(i)", forState: .Normal)
            btn.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
            
            self.cView.addSubview(btn)
            
            //            let anc = CGPoint(x: 1, y: 0.5)
            //            btn.layer.anchorPoint = anc
            //            btn.transform = CGAffineTransformMakeRotation(angle)
            //            
            //            angle += interval
            btnArr.append(btn)
            
        }
        
        
        UIView.animateWithDuration(1) { 
            for i in 0 ... 6 {
                let btn = btnArr[i]
                
                
                btn.transform = CGAffineTransformMakeRotation(angle)
                angle += interval
            }
        }
    }
    
}

