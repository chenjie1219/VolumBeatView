//
//  ViewController.swift
//  VolumeBeatView
//
//  Created by Jason on 2020/4/17.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beatView: VolumeBeatView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beatView.starAnimation()
    }


}

