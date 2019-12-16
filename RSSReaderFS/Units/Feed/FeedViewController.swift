//
//  ViewController.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 25/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    
    private var refreshControl = UIRefreshControl()
    
    private lazy var presenter: IFeedPresenter = {
        return FeedPresenter(view: self)
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewReadyevent()
    }
    
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection(section: section)
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

extension FeedViewController: UITableViewDelegate {
    
}


extension FeedViewController: IFeedView {
    func setupInitialState() {
        title = "RSS Reader"
        
        tableView.dataSource = self
        let nib = UINib(nibName: "NewsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsCell")
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    func updateView() {
        tableView.reloadData()
    }
    
    @objc func refresh() {
        presenter.updateEvent()
    }
    
    func endRefreshing() {
        refreshControl.endRefreshing()
    }
}

