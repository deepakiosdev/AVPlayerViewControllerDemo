//
//  ViewController.swift
//  AVPlayerViewController
//
//  Created by Dipak Pandey on 29/01/21.
//
import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    let playerViewController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playButton(_ sender: AnyObject) {
        
        let movieURL = Bundle.main.url(forResource: "ElephantSeals", withExtension: "mp4")!
        let player = AVPlayer(url: movieURL as URL)
        
        playerViewController.player = player
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerViewController.player?.currentItem)
        
        self.present(playerViewController, animated: true) {
            self.playerViewController.player!.play()
        }
    }
    
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        self.playerViewController.dismiss(animated: true)
    }
}

