//
//  ViewController.swift
//  ScrollViewWithStackView
//
//  Created by Suman Chatterjee on 22/09/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController,SecondViewControllerDelegate {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var mapImage : UIImageView!{
        didSet{
            mapImage.isUserInteractionEnabled = true
        }
    }
    var secondViewController:SecondViewController? = nil
   
    var image : UIImage? = nil
    
   override func viewDidLoad() {
        super.viewDidLoad()
        self.mapImage.image = image
    self.containerView.isHidden = true
    self.secondViewController?.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "secondsegueId" {
            let containerViewController = segue.destination as? SecondViewController
            self.secondViewController = containerViewController
        }
        
    }
    func SecondViewController(_ secondViewController:SecondViewController, didTap:Bool){
        self.containerView.isHidden = true

    }
    
    @IBAction func tapActionMapView(_ sender: Any) {
        self.containerView.isHidden = false

//        self.performSegue(withIdentifier: "embeddsegue", sender: nil)
    }

}

