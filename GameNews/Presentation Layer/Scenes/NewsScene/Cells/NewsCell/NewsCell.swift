//
//  NewsCell.swift
//  GameNews
//
//  Created by Admin on 31.05.2021.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {
    
    var newsWorker: NewsWorker?

    // MARK: - IBOutlets
    @IBOutlet private weak var newsView: UIView!
    @IBOutlet private weak var webPageImageView: UIImageView!
    @IBOutlet private weak var webPageNameLabel: UILabel!
    @IBOutlet private weak var newsTitleLabel: UILabel!
    @IBOutlet private weak var newsDateLabel: UILabel!
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var bookmarkButton: UIButton!
    
    private var newsTitle: String?
    private var newsImage: String?
    private var newsHref: String?
    private var isBookmarked = false

    // MARK: - View life cycle
    override func awakeFromNib() {
        super.awakeFromNib()

        setupNewsView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    // MARK: - Cell Layer Design
    private func setupNewsView() {
        newsView.layer.cornerRadius = 15
        newsImageView.layer.cornerRadius = 15
    }

    // MARK: - Cell Configuration
    func configure(data: NewsCellModel) {
        
        newsTitle = data.title
        newsImage = data.imgURL
        newsHref = data.hrefURL
        
        newsTitleLabel.text = newsTitle
        newsDateLabel.text = data.postTime

        webPageImageView.image = UIImage(named: data.webPageLogo)
        webPageNameLabel.text = data.webPageName
        

        let url = URL(string: newsImage ?? "")
        newsImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "ImagePlaceHolder"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.7)),
                .cacheOriginalImage
            ])

    }

    // MARK: - IBActions
    @IBAction func shareNews(_ sender: Any) {
        
    }

    @IBAction func bookmarkNews(_ sender: UIButton) {
        
        newsWorker = NewsWorker()
        let imageName = isBookmarked ? "ic_bookmark_empty" : "ic_bookmark_filled"
        
        sender.setImage(UIImage(named: imageName), for: .normal)
        
        if isBookmarked {
            newsWorker?.deleteNewsForUserFromFirebase(title: newsTitle ?? "")
        } else {
            newsWorker?.bookmarkNewsInFirebase(title: newsTitle ?? "",
                                               image: newsImage ?? "",
                                               newsUrl: newsHref ?? "")
        }
        
        isBookmarked.toggle()
    }
}
