//
//  AudioItemViewController.swift
//  RadioSaiAudioPlayer
//
//  Created by Rajesh Shah on 31/07/2017.
//  Copyright © 2017 Rajesh Shah. All rights reserved.
//

import UIKit

class AudioItemViewController: UIViewController {
    
    var audioItem: AudioItem?

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if audioItem != nil {
            self.dateLabel.text = audioItem?.date
            self.titleLabel.text = audioItem?.title
            self.urlLabel.text = audioItem?.url
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openAudioFile(_ sender: Any) {
        UIApplication.shared.open(URL(string: (audioItem?.url)!)!, options: [:], completionHandler: nil)
    }

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
