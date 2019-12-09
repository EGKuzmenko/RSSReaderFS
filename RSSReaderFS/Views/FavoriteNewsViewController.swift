//
//  SavedNewsViewController.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 09/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import UIKit

class FavoriteNewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var presenter: IFavoriteNewsPresenter = {
        return FavoriteNewsPresenter(view: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewReadyEvent()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FavoriteNewsViewController: IFavoriteNewsView {
    func setupInitialState() {
        title = "FavouriteNews"
    }
}
