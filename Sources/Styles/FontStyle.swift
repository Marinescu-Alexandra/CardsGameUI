//
//  FontStyle.swift
//
//
//  Created by Alexandra Marinescu on 20.09.2024.
//

import UIKit

public enum FontStyle: String, CaseIterable {
    /// Caviar Dreams
    case caviarNormal = "CaviarDreams"
    case caviarBold = "CaviarDreams-Bold"
    case caviarItalic = "CaviarDreams-Italic"
    case caviarBoldItalic = "CaviarDreams-Bold-Italic"
    
    /// Courier Prime
    case courier = "Courier-Prime"
    case courierBold = "Courier-Prime-Bold"
    case courierItalic = "Courier-Prime-Italic"
    case courierBoldItalic = "Courier-Prime-Bold-Italic"
    
    /// Pixel Game
    case pixelGame = "PixelGame"
    
    /// SuperPixel
    case superPixel = "SuperPixel"
}


public extension FontStyle {
    
    func font(size: FontSize = .regular) -> UIFont {
        guard let font = UIFont(name: rawValue, size: size.value) else {
            fatalError("Couldn't initializa font '\(rawValue)'")
        }
        return font
    }

}


// MARK: Font Registration

public extension FontStyle {
    
    func register(in bundle: Bundle) {
        Self.register(in: bundle, fileName: rawValue, fileExtension: "ttf")
    }
    
    static func register(in bundle: Bundle, fileName: String, fileExtension: String) {
        
        guard let fontURL = bundle.url(forResource: fileName, withExtension: "ttf") else {
            fatalError("Couldn't find resource url for \(fileName).\(fileExtension)")
        }
        
        CTFontManagerRegisterFontURLs([fontURL] as CFArray, .persistent, true) { (errors, didRegister) -> Bool in
            if didRegister {
                print("Font registered '\(fileName)'")
            } else {
                fatalError("Couldn't register font \(fileName) with errors: \(errors as Array)")
            }
            return true
        }
        
    }
    
}
