//
//  LoadableNib.swift
//  ScrollViewWithStackView
//
//  Created by Suman Chatterjee on 10/10/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import Foundation
import UIKit

protocol NMALoadableViewFromNib {
    associatedtype object
    func loadViewFromNib() -> object?
}

extension NMALoadableViewFromNib where Self:object {
    
    func loadViewFromNib() -> object? {
        
        let bundle = Bundle(for: type(of: self) as! AnyClass)
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as? object
        return view
    }
    
}
