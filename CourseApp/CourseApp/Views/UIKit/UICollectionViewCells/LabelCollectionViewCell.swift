//
//  LabelCollectionViewCell.swift
//  CourseApp
//
//  Created by Pavla Beránková on 17.05.2024.
//

import UIKit

final class LabelCollectionViewCell: UICollectionViewCell {
    lazy var nameLabel = UILabel()

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
private extension LabelCollectionViewCell {
    enum Constants {
        static let padding: CGFloat = 5
        static let labelFont: UIFont = TextType.h2Title.uiFont
        static let labelColor: UIColor = TextType.h2Title.uiColor
    }

    func setupUI() {
        addSubviews()
        configureLabel()
        setupConstraints()
    }

    func addSubviews() {
        addSubview(nameLabel)
    }

    func configureLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = Constants.labelColor
        nameLabel.font = Constants.labelFont
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.padding),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.padding),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.padding),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.padding),
        ])
    }
}
