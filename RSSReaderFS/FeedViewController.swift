//
//  ViewController.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 25/11/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    
    private lazy var presenter: IFeedPresnter = {
        return FeedPresenter(view: self)
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewReadyevent()
    }

    @IBAction func updateButtonTap(_ sender: UIBarButtonItem) {
        presenter.onUpdateBuutonTapEvent()
    }
    
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsCell
        let item = presenter.itemForRowIndexPath(indexPath: indexPath, imageResult: { pics in
            DispatchQueue.main.async {
                cell.pictureView?.image = pics
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
    }
    
    func updateView() {
        tableView.reloadData()
    }
}

