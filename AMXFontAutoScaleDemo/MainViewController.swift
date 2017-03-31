//
//  MainViewController.swift
//  AMXFontAutoScale
//
//  Created by Alexandru Maimescu on 4/1/17.
//  Copyright © 2017 Alex Maimescu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var helloLabels: [UILabel]!
    @IBOutlet var sizeLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if helloLabels.count == sizeLabels.count {
            for (index, helloLabel) in helloLabels.enumerated() {
                sizeLabels[index].text = String(format: "%.2f", helloLabel.font.pointSize)
            }
        } else {
            fatalError("Please connect all the outlets.")
        }
    }
}
