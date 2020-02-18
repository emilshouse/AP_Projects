//
//  ContentView.swift
//  H4XOR
//
//  Created by Adnan Abdulai on 2/17/20.
//  Copyright © 2020 Adnan Abdulai. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }

            }
            .navigationBarTitle("H4X0R NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}


//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Akwaaba"),
//    Post(id: "4", title: "Anterey")
//]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
