//
//  NetworkManager.swift
//  H4XOR
//
//  Created by Adnan Abdulai on 2/17/20.
//  Copyright © 2020 Adnan Abdulai. All rights reserved.
//

import Foundation

class NetworkManager:ObservableObject {
    
    @Published var posts = [Post]()

    //function {url, session, task {decoder, results}, start task}
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?query=swift&tags=story") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }

                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
