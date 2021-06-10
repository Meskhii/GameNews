//
//  VideoCell.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import UIKit
import Kingfisher

class VideoCell: UITableViewCell {

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoNameLabel: UILabel!
    @IBOutlet weak var trailerImageView: UIImageView!
    private var videoId: String!
    weak var delegate: SelectedVideoDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with info: VideoCellModel) {
        videoNameLabel.text = info.fetchedVideosTitle
        videoId = info.fetchedVideosId
        
        let url = URL(string: info.fetchedVideosImgUrl)
        videoImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "ImagePlaceHolder"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.7))
            ])
    }


    @IBAction func playSelectedVideo(_ sender: Any) {
        delegate?.getSelectedVideoToPlay(videoId)
    }
    
}
