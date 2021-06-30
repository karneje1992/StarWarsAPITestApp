//
//  StartInteractor.swift
//  StarWarsTestApp
//
//  Created by Rostyslav Didenko on 21.06.2021.
//

import Foundation

class StartInteractor: MainInteractor {
    var presenter: MainPresenter?
    
    func loadData() {
        
        let strURL = "https://akabab.github.io/starwars-api/api/all.json"
        NetworkManager.shared.sendGetRequest(from: strURL) {
            
            [weak self](data) in
            
            let result = self?.decodeProfileData(data: data)
            
            guard let pres = self?.presenter as? StartPresenter else { return }
            pres.profiles = result ?? []
            
        } faile: { (response) in
            print(response ?? "=(")
        }
    }
    
    private func decodeProfileData(data:Data) -> [Profile]{
        
        let decoder = JSONDecoder()
        guard let results:[Profile] = try? decoder.decode([Profile].self, from: data) else { return [] }
        return results
    }
}
