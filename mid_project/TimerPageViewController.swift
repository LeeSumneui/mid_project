//
//  TimerPageViewController.swift
//  mid_project
//
//  Created by 이수민 on 2018. 4. 18..
//  Copyright © 2018년 이수민. All rights reserved.
//

import UIKit

class TimerPageViewController: UIViewController {

    @IBOutlet var minutes: UILabel!
    @IBOutlet var goToHome: UIButton!
    @IBOutlet var alarmImage: UIImageView!
    @IBOutlet var customLabel: UILabel!
    
    var info:Int? // 타이머 시간 받아오는 변수
    var name:String? // 타이머 이름 받아오는 변수(custom 할때만 쓰임)
    var timer:Timer? // 타이머 변수
    var second = 1 // 타이머 카운트

    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmImage.isHidden = true;   // 알람 이미지뷰 숨김
        
        // Do any additional setup after loading the view.
        if let data = info {
            // **테스트를 위해 분->초 로 변경함.
            // **n분으로 실행하고 싶다면
            // info = data*60
            self.startTimer() // 타이머 시작
            customLabel.text = String(data) + " min timer" // 몇분 타이머인지 나타냄
            
            // 이름 변수에 값이 있을 경우 (custom으로 알람 설정 한 경우)
            if let custom = name {
                customLabel.text = custom + " : " + String(data) + "min" // 타이머의 이름과 몇분짜리 타이머인지 나타냄
            }
        }
    }

    // 타이머 시작하는 함수
    func startTimer(){
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerPageViewController.update), userInfo: nil, repeats: true)
        minutes.text = "START Timer!!"
    }
    
    // timeInterval에서 지정한 숫자만큼 interval을 두고 실행되는 함수
    @objc func update(){
        second += 1 // 초 증가
        if(second >= info!){ // 받아온 타이머 시간과 비교한 후 시간이 경과하면 stopTimer함수 실행
            self.stopTimer()
        }
    }
    
    // 타이머 종료하는 함수
    func stopTimer(){
        self.timer?.invalidate() // 설정한 timer를 run loop에서 제거
        self.timer = nil // timer(optional)변수의 값 삭제
        alarmImage.isHidden = false // 알람 이미지뷰 나타냄
        minutes.text = "STOP Timer!!"
        goToHome.isHidden = false // 홈으로 가는 버튼 보여줌
    }
    
}
