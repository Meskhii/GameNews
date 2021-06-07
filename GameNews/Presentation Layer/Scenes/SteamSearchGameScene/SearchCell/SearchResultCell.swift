//
//  SearchCell.swift
//  GameNews
//
//  Created by Admin on 07.06.2021.
//

import UIKit

class SearchResultCell: UITableViewCell {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var gameReleaseDateLabel: UILabel!
    @IBOutlet weak var gamePriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
