//
//  ContentView.swift
//  Friends 2
//
//  Created by Xiao Nianhe on 3/7/21.
//

import SwiftUI

struct ContentView: View {
//    let db = Firestore.firestore()
    @State var friends = [Friend(name: "YJ",
                                 icon: "zzz",
                                 school: "Tinkercademy",
                                 slothImage: "sloth3",
                                 types:[.water, .grass, .normal, .electric, .ice, .fire]),
                          Friend(name: "Jia Chen",
                                 icon: "swift",
                                 school: "Ngee Ann Poly",
                                 slothImage: "sloth2",
                                 types:[.normal]),
                          Friend(name: "Ruirui",
                                 icon: "wifi",
                                 school: "NUS High",
                                 slothImage: "sloth1",
                                 types:[.electric])]
    
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
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
