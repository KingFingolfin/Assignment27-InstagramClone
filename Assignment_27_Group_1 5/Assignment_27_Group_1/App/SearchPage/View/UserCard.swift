//
//  UserCard.swift
//  Assignment_27_Group_1
//
//  Created by Nino Kurshavishvili on 22.11.24.
//

import UIKit

class UserCard: UIView {
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let statsLabel = UILabel()
    private let editProfileButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        // Configure profile image
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 40
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileImageView)

        // Configure labels and button
        nameLabel.font = .boldSystemFont(ofSize: 16)
        usernameLabel.font = .systemFont(ofSize: 14)
        statsLabel.font = .systemFont(ofSize: 14)
        statsLabel.textColor = .darkGray

        editProfileButton.setTitle("Edit Profile", for: .normal)
        editProfileButton.backgroundColor = .clear
        editProfileButton.layer.borderColor = UIColor.gray.cgColor
        editProfileButton.layer.borderWidth = 1
        editProfileButton.layer.cornerRadius = 5

        // Stack the labels and button
        let stackView = UIStackView(arrangedSubviews: [nameLabel, usernameLabel, statsLabel, editProfileButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        // Layout constraints
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            
            stackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func configure(with user: User) {
        profileImageView.image = UIImage(named: user.profileImage)
        nameLabel.text = user.name
        usernameLabel.text = user.username
        statsLabel.text = "\(user.posts) Posts    \(user.followers) Followers    \(user.following) Following"
    }
}

