//
//  ViewController.swift
//  rpsgame
//
//  Created by 김신협 on 2022/11/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
//    화면에 표시할 컴퓨터 변수
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))! // 기본이 optional
//    화면에 표시할 사용자 변수
    var myChoice: Rps = Rps.rock
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        1) 첫번째/두번째 이미지뷰에 준비(묵) 이미지를 띄어야함
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        
//        2) 첫번째/두번째 레이블에 "준비"라고 문자열을 띄어야함
        comChoiceLabel.text = "Ready"
        myChoiceLabel.text = "Ready"
        
        
        
    }


    @IBAction func rpsButtonTapped(_ sender: UIButton) {
//        입력한 값을 특정 변수에 저장
        
//        버튼의 타이틀을 가져옴!
        guard let title =  sender.currentTitle else {return}
        
        switch title {
        case "Paper":
            myChoice = Rps.paper
        case "Rock":
            myChoice = Rps.rock

        case "Scissors":
            myChoice = Rps.scissors

        default:
            print("????")
        }

        
        
        
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
//        1) 컴퓨터가 랜덤 선택한 것을 이미지뷰에 표시
//        2) 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        switch comChoice {
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "Rock"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "Scissors"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "Paper"
        }
        
        
//        3) 내가 랜덤 선택한 것을 이미지뷰에 표시
//        4) 내가 랜덤 선택한 것을 레이블에 표시
        switch myChoice {
        case Rps.rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "Rock"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "Scissors"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "Paper"
        }
        
        
//        입력한 값과 컴퓨터의 입력값과 비교
        if myChoice == comChoice {
            mainLabel.text = "Draw!"
        } else if comChoice == .rock  && myChoice ==  .paper{
            mainLabel.text = "Win!"
        } else if comChoice ==  .paper && myChoice == .scissors {
            mainLabel.text = "Win!"
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "Win!"
        } else {
            mainLabel.text = "Loose!"
        }
        
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
//        1) 컴퓨터가 다시 준비 이미지뷰에 표시
//        2) 컴퓨터가 다시 준비 레이블에 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
//        3) 내 선택 이미지뷰에도 준비이미지 표시
//        4) 내 선택 레이블에도 준비 문자열 표시
        comChoiceLabel.text = "Ready"
        myChoiceLabel.text = "Ready"
        
//        5) 메인 레이블 "선택하시오" 표시
        mainLabel.text = "선택하시오"
        
//        6) 컴퓨터가 다시 랜덤 가위/바위/보 선택하고 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        
    }
    
    
}

