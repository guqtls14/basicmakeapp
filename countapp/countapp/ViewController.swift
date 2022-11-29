//
//  ViewController.swift
//  countapp
//
//  Created by 김신협 on 2022/11/29.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    weak var timer: Timer?
    
//    mainLabel에 초가 줄떄마다 표시할 변수
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configuteUI()
    }
    func configuteUI() {
        mainLabel.text = "초를 선택하시오"
//        center slider point
        slider.value = 0.5
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
//        슬라이더의 벨류값을 가지고 메인레이블의 텍스트를 세팅
        let seconds = Int(slider.value * 60) // 0.0~1.0
        
        
        mainLabel.text = "\(seconds)초"
        
        number = seconds
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
//        1초씩 지나갈때마다 무언가를 실행
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in // weak self여도됨
//            원래 클로저에서 self를 붙이는게 정석이지만, 너무 불편하므로 [self] 를 해주면 self안해도됨(만약 [self]없다면 self무조건 해야함
            
            // do something here
//            반복하고 싶은 코드
            if number > 0 { // [self]가 적혀있으므로 self안써도됨
                number -= 1 // optional끼리는 연산이안되므로 이렇게 써야함
                //            레이블 표시도 다시 해야함
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number) 초"
                
                //             슬라이더 줄여야함
                
            } else {
//            number = 0 이면 소리나게함
                number = 0
                mainLabel.text = "초를 선택하세요"
                
//                 소리를 나게 해야함
                timer?.invalidate()
                AudioServicesPlayAlertSound(SystemSoundID(1322))

            }
            
//          Timer: https://stackoverflow.com/questions/25951980/do-something-every-x-minutes-in-swift
//          system sound: https://stackoverflow.com/questions/31126124/using-existing-system-sounds-in-ios-app-swift
            
        }
    }
    
    

    @IBAction func resetButtonTapped(_ sender: UIButton) {
//        초기화 세팅
        mainLabel.text = "초를 선택하시오"
        slider.value = 0.5
        number = 0
        timer?.invalidate()
        //        center slider point
//        slider.setValue(0.5, animated: true)
    }
    
}

