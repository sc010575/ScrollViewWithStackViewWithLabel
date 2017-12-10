//
//  UIView+loadViewFromNib.swift
//  ScrollViewWithStackView
//
//  Created by Suman Chatterjee on 10/10/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import Foundation
import UIKit

extension Bundle {
    
    static func loadView<T>(fromNib name: String, withType type: T.Type) -> T {
//          guard let view = Bundle.main.loadNibNamed(name, owner: type, options: nil)?.first as? T else {
//            return nil
//            }
//        return view
        
       // let bundle = Bundle(for: self)
        let nib = UINib(nibName: name, bundle: Bundle.main)
        
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            fatalError("Could not load view from nib file.")
        }
        return view
        
    }
}
