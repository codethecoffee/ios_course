import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var ans1Button: UIButton!
    @IBOutlet weak var ans2Button: UIButton!
    @IBOutlet weak var ans3Button: UIButton!
    
    // Struct that handles all of the quiz logic
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"

        let answers = quizBrain.getAnswers()
        ans1Button.titleLabel?.text = answers[0]
        ans2Button.titleLabel?.text = answers[1]
        ans3Button.titleLabel?.text = answers[2]


        
        
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)
        
        if userGotItRight {
            print("Correct answer!")
            sender.backgroundColor = UIColor.green
        }
        else {
            print("Incorrect answer")
            sender.backgroundColor = UIColor.red
        }
        
        // Delay the transition to next question by 0.2 seconds
        // No need to store this instance, since it runs once and we don't need to invalidate it
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        // Progress to the next question
        quizBrain.nextQuestion()

    }
    
    /**
     Function that updates the UI before we transition to the next question.
     */
    @objc func updateUI() {
        questionText.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        // Remove color styling from all three answer buttons
        ans1Button.backgroundColor = UIColor.clear
        ans2Button.backgroundColor = UIColor.clear
        ans3Button.backgroundColor = UIColor.clear

    }


}

