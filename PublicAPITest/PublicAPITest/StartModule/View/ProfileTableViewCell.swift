//
//  ProfileTableViewCell.swift
//  StarWarsTestApp
//
//  Created by Rostyslav Didenko on 22.06.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileTableViewCell"
    
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
