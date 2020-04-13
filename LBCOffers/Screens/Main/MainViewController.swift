//
//  ViewController.swift
//  LBCOffers
//
//  Created by Mohamed Derkaoui on 12/04/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var articles: [Article]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var categories: [Category]?
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        CategoriesService.shared.fetchData { (categories, error) in
            if let categories = categories as? [Category] {
                self.categories = categories
            }
        }
        ArticlesService.shared.fetchData { (articles, error) in
            if let articles = articles as? [Article] {
                self.articles = articles
            }
        }
        setupTableView()
        setupNavigation()
    }


    func setupNavigation() {
        self.navigationItem.title = "Articles"
    }
    
    func getCategoryOf(_ article: Article) -> String? {
        if let categories = self.categories {
            let categoryOfArticle = categories.first { (category) -> Bool in
                category.id == article.category_id
            }
            return categoryOfArticle?.name
        }
        return nil
    }
    
}

