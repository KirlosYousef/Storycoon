//
//  BookmarkedStoryCell.swift
//  Storycoon
//
//  Created by Kirlos Yousef on 2020. 10. 01..
//

import UIKit

class BookmarkedStoryCell: UICollectionViewCell {
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var storyTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        storyImage.layer.cornerRadius = 5
        storyImage.layer.borderWidth = 2
        storyImage.layer.borderColor = UIColor.systemOrange.cgColor
    }
}
