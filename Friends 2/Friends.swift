//
//  Friends.swift
//  Friends 2
//
//  Created by Xiao Nianhe on 3/7/21.
//

import Foundation


struct Friend: Identifiable, Equatable, Codable {
    var id = UUID()
    
    var name: String
    var icon: String
    var school: String
    
    var slothImage: String
    
    var attack: Double = Double.random(in: 1...15)
    var defense: Double = Double.random(in: 1...15)
    
    var types: [FriendType] = [.normal]
}
