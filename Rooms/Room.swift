//
//  Room.swift
//  Rooms
//
//  Created by Syed Ismail Ahamed on 15/10/2019.
//  Copyright © 2019 Syed Ismail Ahamed. All rights reserved.
//

import Foundation
struct Room : Identifiable {
    var id = UUID()
    var name : String
    var capacity : Int
    var hasVideo : Bool = false
    
    var imageName : String {return name}
    var thumbnailName : String {return name + "Thumb"}
}

#if DEBUG

let testData = [
    Room(name: "Observation Deck", capacity: 6,hasVideo : true),
    Room(name: "Executive Suite", capacity: 8,hasVideo : false),
    Room(name: "Charter Jet", capacity: 16,hasVideo : true),
   
]

#endif
