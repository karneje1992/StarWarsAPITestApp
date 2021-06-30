//
//  StartView.swift
//  StarWarsTestApp
//
//  Created by Rostyslav Didenko on 21.06.2021.
//

import UIKit

private let heightForRow:CGFloat = 50.0

class StartView: UIViewController, MainView {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainPresenter?
    
    private var profiles = [StarWarsProfile]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(.init(nibName: ProfileTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ProfileTableViewCell.identifier)
    }
    
    
    func refreshUI() {
        DispatchQueue.main.async {
            [weak self] in
            
            self?.updateProfiles()
            self?.tableView.reloadData()
        }
    }
    
    private func updateProfiles(){
        guard let pres = presenter as? StartPresenter else {
            return
        }
        
        var profiles = [StarWarsProfile]()
        pres.profiles.forEach({profiles.append(.init(profile: $0))})
        self.profiles = profiles
    }
    
}

extension StartView: StarWarsProfileDelegate{
    
    func didFinishLoading(profile:StarWarsProfile?) {
        
        DispatchQueue.main.async {
            [weak self] in
            
            guard let item = profile, let indexOf = self?.profiles.firstIndex(where: {$0.profile.id == item.profile.id}) else { return }
            self?.tableView.beginUpdates()
            self?.tableView.reloadRows(at: [.init(row: indexOf, section: .zero)], with: .none)
            self?.tableView.endUpdates()
        }
    }
}

extension StartView: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = profiles[indexPath.row]
        item.delegate = self
        
        let pCell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as! ProfileTableViewCell
        pCell.nameLabel.text = item.profile.name
        pCell.genderLabel.text = item.profile.gender
        
        return pCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return heightForRow
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if profiles[indexPath.row].image == nil{
            
            profiles[indexPath.row].loadImage()
            return
        }else if let pCell = cell as? ProfileTableViewCell, profiles[indexPath.row].image != nil{
            
            pCell.activity.stopAnimating()
            pCell.avatarView.image = profiles[indexPath.row].image
            return
        }
    }
}
