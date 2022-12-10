//
//  ViewController.swift
//  LoginProject
//
//  Created by 김신협 on 2022/12/08.
//

import UIKit

class ViewController: UIViewController {

    let emailTextFieldView = UIView() // 메모리에 올리는 코드
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        makeUI()
    }
    
    func makeUI() {
        emailTextFieldView.backgroundColor = UIColor.brown
        
//        모서리 둥글게
        emailTextFieldView.layer.cornerRadius = 10
        emailTextFieldView.layer.masksToBounds = true
        
        
        view.addSubview(emailTextFieldView) // 기본 view안에 하위 view안에 넣어야 화면에 나옴, 근데 이 상태는 올려놓은 상태이므로 오토레이아웃까지 잡아야함
        
        
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false // 밑에거만 있으면 안되고 이게 있어야 실행이됨(자동으로 프레임이 되는데 이걸 반드시 설정해야 밑에처럼 수동으로 코드를 작성하는식으로 작성하면 이걸해야함
        
        //        오톨레이아웃
        
        emailTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true // 높이로 잡음, 기준이없음
        
        emailTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    
        // equleTo 는 어디를 기준으로 쓸건지 정함,view.leadingAnchor는 기본 view의 앞쪽으로 30띄어서 맞춘다는 의미
        emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true // 정확한건아니지만 왼쪽에서 얼마를 띄울건지 의미
        emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true // 정확한건아니지만 오른쪽에서 얼마를 띄울건지 의미
        
        
    }

    
    
    

}

