//
//  QuestionViewController.swift
//  quiz-meme
//
//  Created by Felipe Seolin Bento on 31/07/21.
//

import UIKit

class QuestionViewController: UIViewController {
    // MARK: - Properties
    var question: Question? = nil
    // MARK: - IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var questionImageView: UIView!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var optionButtonsVStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadReturnButton()
        self.loadQuestion()
        self.loadStyles()
    }
    
    private func loadReturnButton() {
        self.returnButton.setTitle("", for: .normal)
        self.returnButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        self.returnButton.tintColor = #colorLiteral(red: 0.4901960784, green: 0.7647058824, blue: 0.9176470588, alpha: 1)
    }
    
    private func loadStyles() {
        // QuestionLabel
        self.questionLabel.font = FontKit.roundedFont(ofSize: 16, weight: .medium)
        // Image and ImageView
        self.questionImageView.layer.cornerRadius = 10
        self.questionImage.layer.cornerRadius = 10
        // CategoryLabel
        self.categoryLabel.text = self.categoryLabel.text?.uppercased()
    }
    
    private func loadQuestion() {
        guard let question = self.question else { return }
        questionLabel.text = question.question
        self.questionImage.image = question.image
        
        let x = 20
        var y = 340
        for (index, option) in question.options.enumerated() {
            let action = UIAction() { action in
                option.action(option)
            }
            
            let optionLabel = UILabel(frame: CGRect(x: 30, y: -y, width: 200, height: 40))
            optionLabel.text = option.title
            optionLabel.textColor = .black
            optionLabel.font = FontKit.roundedFont(ofSize: 14, weight: .regular)
            
            let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
            let optionIndicadorLabel = UILabel(frame: CGRect(x: 10.5, y: 0, width: 50, height: 30))
            optionIndicadorLabel.text = alphabet[index].uppercased()
            optionIndicadorLabel.font = FontKit.roundedFont(ofSize: 14, weight: .bold)
            
            let optionIndicadorView = UIView(frame: CGRect(x: -10, y: -y + 5, width: 30, height: 30))
            optionIndicadorView.layer.cornerRadius = optionIndicadorView.frame.size.width / 2
            optionIndicadorView.clipsToBounds = true
            optionIndicadorView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.8980392157, blue: 0.3019607843, alpha: 1)
            optionIndicadorView.addSubview(optionIndicadorLabel)
            optionIndicadorView.isUserInteractionEnabled = false
            
            let viewFrame = CGRect(x: x, y: y, width: 270, height: 40)
            let buttonView = UIView(frame: viewFrame)
            buttonView.addSubview(optionIndicadorView)
            buttonView.addSubview(optionLabel)
            buttonView.isUserInteractionEnabled = false
            
            let button = ShadowButton(type: .custom, primaryAction: action)
            button.frame = viewFrame
            button.addSubview(buttonView)
            
            self.optionButtonsVStackView.addArrangedSubview(button)
            
            y += 60
        }
    }
    
    // MARK: - IBActions
    @IBAction func exitQuiz(_ sender: Any) {
        guard let viewControllers: [UIViewController] = self.navigationController?.viewControllers else { return }
        for viewController in viewControllers {
            if viewController is ViewController {
                self.navigationController!.popToViewController(viewController, animated: true)
            }
        }
    }
}
