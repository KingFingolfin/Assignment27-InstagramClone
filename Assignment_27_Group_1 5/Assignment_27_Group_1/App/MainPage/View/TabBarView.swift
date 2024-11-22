//
//  TabBarView.swift
//  Assignment_27_Group_1
//
//  Created by Nino Kurshavishvili on 22.11.24.
//

import UIKit

class TabBarView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTabBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabBar() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        let homeButton = UIButton()
        homeButton.setImage(UIImage(named: "homeIcon"), for: .normal)
        
        let searchButton = UIButton()
        searchButton.setImage(UIImage(named: "searchIcon"), for: .normal)
        
        let addButton = UIButton()
        addButton.setImage(UIImage(named: "addIcon"), for: .normal)
        
        let favoritesButton = UIButton()
        favoritesButton.setImage(UIImage(named: "favoritesIcon"), for: .normal)
        
        let profileButton = UIButton()
        profileButton.setImage(UIImage(named: "profileIcon"), for: .normal)
        
        [homeButton, searchButton, addButton, favoritesButton, profileButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

