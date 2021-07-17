//
//  Friends_2App.swift
//  Friends 2
//
//  Created by Xiao Nianhe on 3/7/21.
//

import SwiftUI

@main
struct Friends_2App: App {
    
    @ObservedObject var friendsData = FriendsData()
    @Environment(\.scenePhase) private var scenePhase
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(friends: $friendsData.friends)
                .onAppear {
                    friendsData.load()
                }
                .onChange(of: scenePhase, perform: { phase in
                    if phase == .inactive {
                        friendsData.save()
                    }
                })
        }
    }
}
