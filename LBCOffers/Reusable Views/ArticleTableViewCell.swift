//
//  ArticleTableViewCell.swift
//  LBCOffers
//
//  Created by Mohamed Derkaoui on 12/04/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    var article: Article?
    
    let pictoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let isUrgent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .red
        label.minimumScaleFactor = 0.5
        label.text = "Urgent"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(pictoImageView)
        contentView.addSubview(isUrgent)
        contentView.addSubview(categoryLabel)
        pictoImageView.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 0).isActive = true
        pictoImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant: 0).isActive = true
        pictoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        pictoImageView.trailingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor, constant: 0).isActive = true
        pictoImageView.widthAnchor.constraint(equalToConstant:100).isActive = true
        titleLabel.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.pictoImageView.trailingAnchor,constant: 20).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant: -10).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: 10).isActive = true
        isUrgent.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor, constant: 1).isActive = true
        isUrgent.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        isUrgent.topAnchor.constraint(greaterThanOrEqualTo: self.titleLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupCellWith(article: Article) {
        self.article = article
        self.titleLabel.text = article.title
        self.priceLabel.text = "\(article.price) €"
        self.categoryLabel.text = "\(article.category_id)"
        self.isUrgent.isHidden = !article.is_urgent
        setupImage()
    }
    
    func setupImage() {
        if let urlString =  self.article?.images_url.thumb, let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.pictoImageView.image = image
                    }
                }
            }.resume()
        }
    }
    
    
}
