//
//  NewFriendView.swift
//  Friends 2
//
//  Created by Xiao Nianhe on 10/7/21.
//

import SwiftUI

struct NewFriendView: View {
    @State var friend = Friend(name: "",
                               icon: "triangle",
                               school: "",
                               slothImage: "sloth3",
                               attack: 0,
                               defense: 0,
                               types: [.normal])
    
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Information")){
                    TextField("Name", text: $friend.name)
                    TextField("School", text: $friend.school)
                    
                    HStack{
                        Image(systemName: friend.icon)
                        TextField("Icon", text: $friend.icon)
                            .autocapitalization(.none)
                    }
                    
                    TextField("Sloth Image", text: $friend.slothImage)
                        .autocapitalization(.none)
                }
                
                Section(header:Text("Attributes")){
                    Picker("Type", selection: $friend.types[0]) {
                        Text("normal")
                            .tag(FriendType.normal)
                        Text("fire")
                            .tag(FriendType.fire)
                        Text("water")
                            .tag(FriendType.water)
                        Text("grass")
                            .tag(FriendType.grass)
                        Text("electric")
                            .tag(FriendType.electric)
                        Text("ice")
                            .tag(FriendType.ice)
                    }
                    
                    HStack{
                        Text("Attack")
                            .frame(width: 100, alignment: .leading)
                        
                        Slider(value: $friend.attack,
                               in: 0...15,
                               step:1
                        )
                    }
                    
                    HStack{
                        Text("Defense"),
                            .frame(width: 100, alignment: .leading)
                    }
                }
            }
            .navigationTitle("New Friend")
        }
    }
}

struct NewFriendView_Previews: PreviewProvider {
    static var previews: some View {
        NewFriendView()
    }
}
