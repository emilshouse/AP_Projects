//
//  ContentView.swift
//  EmilCard
//
//  Created by Adnan Abdulai on 2/11/20.
//  Copyright © 2020 Adnan Abdulai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red:0.61, green:0.35, blue:0.71)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("emil_ig")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))

                Text("Adnan Abdulai")
                    .font(Font.custom("Pacifico", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                Divider()
                InfoView(text: "+1 607 434 6731", imageName: "phone.fill")
                InfoView(text: "adnan.abdulai@yahoo.com", imageName: "envelope.fill")





            }

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


