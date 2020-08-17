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
    @IBOutlet weak var favButton: CustomButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favButton.setImage(#imageLiteral(resourceName: "liked.png"), for: .selected)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}


