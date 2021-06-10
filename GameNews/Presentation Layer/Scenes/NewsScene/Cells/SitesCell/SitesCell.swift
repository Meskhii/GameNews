//
//  SitesCell.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import UIKit

class SitesCell: UICollectionViewCell {

    @IBOutlet weak var webSitesButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with image: String) {
        self.webSitesButton.setBackgroundImage(UIImage(named: image), for: .normal)
        self.webSitesButton.setTitle("", for: .normal)
    }

}
