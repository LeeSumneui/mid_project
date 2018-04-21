//
//  CustomViewController.swift
//  mid_project
//
//  Created by 이수민 on 2018. 4. 19..
//  Copyright © 2018년 이수민. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
  
    
    @IBOutlet var minutePicker: UIPickerView!
    @IBOutlet var alarmName: UITextField!
    
    var time:Int! // 설정 시간(분)
    var name:String? // 타이머 이름
    var minRange:Int = 12 // picker view에서 선택할 수 있는 시간(분)개수
    
    // <pickerView에서 보여주는 문자열 + 해당하는 시간>을 조합한 tuple 타입 선언
    typealias minutes = (timeID:String, time:Int)
    //tuple 변수 선언
    var pickerList:[minutes] = []

    // component 개수 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // row 개수 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // tuple 변수에 값 지정
        // ***for 문으로 값을 넣어야 편한데 함수 안에서 for문을 사용해야 돼서 여기에서 했습니다.
        for i in 0...11 {
            pickerList.append((String((i+1)*5)+" min", (i+1)*5))
        }
        return minRange
    }
    
    // row별 title 지정
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerList[row].timeID
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        minutePicker.selectRow(5, inComponent: 0, animated: true) // 초기 pickerView의 select상태를 가운데 값으로 설정
    }
    
    // 키보드가 사라지도록 하는 함수
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder() // firstResoponder를 해제
        name = textField.text // 이름 변수에 값을 넣어줌
        return true
    }
    
    // button Action 함수
    @IBAction func getValue() { // : 역할 알람페이지에 보내줄 이름과 시간 설정
        if let textField = name { // textField에 내용이 있는 경우
        }
        else { // textField에 내용이 없는 경우 디폴트 값으로 설정
            name = "Custom Alarm"
        }
        
        // pickerView에서 선택된 row 인덱스 저장
        let index = self.minutePicker.selectedRow(inComponent: 0)
        // tuple 변수를 이용해 인덱스에 해당하는 시간 값을 변수에 저장
        time = pickerList[index].time
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destVC = segue.destination as! TimerPageViewController
        destVC.info = time
        destVC.name = self.name
        destVC.title = "Custom Alarm"
    }
    
   
}
