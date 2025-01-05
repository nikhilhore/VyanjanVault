//
//  AdaptiveView.swift
//  VyanjanVault
//
//  Created by Nikhil Hore on 02/01/2025.
//

import UIKit

class AdaptiveView: UIView {

    /// The view that contains the actual content.
    private let contentView: UIView

    init(frame: CGRect, contentView: UIView) {
        self.contentView = contentView
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// A lazily initialized scroll view to handle content that might exceed the view's bounds.
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    /// Sets up the initial layout of the subviews.
    private func setupViews() {
        addSubview(scrollView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        let contentViewHeightConstraint = contentView.heightAnchor.constraint(
            equalTo: heightAnchor)
        contentViewHeightConstraint.priority = .defaultLow
        NSLayoutConstraint.activate([
            // Pin the scroll view to all four edges of the AdaptiveView.
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            // Pin the contentView to all four edges of the scroll view's content layout guide.
            contentView.topAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentViewHeightConstraint,
        ])
    }

    /// Updates the scroll view's content size based on the contentView's frame.
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.contentSize = contentView.frame.size
    }
}
