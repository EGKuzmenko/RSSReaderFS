//
//  FavoriteViewController.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 16/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var refreshControl = UIRefreshControl()

    private lazy var presenter: IFavoritePresenter = {
        return FavoritePresenter(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewReadyEvent()
    }
    

}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsCell
        let item = presenter.itemForRowIndexPath(indexPath: indexPath, imageResult: { pic in
            DispatchQueue.main.async {
                guard let pic = pic else {
                    return
                }
                cell.pictureView?.image = UIImage(data: pic)
            }
        })
        cell.configureWith(article: item)
        
        return cell
    }
}


extension FavoriteViewController: UITableViewDelegate {
    
}

extension FavoriteViewController: IFavoriteView {
    func setupInitialState() {
        title = "Favorite news"
        
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "NewsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsCell")
        
        refreshControl.attributedTitle = NSAttributedString(string: "Loading...")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh() {
        presenter.updateEvent()
    }
    
    func updateView() {
        tableView.reloadData()
    }
    
    func endRefreshing() {
        refreshControl.endRefreshing()
    }
}
