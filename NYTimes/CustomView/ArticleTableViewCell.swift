//
//  ArticleTableViewCell.swift
//  NYTimes
//
//  Created by Lilia on 8/14/20.
//  Copyright © 2020 Liliia. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var imageArt: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    
    @IBAction func favoriteButton(_ sender: Any) {
        favButton.setImage(#imageLiteral(resourceName: "liked.png"), for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
//    
//    let favButton = UIButton(type: .system)
//    favButton.setTitle("SOME", for: .normal)
//    favButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//    accessoryView = favButton
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
