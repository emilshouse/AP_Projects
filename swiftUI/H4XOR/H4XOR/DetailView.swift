//
//  DetailView.swift
//  H4XOR
//
//  Created by Adnan Abdulai on 2/17/20.
//  Copyright © 2020 Adnan Abdulai. All rights reserved.
//

import SwiftUI


struct DetailView: View {

    let url: String?
    
    var body: some View {

        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https:www.google.com")
    }
}

