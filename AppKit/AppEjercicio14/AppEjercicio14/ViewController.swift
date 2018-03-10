//
//  ViewController.swift
//  AppEjercicio14
//
//  Created by Felipe Hernandez on 01/03/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa
import AVKit
import AVFoundation

class ViewController: NSViewController {

    @IBOutlet weak var avplayer: AVPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let videoURL: URL? = Bundle.main.url(forResource: "Video1", withExtension: "mov")
        avplayer.player = AVPlayer.init(url: videoURL!)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

