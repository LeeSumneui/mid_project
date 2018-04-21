//
//  EggPastaViewController.swift
//  mid_project
//
//  Created by 이수민 on 2018. 4. 18..
//  Copyright © 2018년 이수민. All rights reserved.
//

import UIKit

class EggPastaViewController: UIViewController {
    
    @IBOutlet var timerName: UILabel!
    @IBOutlet var explain: UILabel!
    @IBOutlet var foodImage: UIImageView!
    
    // 이미지 정의
    // Egg
    let eggImage = UIImage(named:"egg.jpg")
    let image5min = UIImage(named:"5min.png")
    let image8min = UIImage(named:"8min.png")
    let image10min = UIImage(named:"10min.png")
    let image14min = UIImage(named:"14min.png")
    // Pasta
    let pastaImage = UIImage(named:"pasta.jpg")
    let aldente = UIImage(named:"aldente.jpg")
    let cottura = UIImage(named:"cottura.jpg")
    let bencotto = UIImage(named:"bencotto.jpg")
    
    // 변수 정의
    var info:Int?
    var timeSet:Int = 0 // 타이머 시간 지정 변수 (이 프로젝트에서는 초 단위로 간소화 함)
    var foodStatus:Int = 0 // 삶은 단계를 나타내는 변수. (0으로 세팅)
    var max:Int! // 삶은 단계 개수 지정 변수
    
    // 각 삶은 단계에 맞는 시간(분)과, 이미지를 지정해줄 tuple타입 생성
    typealias statusAndTime = (time:Int, image:UIImage)
    
    // tuple 변수 선언
    var statAndTime:[statusAndTime] = []
    
    // pasta 타이머에서 필요한 각 이미지에 대한 설명
    let explainString:[String] = ["al dente : 단단한 식감","cottura : 대중적인 식감","bencotto : 퍼진 식감"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 앞 뷰에서 선택한 정보를 통해, 사용할 timer 속성을 지정
        if let data = info {
            explain.isHidden = true // explain 라벨 숨김

            if data == 0{ // Egg
                timerName.text = " Egg Timer " // 타이틀 문자열 지정
                foodImage.image = eggImage // 기본 세팅 이미지 지정
                max = 3 // 단계 개수 지정
                
                // egg에 맞는 tuple 변수 생성
                let EggSAT:[statusAndTime] = [(5,image5min!),(8,image8min!),(10,image10min!),(14,image14min!)]
                statAndTime = EggSAT // 전역변수에 복사
            }
            else { // Pasta
                timerName.text = " Pasta Timer "
                foodImage.image = pastaImage
                max = 2
                let PastSAT:[statusAndTime] = [(7,aldente!),(10,cottura!),(12,bencotto!)]
                statAndTime = PastSAT
            }
        }
    }
  
    // 단계 이동 버튼 (+,-)의 Action 함수 정의
    @IBAction func plusMinus(_ sender: UIButton) { // 역할 : foodStatus 값 변경
        
        // (-)버튼을 눌렀을 때
        if sender.titleLabel?.text == "-" {
            if foodStatus > 0 { foodStatus -= 1 } // 현재 setting 되어있는 삶은 단계가 0보다 크면 1만큼 감소
            else { foodStatus = 0 } // 0 이하인 경우 0으로 고정
        }
        
        // (+)버튼을 눌렀을 때
        if sender.titleLabel?.text == "+" {
            if foodStatus < max { foodStatus += 1 } // 현재 setting 되어있는 삶은 단계가 max보다 작으면 1만큼 증가
            else { foodStatus = max } // max보다 크면 max값으로 고정
        }
        
        // 이미지 뷰에 출력할 이미지 지정
        foodImage.image = statAndTime[foodStatus].image

        // explain 라벨
        if info! == 0 { // egg 인 경우
            explain.isHidden = true
        }
        else { // pasta인 경우
            explain.text = explainString[foodStatus]
            explain.isHidden = false
        }
       
    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destVC = segue.destination as! TimerPageViewController
        
//        if segue.identifier == "AlarmPage" { // 작동된 segue의 indentifier가 AlarmPage 일 때
        
           destVC.info = statAndTime[foodStatus].time 
            if self.info == 0 {
                destVC.title = "Egg Alarm"
            }
            else {
                destVC.title = "Pasta Alarm"
            }
//        }
                
    }
}
