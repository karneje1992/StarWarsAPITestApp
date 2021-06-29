//
//  StartPresenter.swift
//  StarWarsTestApp
//
//  Created by Rostyslav Didenko on 21.06.2021.
//

import Foundation


class StartPresenter: MainPresenter {
    
    var router: MainRouter?
    
    var itnteractor: MainInteractor?{
        didSet{
            self.itnteractor?.loadData()
        }
    }
    
    var view: MainView?
    var profiles:[Profile] = []{
        didSet{
            view?.refreshUI()
        }
    }
}
