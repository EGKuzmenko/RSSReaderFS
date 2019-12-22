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
    
    @IBAction func onSearchButtonTap(_ sender: UIBarButtonItem) {
        self.showAlertWithTextField()
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
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let action = UITableViewRowAction(style: .normal, title: "В избранное") { (action, indexPath) in
            print("Cell with indexPath: \(indexPath) was favourited.")
        }
        return [action]
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = presenter.getItem(indexPath: indexPath)
        presenter.linkToSafari(url: item.url)
        
    }
}


extension FeedViewController: IFeedView {
    func setupInitialState() {
        title = "RSS Reader"
        
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "NewsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsCell")
        
        refreshControl.attributedTitle = NSAttributedString(string: "Loading...")
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
    
    func showAlertWithTextField() {
        let alert = UIAlertController(title: "Search", message: "Look for news", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { [weak self] _ in
            self?.view.endEditing(true)
        }
        
        let searchAction = UIAlertAction(title: "Ok", style: .default) { [weak self] _ in
            let textField = alert.textFields![0] as UITextField
            guard let text = textField.text, text.count > 1 else {
                return
            }
            self?.presenter.setSearch(textField.text!)
            self?.presenter.updateEvent()
        }
        
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter the keyword"
        }
        
        alert.addAction(searchAction)
        alert.addAction(cancelAction)

        self.present(alert, animated: true)
    }
}

