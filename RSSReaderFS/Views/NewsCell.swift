//
//  NewsCell.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 28/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!
    
    func configureWith(article: Article) {
        headerLabel.text = article.title
        newsLabel.text = article.articleDescription
        dateLabel.text = RSSDateFormater.string(from: article.publishedAt)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        pictureView.image = nil
    }
}
