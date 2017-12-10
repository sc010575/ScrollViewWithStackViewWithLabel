//
//  ViewController.swift
//  ScrollViewWithStackView
//
//  Created by Suman Chatterjee on 22/09/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import UIKit
import MapKit

struct StretchyHeaderMap {
    let headerHeight:CGFloat = 200.0
    let headerCut:CGFloat = 50.0
}

class ViewController: UIViewController,SecondViewControllerDelegate,UIScrollViewDelegate {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerMapView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
        }
    }

    @IBOutlet weak var mapImage : UIImageView!{
        didSet{
            mapImage.isUserInteractionEnabled = true
        }
    }
    var secondViewController:SecondViewController? = nil
   
    var image : UIImage? = nil
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    var headerView:UIView!
    var newHeaderLayer: CAShapeLayer!
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = self.scrollView.contentOffset.y
        if offset < 1 {
            let absOffset = fabs(offset)
            self.heightConstraint.constant  = 200 + absOffset
//            self.headerViewHeightConstraint.constant = 200 + absOffset
//            self.scrollView.contentOffset = CGPoint(x:0, y:200 + absOffset)
            self.stackView.layoutIfNeeded()
            self.view.layoutIfNeeded()
//            updateView()

        }
    }
   override func viewDidLoad() {
        super.viewDidLoad()
        self.mapImage.image = image
    self.containerView.isHidden = true
    self.secondViewController?.delegate = self
    self.scrollView.delegate = self
 //   newHeaderLayer = CAShapeLayer()
 //   newHeaderLayer.fillColor = UIColor.black.cgColor
 //   headerMapView.layer.mask = newHeaderLayer

//   let newHeight = StretchyHeaderMap().headerHeight - StretchyHeaderMap().headerCut/2
//    self.scrollView.contentInset = UIEdgeInsets(top: newHeight, left: 0, bottom: 0, right: 0)
    self.scrollView.contentOffset = CGPoint(x: 0, y: -200)
//    updateView()
    self.scrollView.contentSize =  CGSize(width:self.stackView.frame.width, height:100)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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
    }

    func updateView(){
        
        let newHeight = StretchyHeaderMap().headerHeight - StretchyHeaderMap().headerCut/2
        var getHeaderFrame = CGRect(x: 0, y: -newHeight, width: headerMapView.bounds.width, height:StretchyHeaderMap().headerHeight)
        if self.scrollView.contentOffset.y < newHeight {
                getHeaderFrame.origin.y = self.scrollView.contentOffset.y
                getHeaderFrame.size.height = -self.scrollView.contentOffset.y + StretchyHeaderMap().headerCut/2
        }
        
        self.headerMapView.frame = getHeaderFrame
        let cutDirection = UIBezierPath()
        cutDirection.move(to: CGPoint(x: 0, y: 0))
        cutDirection.addLine(to: CGPoint(x: getHeaderFrame.width, y: 0))
        cutDirection.addLine(to: CGPoint(x: getHeaderFrame.width, y: getHeaderFrame.height))
        cutDirection.addLine(to: CGPoint(x: 0, y: getHeaderFrame.height - StretchyHeaderMap().headerCut))
        newHeaderLayer.path = cutDirection.cgPath
        

    
        
    }
}

