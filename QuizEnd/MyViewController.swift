//
//  MyViewController.swift
//  QuizEnd
//
//  Created by ihlas on 9.12.2021.
//

import UIKit

class MyViewController: UIViewController {
    
var noCorrect = 0
    var total = 0
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet var lblResults: UILabel!
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblResults.text = "You got \(noCorrect) out of\(total) correct"
        var percentRight = Double(noCorrect) / Double(total)
        percentRight *= 100
        var title = ""
        if (percentRight <  40 ) {
            title = "Not Good"
        }else if(percentRight < 70) {
            title = "Almost"
        }else{
            title = "Good"
        }
        lblTitle.text = title
    }
    


}
