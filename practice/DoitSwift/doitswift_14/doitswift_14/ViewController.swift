//
//  ViewController.swift
//  doitswift_14
//
//  Created by ASURADA on 2018. 4. 21..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func playVideo(url: NSURL) {
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        self.present(playerController, animated: true) {
            player.play()
        }
    }
    
    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVideo(url: url)
    }
    
    
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        
        playVideo(url: url)
    }
    
    @IBAction func btnPlayMountaineering(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "Mountaineering", ofType: "mov")
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVideo(url: url)
    }
    
    @IBAction func btnPlaySeascape(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/ijybpprsmx0bgre/Seascape.mov")!
        
        playVideo(url: url)
    }
}

