//
//  LoginPageViewController.swift
//  MapBeta
//
//  Created by ASURADA on 2018. 5. 16..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit
import AVFoundation
import TextFieldEffects

class LoginPageViewController: UIViewController {

    @IBOutlet weak var emailTextField: HoshiTextField!
    @IBOutlet weak var passwordTextField: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        videoURL = Bundle.main.url(forResource: "PolarBear", withExtension: "mov")! as NSURL
        self.setupVideoBackgrond()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public var videoURL: NSURL? {
        didSet {
            setupVideoBackgrond()
        }
    }
    
    
    func setupVideoBackgrond() {
        
        var theURL = NSURL()
        if let url = videoURL {
            
            let shade = UIView(frame: self.view.frame)
            shade.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            view.addSubview(shade)
            view.sendSubview(toBack: shade)
            
            theURL = url
            
            var avPlayer = AVPlayer()
            avPlayer = AVPlayer(url: theURL as URL)
            let avPlayerLayer = AVPlayerLayer(player: avPlayer)
            avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            avPlayer.volume = 0
            avPlayer.actionAtItemEnd = AVPlayerActionAtItemEnd.none
            
            avPlayerLayer.frame = view.layer.bounds
            
            let layer = UIView(frame: self.view.frame)
            view.backgroundColor = UIColor.clear
            view.layer.insertSublayer(avPlayerLayer, at: 0)
            view.addSubview(layer)
            view.sendSubview(toBack: layer)
            
            NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem)
            
            avPlayer.play()
        }
    }
    
    @objc func playerItemDidReachEnd(notification: NSNotification) {
        
        if let p = notification.object as? AVPlayerItem {
            p.seek(to: kCMTimeZero) { (bool) in
                
            }
        }
    }


}
