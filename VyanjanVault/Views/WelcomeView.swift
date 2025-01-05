//
//  WelcomeView.swift
//  VyanjanVault
//
//  Created by Nikhil Hore on 25/12/2024.
//

import UIKit

class WelcomeView: UIView {

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "IndianCuisine")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let searchButton: UIButton = {
        var attributedTitle = AttributedString("Search")
        attributedTitle.font = .boldSystemFont(ofSize: 16.0)

        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.attributedTitle = attributedTitle
        buttonConfiguration.baseForegroundColor = .secondary

        let button = UIButton(configuration: buttonConfiguration)
        button.tintColor = .primary
        return button
    }()

    let discoverButton: UIButton = {
        var attributedTitle = AttributedString("Discover")
        attributedTitle.font = .boldSystemFont(ofSize: 16.0)

        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.attributedTitle = attributedTitle
        buttonConfiguration.baseForegroundColor = .secondary

        let button = UIButton(configuration: buttonConfiguration)
        button.tintColor = .primary
        return button
    }()

    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            imageView, searchButton, discoverButton,
        ])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8.0
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        backgroundColor = .background
        addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor),

            imageView.widthAnchor.constraint(
                equalTo: widthAnchor, constant: -16.0),
            imageView.heightAnchor.constraint(
                equalTo: imageView.widthAnchor, multiplier: 0.75),

            searchButton.widthAnchor.constraint(
                equalTo: imageView.widthAnchor, multiplier: 0.5),
            discoverButton.widthAnchor.constraint(
                equalTo: imageView.widthAnchor, multiplier: 0.5),
        ])
    }
}
