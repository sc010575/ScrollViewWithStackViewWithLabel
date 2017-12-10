//
//  MainViewController.swift
//  ScrollViewWithStackView
//
//  Created by Suman Chatterjee on 23/09/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import UIKit
import MapKit

//public typealias CompletionHandler = (_ image: UIImage?) -> Void


class MainViewController: UIViewController {
    
    @IBOutlet weak var mapShowButton: UIButton!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet var actionForTap: UITapGestureRecognizer!

    var image : UIImage? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5) {
            self.infoView.isHidden = true
            
        }
        
        let mapSnapshot = NMAMapSnapshot()
        let coordinate = CLLocationCoordinate2DMake(51.44325, -0.47395)
        let imageRect = CGRect(x: 0, y: 0, width: 375, height: 400)
        mapSnapshot.takeSnapShot(for: coordinate,rect: imageRect) { (image) in
                self.image = image
        }
        
    }
    
    
    @IBAction func tapAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "detailViewControllerId", sender: nil)
    }
    
    @IBAction func handleShowMap(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            self.infoView.isHidden = false
        }
        
    }
    
    
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let storeLocatorDetailsViewControllerSegueIdentifier:String = segue.identifier else {
            return
        }
        if storeLocatorDetailsViewControllerSegueIdentifier == "detailViewControllerId"{
            guard let viewController = segue.destination as? ViewController else {return}
            viewController.image = image
        }
    }

    
    
    
}
