//
//  Items.swift
//  Todoey
//
//  Created by Adnan Abdulai on 2/22/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

class Item: Codable {

    var title: String
    var done: Bool

    init(title: String, done: Bool = false) {
        self.title = title
        self.done = done
    }

}
