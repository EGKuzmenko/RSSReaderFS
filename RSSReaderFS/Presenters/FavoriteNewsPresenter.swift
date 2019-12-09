//
//  FavoriteNewsPresenter.swift
//  RSSReaderFS
//
//  Created by Георгий Кузьменко on 09/12/2019.
//  Copyright © 2019 Georgy Kuzmenko. All rights reserved.
//

import Foundation

class FavoriteNewsPresenter: IFavoriteNewsPresenter {
    
    private weak var view: IFavoriteNewsView?
    
    init(view: IFavoriteNewsView?) {
        self.view = view
    }
    
    func onViewReadyEvent() {
        view?.setupInitialState()
    }
}
