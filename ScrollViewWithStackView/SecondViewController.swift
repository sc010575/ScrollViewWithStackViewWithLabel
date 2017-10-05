//
//  SecondViewController.swift
//  ScrollViewWithStackView
//
//  Created by Suman Chatterjee on 05/10/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate:class {
    func SecondViewController(_ secondViewController:SecondViewController, didTap:Bool)
}
class SecondViewController: UIViewController {

    weak var delegate:SecondViewControllerDelegate?
    @IBOutlet weak var actionButton:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttomAction(_ sender: Any) {
        
        self.delegate?.SecondViewController(self, didTap: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
