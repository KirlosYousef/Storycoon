//
//  StoryDataVC.swift
//  Storycoon
//
//  Created by Kirlos Yousef on 2020. 10. 01..
//

import UIKit


class StoryDataVC: UIViewController {
    
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyDate: UILabel!
    @IBOutlet weak var storyAbstract: UILabel!
    
    var story: Story?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if story != nil{
            let imageURL = story?.images[2].url
            storyImage.kf.indicatorType = .activity // Activity indicator
            storyImage.kf.setImage(with: imageURL,
                                   placeholder: UIImage(named: "NoPicture"),
                                   options: [.transition(.fade(0.5))])
            
            storyTitle.text = story?.title
            storyDate.text = story?.pubDate
            storyAbstract.text = story?.abstract
        }
    }
    
    @IBAction func readMoreBtnPressed(_ sender: Any) {
        if let url = URL(string: (story?.url)!) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
}
