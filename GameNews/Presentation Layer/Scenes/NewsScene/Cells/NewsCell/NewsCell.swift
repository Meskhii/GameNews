//
//  NewsCell.swift
//  GameNews
//
//  Created by Admin on 31.05.2021.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {

    @IBOutlet private weak var newsView: UIView!
    @IBOutlet private weak var webPageImageView: UIImageView!
    @IBOutlet private weak var webPageNameLabel: UILabel!
    @IBOutlet private weak var newsTitleLabel: UILabel!
    @IBOutlet private weak var newsDateLabel: UILabel!
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var bookmarkButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupNewsView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    private func setupNewsView() {
        newsView.layer.cornerRadius = 15
        newsImageView.layer.cornerRadius = 15
    }

    func configure(data: NewsCellModel) {
        newsTitleLabel.text = data.title
        newsDateLabel.text = data.postTime

        webPageImageView.image = UIImage(named: data.webPageLogo)
        webPageNameLabel.text = data.webPageName

        let url = URL(string: data.imgURL ?? "")
        newsImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "ImagePlaceHolder"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.7)),
                .cacheOriginalImage
            ])

    }

    @IBAction func shareNews(_ sender: Any) {

    }

    @IBAction func bookmarkNews(_ sender: Any) {
    }
}
