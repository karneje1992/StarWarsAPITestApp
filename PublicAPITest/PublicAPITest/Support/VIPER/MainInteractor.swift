//
//  MainInteractor.swift
//  StarWarsTestApp
//
//  Created by Rostyslav Didenko on 21.06.2021.
//

import Foundation

protocol MainInteractor {
    
    var presenter: MainPresenter? { get set }
    
    func loadData()
}
