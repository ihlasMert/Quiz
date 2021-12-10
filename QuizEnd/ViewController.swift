
import UIKit

class ViewController: UIViewController {
    
    
    
    struct Question{
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    var questions:[Question] =
    [
        Question(question: "The Capital of İran is: ", answers: ["yazd","Qum","Tahran","Turkmensahra"], correctAnswer: 2),
 Question(question: "The Capital of Turkey is: ", answers: ["Antalya","Ankara","İstanbul","Turkmensahra"], correctAnswer: 1),
Question(question: "The Capital of Russia is: ", answers: ["Moscow","Sochi","Berlin","Turkmensahra"], correctAnswer: 0),
        Question(question: "The Capital of Norwey is: ", answers: ["Oslo","Stravanger","Amsterdam","Balkanabat"], correctAnswer: 0),
        Question(question: "The Capital of Finland is: ", answers: ["Ashgabat","Gollen","Helsinki", "Prag"], correctAnswer: 2),
        Question(question: "The Capital of Sweden is: ", answers: ["Stokholm", "Malmö","Helsinki", "Varshav"], correctAnswer: 0),
        Question(question: "The Capital of China is: ", answers: ["Ashgabat","Pekin","Helsinki", "Prag"], correctAnswer: 1),
        Question(question: "The Capital of Afghanistan is: ", answers: ["Kabul","Meshed","Handegar", "Tahran"], correctAnswer: 0),
    
    ]
    
    
    @IBOutlet weak var ibQuestion: UITextView!
    
    @IBOutlet weak var lblProgress: UILabel!
    
  var currentQuestion: Question?
  var currentQuestionPos = 0
  var noCorrect = 0
    
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    
    
    
    @IBAction func choice1(_ sender: UIButton) {
        checkAnswer(idx: 0)
    }
   
    
    @IBAction func choice2(_ sender: UIButton) {
        checkAnswer(idx: 1)
    }
   
    @IBAction func choice3(_ sender: UIButton) {
        checkAnswer(idx: 2)
    }
  
    
    @IBAction func choice4(_ sender: UIButton) {
        checkAnswer(idx: 3)
    }

    func checkAnswer(idx: Int){
        if (idx == currentQuestion!.correctAnswer)
        {
            noCorrect += 1
            loadNextQuestion()
    }
   
}
func loadNextQuestion(){
    if (currentQuestionPos + 1 < questions.count)
    {
        currentQuestionPos += 1
        currentQuestion = questions[currentQuestionPos]
        setQuestion()
    }else{
        performSegue(withIdentifier: "ShowResults", sender: nil)
   
    }

}

    func setQuestion(){
        ibQuestion.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        lblProgress.text = "\(currentQuestionPos + 1) / \(questions.count)"
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ShowResults"){
            var vc = segue.destination as! MyViewController
            vc.noCorrect = noCorrect
            vc.total = questions.count
    }
        
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        currentQuestion = questions[0]
        setQuestion()
        
        
        
        
        
    }

override func didReceiveMemoryWarning(){
    super.didReceiveMemoryWarning()
}
}


