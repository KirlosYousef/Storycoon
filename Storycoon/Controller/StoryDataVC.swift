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
        
        // Do any additional setup after loading the view.
        
        if story != nil{
            let imageURL = story?.images[0].url
            storyImage.kf.indicatorType = .activity // Activity indicator
            storyImage.kf.setImage(with: imageURL,
                                   placeholder: UIImage(named: "NoPicture"),
                                   options: [.transition(.fade(0.5))])
            
            storyTitle.text = story?.title
            storyDate.text = story?.pubDate
            storyAbstract.text = story?.abstract
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
