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
    var timerInterval: Double = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAnimSpeed()
        startAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
        timer = nil
    }

    func startAnimation() {
        
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
    
    func getAnimSpeed () {
        timerInterval = UserData.getInstance().animSpeed
    }
    
    func changeAnimFrame () {
        ui_anim_imageview.image = catFrames[frameCount]
    }
}
