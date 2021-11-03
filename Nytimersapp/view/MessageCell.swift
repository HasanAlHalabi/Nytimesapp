//
//  MessageCell.swift
//  Nytimersapp
//
//  Created by hasan al halabi on 26/10/2021.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageviewb: UIView!
    @IBOutlet weak var titleLable: UILabel!
   
    @IBOutlet weak var imagev: UIImageView!
    @IBOutlet weak var DateText: UILabel!
    @IBOutlet weak var leftImagevide: UIImageView!
    @IBOutlet weak var ByName: UILabel!
    
    
    var articleViewModel: MVVMmodule! {
        didSet {
            titleLable.text = articleViewModel.title
            ByName.text = articleViewModel.byline
            DateText.text = articleViewModel.published_date
            
            imagev.load(urlString: articleViewModel.imageUrlString ?? "https://1000logos.net/wp-content/uploads/2017/04/Symbol-New-York-Times.png")
            leftImagevide.load(urlString: articleViewModel.imageUrlString ?? "https://1000logos.net/wp-content/uploads/2017/04/Symbol-New-York-Times.png")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imagev.layer.borderWidth = 1
            imagev.layer.masksToBounds = false
            imagev.layer.borderColor = UIColor.black.cgColor
            imagev.layer.cornerRadius = imagev.frame.height/2
            imagev.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
