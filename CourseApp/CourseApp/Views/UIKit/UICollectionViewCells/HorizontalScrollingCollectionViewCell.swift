//
//  HorizontalScrollingCollectionViewCell.swift
//  CourseApp
//
//  Created by Pavla Beránková on 17.05.2024.
//

import os
import SwiftUI
import UIKit

final class HorizontalScrollingCollectionViewCell: UICollectionViewCell {
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Constants.layoutMinimumLineSpacing
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    var images = [UIImage?]()

    //    // MARK: - Data
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupCollectionView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SETUP UI
private extension HorizontalScrollingCollectionViewCell {
    enum Constants {
        static let layoutMinimumLineSpacing: CGFloat = 5
        static let constraintsTop: CGFloat = 10
        static let constraintsBottom: CGFloat = 0
        static let constraintsLeading: CGFloat = 0
        static let constraintsTrailing: CGFloat = 0
        static let cornerRadius: CGFloat = 10
    }

    func setupUI() {
        setupCollectionView()
        addSubviews()
        setupConstraints()
    }

    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self)
    }

    func addSubviews() {
        addSubview(collectionView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.constraintsTop),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.constraintsBottom),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.constraintsLeading),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.constraintsTrailing),
        ])
    }
}

extension HorizontalScrollingCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.contentConfiguration = UIHostingConfiguration {
            Image(uiImage: images[indexPath.row] ?? UIImage())
                .resizableBordered(cornerRadius: Constants.cornerRadius)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}

extension HorizontalScrollingCollectionViewCell: UICollectionViewDelegate {
}

extension UICollectionViewCell: ReusableIdentifier { }
