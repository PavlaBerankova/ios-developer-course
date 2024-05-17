//
//  ReusableIdentifier.swift
//  CourseApp
//
//  Created by Pavla Beránková on 17.05.2024.
//

import UIKit

protocol ReusableIdentifier {
    static var identifier: String { get }
}

extension ReusableIdentifier where Self: UICollectionViewCell {
    static var identifier: String {
        String(describing: Self.self)
    }
}
