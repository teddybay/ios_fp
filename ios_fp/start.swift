//
//  start.swift
//  ios_fp
//
//  Created by 陳伯墉 on 2018/6/29.
//  Copyright © 2018年 00457006. All rights reserved.
//

import UIKit

class start: UIViewController {
    
    @IBOutlet weak var giff: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        giff.loadGif(name: "吃土gif")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
