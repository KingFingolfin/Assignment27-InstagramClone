//
//  FollowerCell.swift
//  Assignment_27_Group_1
//
//  Created by Nino Kurshavishvili on 22.11.24.
//

import UIKit

class FollowerCell: UITableViewCell {
    
    let profileImageView = UIImageView()
    let usernameLabel = UILabel()
    let actionLabel = UILabel()
    let timeLabel = UILabel()
    let followButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        profileImageView.layer.cornerRadius = 20
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileImageView)
        
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(usernameLabel)
        
        actionLabel.font = UIFont.systemFont(ofSize: 14)
        actionLabel.textColor = .gray
        actionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(actionLabel)
        
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.textColor = .lightGray
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timeLabel)
        
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitleColor(.systemBlue, for: .normal)
        followButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        followButton.layer.cornerRadius = 5
        followButton.layer.borderWidth = 1
        followButton.layer.borderColor = UIColor.systemBlue.cgColor
        followButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(followButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 12),
            usernameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            
            actionLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            actionLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 4),
            
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            
            followButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            followButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            followButton.widthAnchor.constraint(equalToConstant: 60),
            followButton.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configure(with action: LikeAction) {
        usernameLabel.text = action.username
        actionLabel.text = action.actionText
        timeLabel.text = action.time
        profileImageView.image = UIImage(named: action.profileImageURL) // Placeholder image
        
        followButton.isHidden = !action.isFollowing
    }
}

import SwiftUI

struct FollowerCellPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let cell = FollowerCell(style: .default, reuseIdentifier: "FollowerCell")
        
        // Configure the cell with sample data for preview
        let sampleAction = LikeAction(
            username: "sample_user",
            actionText: "started following you.",
            time: "3d",
            profileImageURL: "profileImageURL",
            isFollowing: true
        )
        
        cell.configure(with: sampleAction)
        return cell.contentView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

//#Preview {
//    FollowerCellPreview()
//        .previewLayout(.fixed(width: 375, height: 70)) // Set the width and height as desired
//}

