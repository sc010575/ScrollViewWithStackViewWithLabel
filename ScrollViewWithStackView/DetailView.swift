//
//  DetailView.swift
//  ScrollViewWithStackView
//
//  Created by Suman Chatterjee on 10/10/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import UIKit

protocol NMALoadableViewFromNib {
    
    func loadViewFromNib()
}

extension NMALoadableViewFromNib where Self:UIView {
    
    func loadViewFromNib() {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            return
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
}


extension UIView {
    
    func fromNib<T : UIView>() -> T? {
        guard let contentView = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
            return nil
        }
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }
}

class DetailView: UIView,NMALoadableViewFromNib {
    
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.text = "You are a good title."
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        __setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        __setup()
    }

    func __setup() {
        
//        guard  let view :DetailView = Bundle.main.loadNibNamed("DetailView", owner: self, options: nil)?.first as? DetailView else {
//            return
//        }
  //      guard let view:DetailView = Bundle.loadView(fromNib: String(describing:DetailView.self), withType:DetailView.self)  else {return}
       // let view:DetailView = UIView.fromNib()
     //   view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
     //   view.frame = self.bounds
     //   addSubview(view)
        self.loadViewFromNib()

    }

}
