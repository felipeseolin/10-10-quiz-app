//
//  QuizFinishedViewController.swift
//  quiz-meme
//
//  Created by Felipe Seolin Bento on 01/08/21.
//

import UIKit

class QuizFinishedViewController: UIViewController {
    var category: String = ""
    var numberCorrectAnswers = 0

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var numberCorrectAnswersLabel: UILabel!
    @IBOutlet weak var totalQuestionsLabel: UILabel!
    @IBOutlet weak var finalImage: UIImageView!
    @IBOutlet weak var primaryButton: UIButton!
    @IBOutlet weak var endQuizButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadWinOrLost()
        self.loadStyles()
    }
    
    private func loadWinOrLost() {
        numberCorrectAnswersLabel.text = "\(numberCorrectAnswers)"
        if self.numberCorrectAnswers == 10 {
            numberCorrectAnswersLabel.textColor = #colorLiteral(red: 0.4705882353, green: 0.7450980392, blue: 0.5882352941, alpha: 1)
            totalQuestionsLabel.textColor = #colorLiteral(red: 0.4705882353, green: 0.7450980392, blue: 0.5882352941, alpha: 1)
            finalImage.image = #imageLiteral(resourceName: "yeah")
        } else {
            numberCorrectAnswersLabel.textColor = #colorLiteral(red: 0.8784313725, green: 0.3921568627, blue: 0.4666666667, alpha: 1)
            totalQuestionsLabel.textColor = #colorLiteral(red: 0.8784313725, green: 0.3921568627, blue: 0.4666666667, alpha: 1)
            finalImage.image = #imageLiteral(resourceName: "ohNo")
        }
    }
    
    private func loadStyles() {
        categoryLabel.text = categoryLabel.text?.uppercased()
        numberCorrectAnswersLabel.font = FontKit.roundedFont(ofSize: 82, weight: .medium)
        totalQuestionsLabel.font = FontKit.roundedFont(ofSize: 36, weight: .regular)
        
        endQuizButton.setTitle("", for: .normal)
        endQuizButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        primaryButton.layer.cornerRadius = 10
    }
    
    @IBAction func exitQuiz(_ sender: Any) {
        guard let viewControllers: [UIViewController] = self.navigationController?.viewControllers else { return }
        for viewController in viewControllers {
            if viewController is ViewController {
                self.navigationController!.popToViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func returnToStartScreen(_ sender: Any) {
        guard let viewControllers: [UIViewController] = self.navigationController?.viewControllers else { return }
        for viewController in viewControllers {
            if viewController is ViewController {
                self.navigationController!.popToViewController(viewController, animated: true)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
