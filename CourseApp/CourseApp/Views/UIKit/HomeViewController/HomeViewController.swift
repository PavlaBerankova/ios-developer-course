//
//  HomeViewController.swift
//  CourseApp
//
//  Created by Pavla Beránková on 17.05.2024.
//

import Combine
import SwiftUI
import UIKit

final class HomeViewController: UIViewController {
    @IBOutlet private var categoriesCollectionView: UICollectionView!

    // MARK: DataSource
    private lazy var dataProvider = MockDataProvider()
    typealias DataSource = UICollectionViewDiffableDataSource<SectionData, [Joke]>
    typealias Snapshot = NSDiffableDataSourceSnapshot<SectionData, [Joke]>

    private lazy var dataSource = makeDataSource()
    private lazy var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = "Categories"
    }
}

// MARK: - UICollectionViewDataSource
private extension HomeViewController {
    func readData() {
        dataProvider.$data.sink { [weak self] data in
            print(data)
           self?.applySnapshot(data: data, animatingDifferences: true)
        }
        .store(in: &cancellables)
    }

    func applySnapshot(data: [SectionData], animatingDifferences: Bool = true) {
        guard dataSource.snapshot().numberOfSections == 0 else {
            let snapshot = dataSource.snapshot()
            dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
            return
        }

        var snapshot = Snapshot()
        snapshot.appendSections(data)

        data.forEach { section in
            snapshot.appendItems([section.jokes], toSection: section)
        }

        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }

    func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: categoriesCollectionView) { collectionView, indexPath, joke in
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]

            let horizontalCell: HorizontalScrollingCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            horizontalCell.images = section.jokes.map { $0.image }
            return horizontalCell
        }

        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader else {
                return nil
            }

            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            let labelCell: LabelCollectionViewCell = collectionView.dequeueSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, for: indexPath)
            labelCell.nameLabel.text = section.title
            return labelCell
        }

        return dataSource
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("I have tapped \(indexPath)")
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("will display \(indexPath)")
    }
}

// MARK: - UI setup
private extension HomeViewController {
    func setup() {
        setupCollectionView()
        readData()
    }

    func setupCollectionView() {
        categoriesCollectionView.backgroundColor = .bg
        categoriesCollectionView.isPagingEnabled = true
        categoriesCollectionView.contentInsetAdjustmentBehavior = .never
        categoriesCollectionView.showsVerticalScrollIndicator = false
        categoriesCollectionView.delegate = self
        categoriesCollectionView.register(HorizontalScrollingCollectionViewCell.self)
        categoriesCollectionView.register(LabelCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //Change this to vertical
        layout.minimumLineSpacing = 8 //Spacing here is not necessary, but adds a better inset for horizontal scrolling. Gives you a tiny peek of the background. Probably not great for vertical
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        layout.sectionHeadersPinToVisibleBounds = true
        layout.headerReferenceSize = CGSize(width: categoriesCollectionView.contentSize.width, height: 30)
        layout.itemSize = CGSize(width: categoriesCollectionView.bounds.width, height: categoriesCollectionView.bounds.height / 3)
        categoriesCollectionView.setCollectionViewLayout(layout, animated: false)
    }
}
