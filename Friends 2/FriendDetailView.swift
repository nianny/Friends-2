//
//  FriendDetailView.swift
//  Friends 2
//
//  Created by Xiao Nianhe on 3/7/21.
//

import SwiftUI

import SwiftUI

struct FriendDetailView: View {
    
    var friend: Friend
    
    var body: some View {
        ZStack{
            Color.init(red: 175/255, green: 238/255, blue: 238/255)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0){
                Image(friend.slothImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                
                Image(friend.name)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .mask(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 8)
                            .foregroundColor(.white)
                    )
                    .offset(y: -250/2)
                    .shadow(radius: 6)
                    .padding(.bottom, -250/2+20)
                
                Text("\(Image(systemName: friend.icon)) \(friend.school)")
                    .font(.system(size: 24))
                    .padding()
                
                Spacer()
            }
        }
        .navigationTitle(friend.name)
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(friend: Friend(name: "Eggy", icon: "pc", school: "RI", slothImage: "sloth1", age: 14))
    }
}

