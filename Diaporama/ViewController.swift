//
//  ViewController.swift
//  Diaporama
//
//  Created by Admin on 23/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ui_anim_imageview: UIImageView!
    @IBOutlet weak var ui_sliderSpeed: UISlider!
    
    let catFrames = [UIImage(named: "anim_cat_1"),
                     UIImage(named: "anim_cat_2"),
                     UIImage(named: "anim_cat_3"),
                     UIImage(named: "anim_cat_4"),
                     UIImage(named: "anim_cat_5"),
                     UIImage(named: "anim_cat_6"),
                     UIImage(named: "anim_cat_7"),
                     UIImage(named: "anim_cat_8")]
    
    var frameCount: Int = 0
    var timer: Timer?
    var defaultSpeedValue: Double = 0.1
    var timerInterval: Double = 2
    var newTimerInterval: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider_animSpeedChanged(ui_sliderSpeed)
        startAnimation()
    }

    func startAnimation() {
        timerInterval = newTimerInterval
        
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: false, block: { (_) in
            if self.frameCount < 7 {
                self.frameCount += 1
            } else {
                self.frameCount = 0
            }
            self.changeAnimFrame()
            self.startAnimation()
        })
    }
    
    func changeAnimFrame () {
        ui_anim_imageview.image = catFrames[frameCount]
    }

    @IBAction func slider_animSpeedChanged(_ sender: UISlider) {
        newTimerInterval = defaultSpeedValue / (Double(sender.value) / Double(sender.maximumValue))
    }
}

