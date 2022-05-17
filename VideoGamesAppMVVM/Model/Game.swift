//
//  Game.swift
//  VideoGamesAppMVVM
//
//  Created by Şükrü Özkoca on 16.05.2022.
//

import Foundation
import UIKit

struct GameList : Decodable{
    let results : [Game]
}
struct Game : Decodable {
    var name : String?
    var rating : Double?
    var released : String?
    var background_image : String?
}
