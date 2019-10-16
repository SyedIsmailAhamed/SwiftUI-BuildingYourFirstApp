//
//  ContentView.swift
//  Rooms
//
//  Created by Syed Ismail Ahamed on 15/10/2019.
//  Copyright © 2019 Syed Ismail Ahamed. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store = RoomStore()
    
    var body: some View {
        
        NavigationView {
            List {
                Section{
                    Button(action: addRoom) {
                        Text("Add Room")
                    }
                }
                
                Section {
                    ForEach(store.rooms) { room in
                        RoomCell(room: room)
                    }
                    .onDelete(perform: deleteRoom(at:))
                    .onMove(perform: move(from:to:))
                }
            }.listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    
    
    func addRoom(){
        store.rooms.append(Room(name: "Hall 2", capacity: 2000))
    }
    
    func deleteRoom(at offsets : IndexSet){
        store.rooms.remove(atOffsets: offsets)
    }
    
    func move (from source : IndexSet, to destination : Int){
        store.rooms.move(fromOffsets: source, toOffset: destination)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: RoomStore(rooms: testData))
            
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.colorScheme, .dark)
            
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.layoutDirection, .rightToLeft)
                .environment(\.locale, Locale(identifier: "ar"))
        }
    }
}

struct RoomCell: View {
    let room : Room
    var body: some View {
        NavigationLink(destination: RoomDetail(room: room)){
            Image(room.imageName)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) People")
                    .font(.subheadline)
            }
        }
        .navigationBarTitle(Text("Rooms"))
    }
}
