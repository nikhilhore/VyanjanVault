//
//  ViewController.swift
//  VyanjanVault
//
//  Created by Nikhil Hore on 05/01/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }

    func setupViews() {
        view.backgroundColor = .background
        let welcomeView = WelcomeView(frame: .zero)

        // Create an instance of AdaptiveView with the welcomeView as its content
        let adaptiveView = AdaptiveView(frame: .zero, contentView: welcomeView)
        adaptiveView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(adaptiveView)

        // Pin the adaptiveView to all edges of the safe area of the view
        NSLayoutConstraint.activate([
            adaptiveView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            adaptiveView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            adaptiveView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            adaptiveView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
