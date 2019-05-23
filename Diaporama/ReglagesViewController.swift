//
//  ReglagesViewController.swift
//  Diaporama
//
//  Created by Admin on 23/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ReglagesViewController: UIViewController {

    @IBOutlet weak var ui_sliderAnimSpeed: UISlider!
    
    var newTimerInterval: Double = 0
    var defaultSpeedValue: Double = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        newTimerInterval = UserDefaults.standard.double(forKey: "ANIM-SPEED")
        ui_sliderAnimSpeed.value = Float( 1 / newTimerInterval)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserDefaults.standard.set(newTimerInterval, forKey: "ANIM-SPEED")
        UserDefaults.standard.synchronize()
    }
    
    
    @IBAction func slider_animSpeedChanged(_ sender: UISlider) {
        newTimerInterval = defaultSpeedValue / (Double(sender.value) / Double(sender.maximumValue))
    }
    
    
}
