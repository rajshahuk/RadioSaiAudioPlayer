//
//  AudioItemTableViewCell.swift
//  RadioSaiAudioPlayer
//
//  Created by Rajesh Shah on 29/07/2017.
//  Copyright © 2017 Rajesh Shah. All rights reserved.
//

import UIKit

class AudioItemTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
