//
//  FriendDetailView.swift
//  Friends 2
//
//  Created by Xiao Nianhe on 3/7/21.
//

import SwiftUI

import SwiftUI

struct FriendDetailView: View {
    
    @Binding var friend: Friend
    
    var body: some View {
        ScrollView {
            ZStack{
                VStack(spacing: 0){
                    Image(friend.slothImage)
                        .resizable()
                        .frame(height: 300)
                        .scaledToFit()
                    
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
                    
                    HStack{
                        ForEach(friend.types, id: \.rawValue) { type in
                            Label(type.rawValue, systemImage: type.getSymbolName())
                                .padding(10)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    
                    Text("\(Image(systemName: friend.icon)) \(friend.school)")
                        .font(.system(size: 24))
                        .padding()
                    
                    VStack(alignment: .leading){
                        Text("Attack")
                        Slider(value: $friend.attack,
                               in: 0...15,
                               step: 1
                        )
                        Text("Defense")
                        Slider(value: $friend.defense,
                               in: 0...15,
                               step: 1
                        )
                    }
                    .padding()
                    Spacer()
                }
            }
        }
        .navigationTitle(friend.name)
//        .background(Color.init(red: 175/255, green: 238/255, blue: 238/255, opacity: 0.5).edgesIgnoringSafeArea(.all))
//        .background(Color.red)
//        .edgesIgnoringSafeArea(.all)
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(friend: .constant(Friend(name: "Eggy", icon: "pc", school: "RI", slothImage: "sloth1", attack: 15, defense: 10, types: [.fire, .ice])))
    }
}

