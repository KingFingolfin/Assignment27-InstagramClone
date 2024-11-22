//
//  MainPageViewController.swift
//  Assignment_27_Group_1
//
//  Created by Nino Kurshavishvili on 22.11.24.
//

import UIKit


class MainPageViewController: UIViewController {
    private let viewModel = MainPageViewModel()
    private let topBarView = TopBarView()
    private let tabBarView = TabBarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        displayPosts()
        labelSetup()
        viewModel.fetchPosts()
                
                
        DispatchQueue.main.async {
            print(self.viewModel.numberOfItems())
        }
    }
    
    private func labelSetup() {
        let textText = UILabel()
        view.addSubview(textText)
        textText.translatesAutoresizingMaskIntoConstraints = false
        
        textText.text = String(viewModel.numberOfItems())
    }
    private func setupLayout() {
        view.backgroundColor = .white
        
        view.addSubview(topBarView)
        topBarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBarView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(tabBarView)
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.backgroundColor = .cyan
        NSLayoutConstraint.activate([
            tabBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func displayPosts() {
        //let posts = viewModel.getPosts()
    }
}

import SwiftUI

struct MainPageViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            MainPageViewController()
        }
    }
}

struct ViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController
    
    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }
    
    func makeUIViewController(context: Context) -> ViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
}
