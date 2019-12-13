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
    
    private lazy var presenter: IFeedPresnter = {
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
        cell.pictureView.image = nil
        let item = presenter.itemForRowIndexPath(indexPath: indexPath, imageResult: { pic, sourceIndexPath in
            DispatchQueue.main.async {
                if let indexPath = tableView.indexPath(for: cell), indexPath.row == sourceIndexPath.row {
                    cell.pictureView?.image = pic
                }
            }
        })
        cell.configureWith(article: item)
        
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter.cancelImageDownload(indexPath: indexPath)
    }
    
}


extension FeedViewController: IFeedView {
    func setupInitialState() {
        title = "RSS Reader"
        
        tableView.dataSource = self
        let nib = UINib(nibName: "NewsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsCell")
        
        refreshControl.attributedTitle = NSAttributedString(string: "Loading")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
        
        let selector = #selector(onSearchBarButtonTap)
        let item = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: selector)
        navigationItem.rightBarButtonItem = item
    }
    
    func updateView() {
        tableView.reloadData()
    }
    
    @objc func refresh() {
        presenter.updateEvent()
    }
    
    @objc func onSearchBarButtonTap() {
        // show alert
        print(#function)
    }
    
    func endRefreshing() {
        self.refreshControl.endRefreshing()
    }
}

