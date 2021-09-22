//
//  ViewController.swift
//  RippleAnimation
//
//  Created by fuyoufang on 2021/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    let animationView = RippleAnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(animationView)
        
        animationView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    }


}

