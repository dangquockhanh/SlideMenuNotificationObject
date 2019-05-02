//
//  HomeViewController.swift
//  slideMenu4
//
//  Created by Đặng Khánh  on 4/24/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, Delegate {
    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var backMenu: UIButton!
    @IBOutlet weak var leadingViewMenu: NSLayoutConstraint!
    
    
    var showing = false {
        didSet {
            UIView.animate(withDuration: 0.35, animations: {
                self.leadingViewMenu.constant = self.showing ? 0 : -self.viewMenu.bounds.width
                self.backMenu.alpha = self.showing ? 1 : 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showing = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? UINavigationController {
            let vc1 = vc.topViewController as? DetailViewController
            vc1?.delegate = self
        }
    }
    
    
    @IBAction func BackButton(_ sender: Any) {
        showing = !showing
    }
    
    
}
