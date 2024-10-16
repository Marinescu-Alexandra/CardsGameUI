//
//  FontSize.swift
//
//
//  Created by Alexandra Marinescu on 20.09.2024.
//

import UIKit

public enum FontSize: Hashable {
    
    /// 12.0
    case smaller
    /// 14.0
    case small
    /// 16.0
    case regular
    /// 18.0
    case large
    /// 20.0
    case header
    /// 22.0
    case subTitle
    /// 24.0
    case title
    /// custom size
    case custom(CGFloat)
    
}

public extension FontSize {
    var value: CGFloat {
        switch self {
        case .smaller:
            return 12.0
        case .small:
            return 14.0
        case .regular:
            return 16.0
        case .large:
            return 18.0
        case .header:
            return 20.0
        case .subTitle:
            return 22.0
        case .title:
            return 24.0
        case .custom(let size):
            return size
        }
    }
}
