//
//  MainRouter.swift
//  StarWarsTestApp
//
//  Created by Rostyslav Didenko on 21.06.2021.
//

import UIKit

typealias EntryPoint = MainView & UIViewController

protocol MainRouter {
    
    var entryPoint:EntryPoint? { get }
    
    static func loadModule() -> MainRouter
}
