//
//  NMAStoreLocatorAnnotationView.swift
//  ScrollViewWithStackView
//
//  Created by Suman Chatterjee on 23/09/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import UIKit
import MapKit

enum ZoomScale : CGFloat{
    case scaleIn =  1.5
    case scaleOut = 1.0
}

class NMAStoreLocatorAnnotationView: MKAnnotationView {
        
    override init(annotation:MKAnnotation?, reuseIdentifier:String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        __setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        __setup()
    }
    
    func zoomStoreLocatorPin(for zoomScale : ZoomScale)
    {
        let zoomFactor = zoomScale.rawValue
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = CGAffineTransform(scaleX: CGFloat(zoomFactor),y: CGFloat(zoomFactor))
        })
    }
    
}

private extension NMAStoreLocatorAnnotationView {
    
    func __setup() {
        
        self.canShowCallout = false
        self.image = UIImage(named: "pin_large")
        self.calloutOffset = CGPoint(x: -5, y: 5)
        
    }
}
