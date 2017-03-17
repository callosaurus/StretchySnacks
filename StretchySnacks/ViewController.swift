//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Callum Davies on 2017-03-16.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isExpanded: Bool = false
    var initialPlusPosition: CGAffineTransform?

    
    @IBOutlet weak var navBarView: UIView!
    
    @IBOutlet weak var navBarHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var plusButton: UIButton! {
        didSet {
            self.initialPlusPosition = plusButton.transform
        }
    }
    @IBAction func plusIconPressed(_ sender: UIButton) {
        isExpanded = !isExpanded
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1.0, options: .curveEaseIn, animations: ({
            if self.isExpanded
            {
                self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
                self.navBarHeightConstraint.constant = 200
            }
            else
            {
                self.plusButton.transform = self.initialPlusPosition!
                self.navBarHeightConstraint.constant = 66
            }
            
        }), completion: nil)
    }
}


