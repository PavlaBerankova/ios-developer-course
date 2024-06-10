//
//  ImageCollectionViewCell.swift
//  CourseApp
//
//  Created by Pavla Beránková on 17.05.2024.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {
    // MARK: UI items
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.cornerRadius
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI
private extension ImageCollectionViewCell {
    func setupUI() {
        addSubviews()
        setupConstraints()
    }

    func addSubviews() {
        addSubview(imageView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.edgeInsets),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.edgeInsets),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.edgeInsets),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.edgeInsets),
        ])
    }
}

private extension ImageCollectionViewCell {
    enum Constants {
        static let cornerRadius: CGFloat = 10
        static let edgeInsets: CGFloat = 5
    }
}
