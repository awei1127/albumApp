//
//  ViewController.swift
//  albumApp
//
//  Created by 許智崴 on 2017/5/7.
//  Copyright © 2017年 Wei. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    var images = ["01.jpg",
                  "02.jpg",
                  "03.jpg",
                  "04.jpg",
                  "05.jpg",
                  "06.jpg",
                  "07.jpg",
                  "08.jpg",
                  "09.jpg",
                  "10.jpg",
                  "11.jpg",
                  "12.jpg",
                  "13.jpg",
                  "14.jpg",]
    var i = 0
    var player = AVAudioPlayer()
    
    
    
    @IBOutlet weak var albumImageView: UIImageView!
    //相片
    
    
    @IBOutlet weak var animationImageView: UIImageView!
    //動畫
    
    
    
    
    @IBAction func nextImageAction(_ sender: UIButton) {
        
        if i == images.count - 1 {
            i = 0
        } else {
            i += 1
        }
        
        albumImageView.image = UIImage(named:images[i])
        
    }
    
    @IBOutlet weak var nextBtnUI: UIButton!
    
    
    
    
    @IBAction func preImageAction(_ sender: UIButton) {
        
        if i == 0 {
            i = 13
        } else {
            i -= 1
        }
        
        albumImageView.image = UIImage(named:images[i])

        
    }
    
    @IBOutlet weak var preBtnUI: UIButton!
    
    
    
    
    func shakeAnime() {
        
        print("shake finish!!!")
        
        let animationImages = [#imageLiteral(resourceName: "heart01.png"), #imageLiteral(resourceName: "heart02.png")]
        
        animationImageView.animationImages = animationImages
        animationImageView.animationDuration = 0.25
        animationImageView.animationRepeatCount = 10
        animationImageView.startAnimating()
    }
    
    
    func playSound() {
        
        let filePath = Bundle.main.path(forResource: "water-bubbles-02", ofType: "wav")
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: filePath!))
            player.play()
        } catch {
            print("error playing sound file")
        }
        
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtnUI.layer.cornerRadius = 10
        preBtnUI.layer.cornerRadius = 10
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.motionShake {
            shakeAnime()
            playSound()
        }
        
    }
    


}

