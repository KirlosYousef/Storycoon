//
//  StoryCell.swift
//  Storycoon
//
//  Created by Kirlos Yousef on 2020. 10. 01..
//

import UIKit

class StoryCell: UITableViewCell {
    
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyDate: UILabel!
    @IBOutlet weak var bookmarkBtn: UIButton!
    
    var story: Story?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        storyImage.layer.cornerRadius = 5
        storyImage.layer.borderWidth = 1.5
        storyImage.layer.borderColor = UIColor.systemOrange.withAlphaComponent(0.5).cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func bookmarkBtnPressed(_ sender: Any) {
        if story != nil{
            RealmService.shared.addToDB(story: story!)
            bookmarkBtn.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
        }
    }
}
