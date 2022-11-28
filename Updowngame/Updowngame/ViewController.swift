//
//  ViewController.swift
//  Updowngame
//
//  Created by 김신협 on 2022/11/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var downLabel: UILabel!
    
//    정답 및 내가 선택한것
    var answer = Int.random(in: 1...10)
//    var myChoice: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topLabel.text = "선택하세요"
        downLabel.text = ""
    }

    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let numString = sender.currentTitle else {return}
        downLabel.text = numString
        
//        guard let num = Int(numString) else {return}
//        myChoice = num
    }
    
    
    @IBAction func resetBtn(_ sender: UIButton) {
        
        topLabel.text = "시작"
        downLabel.text = "준비"
        
        answer = Int.random(in: 1...10)
    }
    
    
    @IBAction func selectBtn(_ sender: UIButton) {
        
        guard let myNumString = downLabel.text else {return}
        guard let myNumber = Int(myNumString) else {return}
        
        
            
//            if myChoice > answer {
//                topLabel.text = "Up"
//                downLabel.text = "틀림"
//            } else if myChoice < answer {
//                topLabel.text = "Down"
//                downLabel.text = "틀림"
//            } else {
//                topLabel.text = "Bingo"
//                downLabel.text = "정답!"
//
//            }
        if myNumber > answer {
            topLabel.text = "Up"
            downLabel.text = "틀림"
        } else if myNumber < answer {
            topLabel.text = "Down"
            downLabel.text = "틀림"
        } else {
            topLabel.text = "Bingo"
            downLabel.text = "정답!"
            
        }
        
    }
    
}

