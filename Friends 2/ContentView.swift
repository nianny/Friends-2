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
                                 age: 45),
                          Friend(name: "Jia Chen",
                                 icon: "swift",
                                 school: "Ngee Ann Poly",
                                 slothImage: "sloth2",
                                 age: 17),
                          Friend(name: "Ruirui",
                                 icon: "wifi",
                                 school: "NUS High",
                                 slothImage: "sloth1",
                                 age: 14)]
    
    var body: some View {
        NavigationView {
            ZStack{
                List(0..<friends.count) { index in
                    NavigationLink(destination: FriendDetailView(friend: $friends[index])) {
                        Image(systemName: friends[index].icon)
                        VStack(alignment: .leading){
                            Text(friends[index].name)
                                .font(.headline)
                            HStack{
                                Text(friends[index].school)
                                    .font(.system(.subheadline))
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("Age: \(friends[index].age)")
                                    .font(.system(.subheadline))
                                    .foregroundColor(.gray)

                            }
                        }
                    }
                }
//                .background(Color.red)
            }
            .navigationTitle("Friendo :D")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
