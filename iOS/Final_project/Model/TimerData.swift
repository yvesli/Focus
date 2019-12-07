//
//  Timer.swift
//  Final_project
//
//  Created by evanlou on 11/7/19.
//  Copyright © 2019 evanlou. All rights reserved.
//

import Foundation

class TimerData {
    var duration: String?
    var title: String?
    var backgroundImage: String?
    
    init(backgroundImage: String, duration: String, title: String) {
        self.backgroundImage = backgroundImage
        self.duration = duration
        self.title = title
    }
    
    init() {
        self.duration = nil
        self.title = nil
        self.backgroundImage = nil
    }
}
