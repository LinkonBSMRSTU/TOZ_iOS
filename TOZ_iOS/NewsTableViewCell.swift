//
//  NewsTableViewCell.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePublishedLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var photoViewHeight: NSLayoutConstraint!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var readMoreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Color.Cell.Background.primary
        self.titleLabel.textColor = Color.Cell.Font.title
        self.datePublishedLabel.textColor = Color.Cell.Font.date
        self.contentTextView.textColor = Color.Cell.Font.content
        self.contentTextView.textContainer.maximumNumberOfLines = 2
        self.contentTextView.isUserInteractionEnabled = false
        self.photoView.contentMode = .scaleAspectFill
        self.photoView.clipsToBounds = true
    }

    func configure(with news: NewsItem) {
        titleLabel.text = news.title
        contentTextView.text = news.contents
        if let published = news.published {
            datePublishedLabel.text = published.dateToFormattedString()
        }
        let photoURL: URL? = news.photoUrl
        if let photoURL = photoURL {
            PhotoManager.shared.getPhoto(from: photoURL, completion: { (image) -> Void in
                if photoURL == news.photoUrl {
                    if let image = image {
                        self.photoView.image = image
                    }
                }
            })
        } else {
            self.photoViewHeight.constant = 0
        }
    }

    override func prepareForReuse() {
        self.photoView.image = nil
    }
}
