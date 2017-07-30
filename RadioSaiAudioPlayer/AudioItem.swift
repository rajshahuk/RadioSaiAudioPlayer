//
//  AudioItem.swift
//  RadioSaiAudioPlayer
//
//  Created by Rajesh Shah on 29/07/2017.
//  Copyright © 2017 Rajesh Shah. All rights reserved.
//

import Foundation

class AudioItem {
    var id: Int
    var date: String
    var title: String
    var url: String
    
    init(id: Int, date: String, title: String, url: String) {
        self.id = id
        self.date = date
        self.title = title
        self.url = url
    }
}
