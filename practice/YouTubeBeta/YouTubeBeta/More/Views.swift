//
//  Views.swift
//  YouTubeBeta
//
//  Created by ASURADA on 2018. 5. 31..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
    
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
