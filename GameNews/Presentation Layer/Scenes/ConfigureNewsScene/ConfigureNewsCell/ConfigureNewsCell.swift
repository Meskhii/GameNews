//
//  ConfigureNewsCell.swift
//  GameNews
//
//  Created by Admin on 06.06.2021.
//

import UIKit

class ConfigureNewsCell: UICollectionViewCell {

    @IBOutlet weak var webPageLogoImage: UIImageView!
    @IBOutlet weak var webPageNameLabel: UILabel!
    private var isChecked = true
    private var webPageLogoName = String()
    var delegate: ConfigureCheckedNewsLogic?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with data: WebPagesModel) {
        webPageLogoName = data.webPageLogo
        webPageLogoImage.image = UIImage(named: webPageLogoName)
        webPageNameLabel.text = data.webPageName
      //  isChecked = data.isWebPageChecked
    }
    
    @IBAction func checkMarkClicked(_ sender: UIButton) {
        let imageName = isChecked ? "ic_checkmark_unchecked" : "ic_checkmark_checked"
                
        sender.setImage(UIImage(named: imageName), for: .normal)
        
        isChecked.toggle()
        
        delegate?.configureDataAfterUserInteraction(checkedLogo: webPageLogoName, checked: isChecked)
    }
    
}
