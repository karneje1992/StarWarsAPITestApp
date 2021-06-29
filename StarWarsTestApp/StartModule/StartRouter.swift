//
//  StartRouter.swift
//  StarWarsTestApp
//
//  Created by Rostyslav Didenko on 21.06.2021.
//

import Foundation

class StartRouter: MainRouter {
    var entryPoint: EntryPoint?
    
    static func loadModule() -> MainRouter {
        
        let router = StartRouter()
        var view:MainView = StartView.init(nibName: "StartView", bundle: nil)
        var presenter:MainPresenter = StartPresenter()
        var interctor:MainInteractor = StartInteractor()
        
        presenter.itnteractor = interctor
        presenter.view = view
        presenter.router = router
        
        interctor.presenter = presenter
        
        view.presenter = presenter
        
        router.entryPoint = view as? EntryPoint
        return router
    }

}
