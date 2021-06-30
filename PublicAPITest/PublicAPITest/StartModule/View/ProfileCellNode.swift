//
//  ProfileCellNode.swift
//  PublicAPITest
//
//  Created by Rostyslav Didenko on 30.06.2021.
//

import AsyncDisplayKit


class ProfileCellNode: ASCellNode {
    
    private let avatarImageNode = ASNetworkImageNode()
    private let titleNode = ASTextNode()
    private let subtitleNode = ASTextNode()
    private var profile:Profile!
    
    init(profile:Profile) {
        super.init()
        
        self.addSubnode(avatarImageNode)
        self.addSubnode(titleNode)
        self.addSubnode(subtitleNode)
        self.profile = profile
        self.setupNodes()
    }
    
    private func setupNodes() {
        
        self.avatarImageNode.url = URL(string: profile.image)
        self.avatarImageNode.style.preferredSize = CGSize(width: 100, height: 100)
        
        self.titleNode.attributedText = NSAttributedString.attributedString(string: profile.name, fontSize: 14, fontColor: nil)
        self.titleNode.maximumNumberOfLines = 1
        self.titleNode.truncationMode = .byTruncatingMiddle
        
        
        self.subtitleNode.attributedText = NSAttributedString.attributedString(string: profile.gender, fontSize: 14, fontColor: nil)
        self.subtitleNode.maximumNumberOfLines = 1
        self.subtitleNode.truncationMode = .byTruncatingTail

    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
       
        let textStack = ASStackLayoutSpec(direction: .vertical, spacing: 2.0, justifyContent: .spaceBetween, alignItems: .stretch, children: [titleNode, subtitleNode])
        textStack.style.flexGrow = 1.0

        let imageTextStack = ASStackLayoutSpec(direction: .horizontal,
                                               spacing: 4.0,
                                               justifyContent: .spaceBetween,
                                               alignItems: .center,
                                               children: [avatarImageNode,
                                                          textStack])


        let insetStack = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 4.0),
                                           child: imageTextStack)

        return insetStack
    }
}
