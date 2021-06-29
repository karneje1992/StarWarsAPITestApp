//
//  MainView.swift
//  StarWarsTestApp
//
//  Created by Rostyslav Didenko on 21.06.2021.
//

import Foundation

protocol MainView {
    
    var presenter: MainPresenter? { get set }
    
    func refreshUI()
}
