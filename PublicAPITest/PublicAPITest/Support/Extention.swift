//
//  Extention.swift
//  StarWarsTestApp
//
//  Created by Rostyslav Didenko on 22.06.2021.
//

import UIKit

extension NSAttributedString {
    
    static func attributedString(string: String?, fontSize size: CGFloat, fontColor color: UIColor?) -> NSAttributedString? {
        guard let string = string else { return nil }
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: color ?? UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: size)]
        
        let attributedString = NSMutableAttributedString(string: string, attributes: attributes)
        
        return attributedString
    }
    
}
