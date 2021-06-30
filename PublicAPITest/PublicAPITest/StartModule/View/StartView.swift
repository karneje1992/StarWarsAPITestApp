//
//  StartView.swift
//  StarWarsTestApp
//
//  Created by Rostyslav Didenko on 21.06.2021.
//

import UIKit
import AsyncDisplayKit

private let heightForRow:CGFloat = 50.0

class StartView: ASDKViewController<ASDisplayNode>, MainView {

    private var tableNode:ASTableNode{
        get{
            node as! ASTableNode
        }
    }
    
    var presenter: MainPresenter?
    
    private var profiles:[Profile]{
        get{
            guard let startPresenter = presenter as? StartPresenter else { return [] }
            return startPresenter.profiles
        }
    }
    
    override init(node: ASDisplayNode) {
        super.init(node: node)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        view.addSubnode(tableNode)
    }
    
    func refreshUI() {
        tableNode.reloadData()
    }
    
    private func configTable(){
        
        tableNode.view.separatorStyle = .none
        tableNode.delegate = self
        tableNode.dataSource = self
        tableNode.frame = view.bounds
    }
    
}

extension StartView: ASTableDelegate, ASTableDataSource {
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        
        return 1
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        
        return profiles.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {

        return ProfileCellNode(profile: profiles[indexPath.row])
    }
}
