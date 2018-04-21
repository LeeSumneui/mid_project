//
//  ViewController.swift
//  mid_project
//
//  Created by 이수민 on 2018. 4. 18..
//  Copyright © 2018년 이수민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var eggAndPasta: UISegmentedControl!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //let destVC = segue.destination as! EggPastaViewController
        //let destVC2 = segue.destination as! CustomViewController
        
        let indexNum = eggAndPasta.selectedSegmentIndex
        if segue.identifier == "EggAndPasta" {
            let destVC = segue.destination as! EggPastaViewController
            destVC.info = indexNum
            
            if indexNum == 0{
                destVC.title = "Egg Timer"
            }
            else{
                destVC.title = "Pasta Timer"
            }
        }
        else {
            let destVC2 = segue.destination as! CustomViewController
        }
       
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }



}

