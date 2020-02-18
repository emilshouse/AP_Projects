//
//  PostData.swift
//  H4XOR
//
//  Created by Adnan Abdulai on 2/17/20.
//  Copyright © 2020 Adnan Abdulai. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits:[Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?

}
