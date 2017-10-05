//
//  NMAMapSnapshot.swift
//  ScrollViewWithStackView
//
//  Created by Suman Chatterjee on 23/09/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import UIKit
import MapKit

public typealias CompletionHandler = (_ image: UIImage?) -> Void

protocol NMAMapSnapshotable {
    func takeSnapShot(for coordinate: CLLocationCoordinate2D
,completion:@escaping CompletionHandler)
    
}

struct NMAMapSnapshot: NMAMapSnapshotable {
    
    func takeSnapShot(for coordinate: CLLocationCoordinate2D,completion:@escaping CompletionHandler) {
        
        let rect = CGRect(x: 0, y: 0, width: 375, height: 100)
        let mapSnapshotOptions = MKMapSnapshotOptions()

        let location = coordinate
        let region = MKCoordinateRegionMakeWithDistance(location, 1000, 1000)
        
        mapSnapshotOptions.region = region
        
        // Set the scale of the image. 
        
        mapSnapshotOptions.scale = UIScreen.main.scale
        
        // Set the size of the image output.
        mapSnapshotOptions.size = CGSize(width: rect.width, height: rect.height)
        
        // Show buildings and Points of Interest on the snapshot
        mapSnapshotOptions.showsBuildings = true
        mapSnapshotOptions.showsPointsOfInterest = true
        
        let snapShotter = MKMapSnapshotter(options: mapSnapshotOptions)
        
        snapShotter.start(with: DispatchQueue.global(qos: .default), completionHandler:{ (snapshot, error) in
            guard let snapshot = snapshot else {
                return
            }
            
            UIGraphicsBeginImageContextWithOptions(mapSnapshotOptions.size, true, 0)
            snapshot.image.draw(at: .zero)
            
            let pinView = NMAStoreLocatorAnnotationView(annotation: nil, reuseIdentifier: nil)
            let pinImage = pinView.image
            
            var point = snapshot.point(for: location)
            
            if rect.contains(point) {
                let pinCenterOffset = pinView.centerOffset
                point.x -= pinView.bounds.size.width / 2
                point.y -= pinView.bounds.size.height / 2
                point.x += pinCenterOffset.x
                point.y += pinCenterOffset.y
                pinImage?.draw(at: point)
            }
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            DispatchQueue.main.async {
                
                let imageToSend:UIImage? = image
                return completion(imageToSend)
            }
        })
    }
 
}
