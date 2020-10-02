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
    @IBOutlet weak var tryAgainBtn: UIButton!
    
    private var storiesToShow: [Story] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topStoriesTableView.delegate = self
        topStoriesTableView.dataSource = self
        listStories()
        tryAgainBtn.layer.cornerRadius = 5
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    /// Request to fectch the stories from the API.
    private func listStories(){
        // Trying to fetch the stories from the API...
        APIService.shared.fetchStories { result in
            switch result{
            case .success(let storiesData): // When receiving data from the database...
                self.storiesToShow = storiesData.all
                self.topStoriesTableView.reloadData() // Reload the table view
                self.topStoriesTableView.alpha = 1 // Make sure that the table view is visable.
            case .failure(_): // If no data available on the databse.
                self.topStoriesTableView.alpha = 0 // Hide the table view so the no internet connection view appears.
            }}
    }
    
    @IBAction func tryAgainBtnPressed(_ sender: Any) {
        listStories()
    }
}

// MARK: - TableView Methods

extension TopStoriesVC: UITableViewDelegate{
    
    // Setting the height of the cells in the table view.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "StoryDataVC") as? StoryDataVC
        vc?.story = storiesToShow[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension TopStoriesVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storiesToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = topStoriesTableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! StoryCell
        
        let story = storiesToShow[indexPath.row]
        cell.story = story
        cell.storyTitle.text = story.title
        cell.storyDate.text = story.pubDate
        
        // Setting the image data to the cell imageView using Kingfisher.
        // Images[2] is the image with size 150*150.
        // "NoPicture" image will be replaced in case of a nil image.
        let imageURL = story.images[2].url
        cell.storyImage.kf.indicatorType = .activity // Activity indicator
        cell.storyImage.kf.setImage(with: imageURL,
                                    placeholder: UIImage(named: "NoPicture"),
                                    options: [.transition(.fade(0.5))])
        
        return cell
    }
}

