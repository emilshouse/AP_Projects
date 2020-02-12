//
//  InfoView.swift
//  EmilCard
//
//  Created by Adnan Abdulai on 2/11/20.
//  Copyright © 2020 Adnan Abdulai. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .frame( height: 50)
            .overlay(HStack {
                Image(systemName: imageName).foregroundColor(.init(red:0.61, green:0.35, blue:0.71))
                Text(text).foregroundColor(.black)
            })
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello there!", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
