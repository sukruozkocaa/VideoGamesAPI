//
//  Webservice.swift
//  VideoGamesAppMVVM
//
//  Created by Şükrü Özkoca on 16.05.2022.
//

import Foundation
import UIKit

class Webservice {
    func getData(url:URL, completion:@escaping ([Game]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            if let data = data {
                let gameList = try? JSONDecoder().decode(GameList.self, from: data)
                if let gameList = gameList {
                    completion(gameList.results)
                }
            }
        }.resume()
    }
}
