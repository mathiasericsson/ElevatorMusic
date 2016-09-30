//
//  ViewController.swift
//  ElevatorMusic
//
//  Created by Mathias Ericsson on 29/09/16.
//  Copyright © 2016 Mathias Ericsson. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController {

    var playing = false
    var audioPlayer: AVAudioPlayer!
    var timeAtPause = 0;
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
    }
    @IBAction func ActionButton(_ sender: UIButton) {
        
        let path = Bundle.main.path(forResource: "bensound-littleidea", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        
        //Setup so sound plays in background
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error);
        }
        
        //Setup so that we can play the sound
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
        }
        catch{
            print("Couldn't load file")
        }
        
        
        if(playing){
           
            sender.setImage(UIImage(named: "PlayButton"), for: .normal)
            audioPlayer.stop()
            playing = false;
            
        }
        else{
            sender.setImage(UIImage(named: "PauseButton"), for: .normal)
            audioPlayer.play()
            playing = true
        }
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class ButtonImageHelper {
    
    func setImage(image: UIImage?, forButton:UIButton) {
        forButton.setImage(image, for: .normal)
    }
}
