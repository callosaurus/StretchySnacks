//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Callum Davies on 2017-03-16.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var isExpanded: Bool = false
    var initialPlusPosition: CGAffineTransform?

    var stackView: UIStackView?
    var oreoImageView: UIImageView?
    var poptartImageView: UIImageView?
    var pizzaPocketImageView: UIImageView?
    var popsicleImageView: UIImageView?
    var ramenImageView: UIImageView?
    var snacksArray = [String]()
    
    
    @IBOutlet weak var tableView: UITableView!
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
            self.stackView?.isHidden = !self.isExpanded
            self.view.layoutIfNeeded()
            
        }), completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oreoImageView = UIImageView()
        pizzaPocketImageView = UIImageView()
        poptartImageView = UIImageView()
        popsicleImageView = UIImageView()
        ramenImageView = UIImageView()
        setStackView()
        
    }
    
    fileprivate func setStackView() {
        
        getImageViews()
        stackView = UIStackView()
        
        stackView!.axis  = UILayoutConstraintAxis.horizontal
        stackView!.distribution  = UIStackViewDistribution.equalSpacing
        stackView!.alignment = UIStackViewAlignment.center
        stackView!.spacing = 20
        
        stackView!.addArrangedSubview(oreoImageView!)
        stackView!.addArrangedSubview(pizzaPocketImageView!)
        stackView!.addArrangedSubview(poptartImageView!)
        stackView!.addArrangedSubview(popsicleImageView!)
        stackView!.addArrangedSubview(ramenImageView!)
        
        stackView!.translatesAutoresizingMaskIntoConstraints = false;
        navBarView.addSubview(self.stackView!)
        stackView!.isHidden = !isExpanded
        
        //Constraints
        stackView!.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
        stackView!.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor).isActive = true
    }
    
    fileprivate func getImageViews() {
        
        //needs refactoring with for-in loop
        
        oreoImageView = UIImageView(image:UIImage(named: "oreos.png"))
        oreoImageView!.frame = CGRect(x: 0, y: 0, width: 50, height: 150)
        navBarView.addSubview(oreoImageView!)
        oreoImageView!.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        oreoImageView!.widthAnchor.constraint(equalToConstant: 50).isActive = true;
        oreoImageView!.isUserInteractionEnabled = true
        oreoImageView!.tag = 1
        oreoImageView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        
        pizzaPocketImageView = UIImageView(image: UIImage(named: "pizza_pockets.png"))
        pizzaPocketImageView!.frame = CGRect(x: 60, y: 0, width: 50, height: 150)
        navBarView.addSubview(pizzaPocketImageView!)
        pizzaPocketImageView!.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        pizzaPocketImageView!.widthAnchor.constraint(equalToConstant: 50).isActive = true;
        pizzaPocketImageView!.isUserInteractionEnabled = true
        pizzaPocketImageView!.tag = 2
        pizzaPocketImageView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        
        poptartImageView = UIImageView(image: UIImage(named: "pop_tarts.png"))
        poptartImageView!.frame = CGRect(x: 120, y: 0, width: 50, height: 150)
        navBarView.addSubview(poptartImageView!)
        poptartImageView!.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        poptartImageView!.widthAnchor.constraint(equalToConstant: 50).isActive = true;
        poptartImageView!.isUserInteractionEnabled = true
        poptartImageView!.tag = 3
        poptartImageView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        
        popsicleImageView = UIImageView(image: UIImage(named: "popsicle.png"))
        popsicleImageView!.frame = CGRect(x: 180, y: 0, width: 50, height: 150)
        navBarView.addSubview(popsicleImageView!)
        popsicleImageView!.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        popsicleImageView!.widthAnchor.constraint(equalToConstant: 50).isActive = true;
        popsicleImageView!.isUserInteractionEnabled = true
        popsicleImageView!.tag = 4
        popsicleImageView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        
        ramenImageView = UIImageView(image: UIImage(named: "ramen.png"))
        ramenImageView!.frame = CGRect(x: 240, y: 0, width: 50, height: 150)
        navBarView.addSubview(ramenImageView!)
        ramenImageView!.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        ramenImageView!.widthAnchor.constraint(equalToConstant: 50).isActive = true;
        ramenImageView!.isUserInteractionEnabled = true
        ramenImageView!.tag = 5
        ramenImageView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
    }
    
    
    func imageTapped(_ img: UITapGestureRecognizer)
    {
        
        var snackName: String?
        
        if img.view?.tag == oreoImageView?.tag {
            snackName = "Oreos"
        }
        if img.view?.tag == poptartImageView?.tag {
            snackName = "Poptarts"
        }
        if img.view?.tag == popsicleImageView?.tag {
            snackName = "Popsicle"
        }
        if img.view?.tag == ramenImageView?.tag {
            snackName = "Ramen"
        }
        if img.view?.tag == pizzaPocketImageView?.tag {
            snackName = "Pizza Pockets"
        }
        
        snacksArray.insert(snackName!, at: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [
            IndexPath(row: 0, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.snacksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let snackName = snacksArray[indexPath.row]
        cell.textLabel?.text = snackName
        
        return cell
    }
    
}


