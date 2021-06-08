//
//  SelectedGameNewsCell.swift
//  GameNews
//
//  Created by Admin on 07.06.2021.
//

import UIKit

class SelectedGameNewsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var contentLabel: UILabel!

    @IBOutlet weak var authorLabel: UILabel!

    private var fullArticleHref: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with data: GameNewsModel){
        self.titleLabel.text = data.title
        self.contentLabel.text = data.contents
        self.authorLabel.text = data.author
        self.fullArticleHref = data.url
    }

    @IBAction func readFullArticle(_ sender: Any) {
    }

}
