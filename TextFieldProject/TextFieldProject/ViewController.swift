//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 김신협 on 2022/12/03.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self // ViewController를 대리자로설정
        // Do any additional setup after loading the view.
        setup()
    }
    func setup() {
        view.backgroundColor = UIColor.yellow
        
        textField.borderStyle = .bezel
        textField.keyboardType = UIKeyboardType.namePhonePad
        textField.placeholder = "안녕하세요!"
        textField.clearButtonMode = .always
        textField.returnKeyType = .search
        
        
//      응답객체가 됨, 처음화면에 들어가면 키보드가 올라가는것이 기능임
        textField.becomeFirstResponder()
    }
    
//    화면클릭시 키보드 내려감, 화면의 탭을 감지하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
//        textField.resignFirstResponder()
    }
    
    
//    텍스트필드의 입력을 시작할때 호출(시작할지 말지의 여부 허락하는것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function) // #function하면 함수이름 출력
        return true
    }
    
//    시점(텍스트필드 입력된 시점)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function) // #function하면 함수이름 출력
        print("유저가 텍스트필드의 입력을 시작함!")
    }
    
//    어떤 조건이 되면 없애지않음
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function) // #function하면 함수이름 출력
        return true
    }
    
//  텍스트필드 글자 내용이 (한글자 한글자) 입력되거나 지워질때 호출이 되고 (허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(#function) // #function하면 함수이름 출력
//        print(string)
//        return true
        
//        10글자 제한
//        let maxLength = 10
//        let currentString: NSString = (textField.text ?? "") as NSString
//        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
//        return newString.length <= maxLength
        
//        입력되고 있는 글자가 "숫자"인 경우 입력을 허용하지 않는 논리
        if Int(string) != nil {
            return false
        } else {
//            10글자이상 입력되는 것을 막는 코드
            guard let text = textField.text else {return true}
            
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
    }
    
//    텍스트필드의 엔터키가 눌러지면 다음 동작을 허락할것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function) // #function하면 함수이름 출력
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            
            return true
        }
        
    }
    
//  텍스트필드의 입력이 끝날때 호출 (끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function) // #function하면 함수이름 출력
        return true
    }
    
//    텍스트필드의 입력이 실제 끝났을때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function) // #function하면 함수이름 출력
        print("유저가 텍스트필드의 입력을 끝냈다")
        
        textField.text = ""
    }
    
    
    @IBAction func doneBtnTapped(_ sender: UIButton) {
//        키보드 내려감
        textField.resignFirstResponder()
    }
    
}

