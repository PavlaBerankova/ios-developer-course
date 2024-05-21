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
    // MARK: UI items
    private var collectionView: UICollectionView!
    var images = [UIImage?]()

//    // MARK: - Data
//    private var data: [Joke] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SETUP UI
private extension HorizontalScrollingCollectionViewCell {
    func setupUI() {
        setupCollectionView()
        addSubviews()
        setupConstraints()
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5

        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }

    func addSubviews() {
        addSubview(collectionView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        ])
    }
}

extension HorizontalScrollingCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(for: indexPath) as ImageCollectionViewCell
//        cell.imageView.image = images[indexPath.item]
//        return cell

        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.contentConfiguration = UIHostingConfiguration {
            Image(uiImage: images[indexPath.row] ?? UIImage())
                .resizableBordered(cornerRadius: 10)
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
