//
//  MainPresenter.swift
//  StarWarsTestApp
//
//  Created by Rostyslav Didenko on 21.06.2021.
//

import Foundation

protocol MainPresenter {
    
    var router:MainRouter? { get set }
    var itnteractor: MainInteractor? { get set }
    var view: MainView? { get set }
 
}
