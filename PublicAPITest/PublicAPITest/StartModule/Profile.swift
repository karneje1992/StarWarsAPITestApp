//
//  Profile.swift
//  StarWarsTestApp
//
//  Created by Rostyslav Didenko on 21.06.2021.
//

import UIKit
import ImageLoader

struct Profile:MainEntity {
    
    var id:Int!
    var gender:String
    var name:String
    var image:String
}

protocol StarWarsProfileDelegate {
    func didFinishLoading(profile:StarWarsProfile?)
}

class StarWarsProfile{

    var profile:Profile!
    var image:UIImage?
    var delegate:StarWarsProfileDelegate?
    
    init(profile:Profile!) {
        self.profile = profile
    }
    
    func loadImage() {
        
        ImageLoader.request(with: profile.image) {
            (img, error, _) in
            
            DispatchQueue.main.async {
                [weak self] in
                
                if img != nil && error == nil, let compressImageData = img?.jpeg(.low) {
                    self?.image = UIImage(data: compressImageData)
                    self?.delegate?.didFinishLoading(profile: self)
                }
            }
        }
    }
}
