//
//  RoomStore.swift
//  Rooms
//
//  Created by Syed Ismail Ahamed on 15/10/2019.
//  Copyright © 2019 Syed Ismail Ahamed. All rights reserved.
//
import SwiftUI
import Combine

class RoomStore : ObservableObject{
    var rooms : [Room] {
        didSet {objectWillChange.send()}
    }
    init(rooms:[Room] = []) {
        self.rooms = rooms
    }
    
    var objectWillChange = PassthroughSubject<Void,Never>()
    //var didChange = PassthroughSubject<Void,Never>()
}
