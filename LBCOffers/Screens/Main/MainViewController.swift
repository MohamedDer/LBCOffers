//
//  ViewController.swift
//  LBCOffers
//
//  Created by Mohamed Derkaoui on 12/04/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var articles = [Article]()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        ArticelsService.shared.fetchData { (articles, error) in
            if let articles = articles as? [Article] {
                self.articles = articles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        setupTableView()
        setupNavigation()
    }


    func setupNavigation() {
        self.navigationItem.title = "Articles"
    }
}

