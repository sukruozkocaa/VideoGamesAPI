//
//  GameTableViewCell.swift
//  VideoGamesAppMVVM
//
//  Created by Şükrü Özkoca on 16.05.2022.
//

import Foundation
import UIKit

class GameTableViewCell:UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet var pictureView: UIImageView!
}
