//
//  LikesPageViewController.swift
//  Assignment_27_Group_1
//
//  Created by Nino Kurshavishvili on 22.11.24.
//

import UIKit

class LikesPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let viewModel = LikesPageViewModel()
    private let tableView = UITableView()
    private let topLabel = UILabel()
    private let tabBarView = TabBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.fetchLikeActions()
        tableView.reloadData()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Set up top label
        topLabel.text = "You"
        topLabel.font = UIFont.boldSystemFont(ofSize: 20)
        topLabel.textAlignment = .center
        view.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Set up table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FollowerCell.self, forCellReuseIdentifier: "FollowerCell")
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: tabBarView.topAnchor)
        ])
        
        // Set up tab bar
        view.addSubview(tabBarView)
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - UITableView DataSource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getActions().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FollowerCell", for: indexPath) as? FollowerCell else {
            return UITableViewCell()
        }
        
        let action = viewModel.getActions()[indexPath.row]
        cell.configure(with: action)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70 // Adjust height as needed
    }
}

import SwiftUI

struct LikesPageViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> LikesPageViewController {
        return LikesPageViewController()
    }
    
    func updateUIViewController(_ uiViewController: LikesPageViewController, context: Context) {}
}

#Preview {
    LikesPageViewControllerPreview()
        .edgesIgnoringSafeArea(.all)
}
