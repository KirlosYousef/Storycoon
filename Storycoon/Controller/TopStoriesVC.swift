//
//  TopStoriesVC.swift
//  Storycoon
//
//  Created by Kirlos Yousef on 2020. 10. 01..
//

import UIKit
import Kingfisher

class TopStoriesVC: UIViewController {
    
    @IBOutlet weak var topStoriesTableView: UITableView!
    private var storiesToShow: [Story] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topStoriesTableView.delegate = self
        topStoriesTableView.dataSource = self
        
        // Do any additional setup after loading the view.
        
        // Trying to fetch the stories from the API...
        APIService.shared.fetchStories { result in
            switch result{
            case .success(let storiesData): // When receiving data from the database...
                self.storiesToShow = storiesData.all
                self.topStoriesTableView.reloadData() // Reload the table view
            case .failure(let err): // If no data available on the databse.
                print(err)
            }}
    }
}

// MARK: - TableView Methods

extension TopStoriesVC: UITableViewDelegate{
    
    // Setting the height of the cells in the table view.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 6
    }
}

extension TopStoriesVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storiesToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = topStoriesTableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! StoryCell
        
        cell.storyTitle.text = storiesToShow[indexPath.row].title
        cell.storyDate.text = storiesToShow[indexPath.row].pubDate
        
        // Setting the image data to the cell imageView using Kingfisher.
        // "NoPicture" image will be replaced in case of a nil image.
        let imageURL = storiesToShow[indexPath.row].images[0].url
        cell.storyImage.kf.indicatorType = .activity // Activity indicator
        cell.storyImage.kf.setImage(with: imageURL,
                                    placeholder: UIImage(named: "NoPicture"),
                                    options: [.transition(.fade(0.5))])
        
        return cell
    }
}

