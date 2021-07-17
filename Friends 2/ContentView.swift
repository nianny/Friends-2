//
//  ContentView.swift
//  Friends 2
//
//  Created by Xiao Nianhe on 3/7/21.
//

import SwiftUI

struct ContentView: View {
//    let db = Firestore.firestore()
    
    @Binding var friends: [Friend]
    @State var isSheetPresented = false
    
    var body: some View {
        NavigationView {
            ZStack{
                List{
                    ForEach (friends) { friend in
                        let friendIndex = friends.firstIndex(of: friend)!
                        
                        NavigationLink(destination: FriendDetailView(friend: $friends[friendIndex])) {
                            Image(systemName: friend.icon)
                            VStack(alignment: .leading){
                                Text(friend.name)
                                    .font(.headline)
                                HStack{
                                    Text(friend.school)
                                        .font(.system(.subheadline))
                                        .foregroundColor(.gray)
                                    Spacer()
                                    ForEach(friend.types, id: \.rawValue) { type in
                                        Image(systemName: type.getSymbolName())
                                        
                                    }
                                }
                            }
                        }
//                        .listRowBackground(Color.green)
                    }
                    .onDelete { offsets in
                        friends.remove(atOffsets: offsets)
                    }
                    .onMove { source, destination in
                        friends.move(fromOffsets: source, toOffset: destination)
                    }
                }
            }
            .navigationTitle("Friendo :D")
            .toolbar {
                 ToolbarItem(placement: .navigationBarLeading) {
                     EditButton()
                 }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        isSheetPresented = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
             }
//            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
//                isSheetPresented = true
//            }, label: {
//                Image(systemName: "plus")
//            }))
        } .sheet(isPresented: $isSheetPresented) {
            NewFriendView(friends: $friends)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(friends: .constant([Friend(name: "YJ",
                                      icon: "zzz",
                                      school: "Tinkercademy",
                                      slothImage: "sloth3",
                                      attack: 10,
                                      defense: 5,
                                      types: [.ice, .fire]),
                               Friend(name: "Jia Chen",
                                      icon: "swift",
                                      school: "Ngee Ann Poly",
                                      slothImage: "sloth2",
                                      attack: 15,
                                      defense: 15,
                                      types: [.electric, .ice]),
                               Friend(name: "Zerui",
                                      icon: "wifi",
                                      school: "NUS High",
                                      slothImage: "sloth1",
                                      attack: 6,
                                      defense: 3,
                                      types: [.normal, .grass, .fire])]))
    }
}
