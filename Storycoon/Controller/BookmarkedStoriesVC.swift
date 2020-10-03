//
//  BookmarkedStoriesVC.swift
//  Storycoon
//
//  Created by Kirlos Yousef on 2020. 10. 01..
//

import UIKit

class BookmarkedStoriesVC: UIViewController {
    
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    
    private var storiesToShow: [Story] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        listBookmarkedStories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        listBookmarkedStories()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    /// Request to fectch the stories from the database.
    private func listBookmarkedStories(){
        // Trying to fetch the stories from the database...
        RealmService.shared.fetchStoriesFromDB { stories in
            if stories.isEmpty{
                self.storiesCollectionView.alpha = 0 // Hide the collection view so the no data view appears.
            } else {
                self.storiesToShow = stories.map({$0})
                self.storiesCollectionView.reloadData()
                self.storiesCollectionView.alpha = 1 // Make sure that the collection view is visable.
            }
        }
    }
}

// MARK: - CollectionView Methods

extension BookmarkedStoriesVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "StoryDataVC") as? StoryDataVC
        vc?.story = storiesToShow[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension BookmarkedStoriesVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storiesToShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = storiesCollectionView.dequeueReusableCell(withReuseIdentifier: "BookmarkedStoryCell", for: indexPath) as! BookmarkedStoryCell
        
        let story = storiesToShow[indexPath.row]
        
        cell.storyTitle.text = story.title
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

/// Setting the layout of the collection view cells.
extension BookmarkedStoriesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
