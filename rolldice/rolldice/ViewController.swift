//
//  ViewController.swift
//  rolldice
//
//  Created by 김신협 on 2022/11/28.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    
    var array:[UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2") , #imageLiteral(resourceName: "black3") , #imageLiteral(resourceName: "black4") , #imageLiteral(resourceName: "black5") , #imageLiteral(resourceName: "black6") ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func buttonPress(_ sender: UIButton) {
        
        imageOne.image = array.randomElement()
        imageTwo.image = array.randomElement()
    }
    
}

