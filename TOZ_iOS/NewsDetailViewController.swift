//
//  NewsDetailViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var photoImageView: ProfilePhotoView!
    @IBOutlet weak var contentLabel: UILabel!
    var selectedNews: NewsItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.textColor = Color.Cell.Font.title
        dateLabel.textColor = Color.Cell.Font.date
        contentLabel.textColor = Color.Cell.Font.title
        titleLabel.text = selectedNews?.title
        dateLabel.text = selectedNews?.published?.dateToFormattedString()
        photoImageView.photo = nil
        let photoURL: URL? = selectedNews?.photoUrl
        if let photoURL = photoURL {
            PhotoManager.shared.getPhoto(from: photoURL, completion: {(image) -> (Void) in
                self.photoImageView.photo = image
            })
        }
        contentLabel.text = selectedNews?.contents
    }

}
