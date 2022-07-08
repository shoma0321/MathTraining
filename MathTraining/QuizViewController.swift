//
//  QuizViewController.swift
//  MathTraining
//
//  Created by 伊藤 奨真 on 2022/07/03.
//

import UIKit

class QuizViewController: UIViewController {
    
    let total = 10//問題数
    var correct = 0 //正解数
    var questionIndex = 0 //問題の番号
    var answerIndex = 0 //正解の番号
    
    @IBOutlet weak var leftNumberLabel: UILabel!
    @IBOutlet weak var centerNumberLabel: UILabel!
    @IBOutlet weak var rightNumberLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setQuestions()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? ResultViewController {
            resultVC.result = Double(correct) / Double(total) * 100.0
        }
    }
    
    @IBAction func tapped(sender: UIButton) {
        if sender.tag - 1 == answerIndex {
            correct += 1
        }
        
        questionIndex += 1
        if questionIndex >= total {
            performSegue(withIdentifier: "QuizToResult", sender: nil)
        }else{
            setQuestions()
        }
    }
    

    func setQuestions() {
        let leftNum = Int(arc4random_uniform(10)) //左の数を0〜9までの数を乱数表示
        var centerNum = Int(arc4random_uniform(10)) //中央の数を0〜9までの数を乱数表示
        
        answerIndex = Int(arc4random_uniform(4))//0〜3までの四通りが入る
        
        switch answerIndex {
        case 0:
            rightNumberLabel.text = "\(leftNum + centerNum)"
        
        case 1:
            rightNumberLabel.text = "\(leftNum - centerNum)"
        
        case 2:
            rightNumberLabel.text = "\(leftNum * centerNum)"
        
        default:
            if centerNum == 0{
                centerNum = 1
            }
            rightNumberLabel.text = "\(leftNum / centerNum)"
        }
        leftNumberLabel.text = "\(leftNum)"
        centerNumberLabel.text = "\(centerNum)"
    }
    

}
