//
//  BookmarkCell.swift
//  GameNews
//
//  Created by user200006 on 6/14/21.
//

import UIKit
import Kingfisher

class BookmarkCell: UITableViewCell {
    
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with data: BookmarksModel) {
        
        newsTitle.text = data.newsTitle
        
        let url = URL(string: data.newsImage)
        newsImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "ImagePlaceHolder"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.7))
            ])
    }
    
    @IBAction func readFullArticle(_ sender: Any) {
    }
}
