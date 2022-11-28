//
//  ViewController.swift
//  changeButton
//
//  Created by 김신협 on 2022/11/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainLabel.backgroundColor = UIColor.brown
    }


    
    @IBAction func clickBtn(_ sender: UIButton) {
        mainLabel.text = "반갑습니다"
        
        mainLabel.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
    
    
    
}

