//
//  ViewController.swift
//  quiz-meme
//
//  Created by Felipe Seolin Bento on 31/07/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var quizzes: [Quiz] = []
    var questions: [Question] = []
    var currentQuestion = 0
    var highestScore = 0
    
    @IBOutlet weak var quizTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.quizTable.dataSource = self
        self.quizTable.delegate = self
        
        self.loadQuizzes()
        self.loadQuestions()
    }
    
    private func loadQuizzes() {
        self.quizzes = [
            Quiz(name: "Badalados", level: .easy, complete: 10),
            Quiz(name: "Clássicos BR", level: .medium, complete: self.highestScore),
            Quiz(name: "Memes do Orkut", level: .hard),
            Quiz(name: "Confins do Youtube", level: .superHard),
        ]
    }
    
    private func loadQuestions() {
        questions = [
            .init(question: "Complete a música do Nissim Ourfali:\nEm casa é só videogame..", image: #imageLiteral(resourceName: "nissim"), options: [
                Option(title: "PC e TV", action: self.nextQuestion, isCorrect: true),
                Option(title: "e muita diversão", action: self.nextQuestion),
                Option(title: "filmes e séries", action: self.nextQuestion),
                Option(title: "e mais nada", action: self.nextQuestion),
            ]),
            .init(question: "O que aconteceu com este repórter?", image: #imageLiteral(resourceName: "reporterUva"), options: [
                Option(title: "Encontrou uma lagarta", action: self.nextQuestion),
                Option(title: "Comeu uma uva estragada", action: self.nextQuestion),
                Option(title: "Tomou um choque", action: self.nextQuestion, isCorrect: true),
                Option(title: "Foi picado por uma aranha", action: self.nextQuestion),
            ]),
            .init(question: "Qual o nome dessa nutricionista conhecida pelo \"sanduíche iche\"?", image: #imageLiteral(resourceName: "ruthLemos"), options: [
                Option(title: "Fernanda Lima", action: self.nextQuestion),
                Option(title: "Tarcila do Amaral", action: self.nextQuestion),
                Option(title: "Ruth Lemos", action: self.nextQuestion, isCorrect: true),
                Option(title: "Vânia Fernandes", action: self.nextQuestion),
            ]),
            .init(question: "O que o Pedro costuma comer na universidade?", image: #imageLiteral(resourceName: "paoDeBatata"), options: [
                Option(title: "Empada", action: self.nextQuestion),
                Option(title: "Pão de batata", action: self.nextQuestion, isCorrect: true),
                Option(title: "Pão de queijo", action: self.nextQuestion),
                Option(title: "Coxinha", action: self.nextQuestion),
            ]),
            .init(question: "Quem é esse famoso com o Rei do camarote?", image: #imageLiteral(resourceName: "reiDoCamarote"), options: [
                Option(title: "Eduardo Sterblitch", action: self.nextQuestion, isCorrect: true),
                Option(title: "Luan Santana", action: self.nextQuestion),
                Option(title: "Chay Suede", action: self.nextQuestion),
                Option(title: "Gusttavo Lima", action: self.nextQuestion),
            ]),
            .init(question: "Como esse menino estava?", image: #imageLiteral(resourceName: "cagadoDeFome"), options: [
                Option(title: "Se divertindo", action: self.nextQuestion),
                Option(title: "Cansado da feira", action: self.nextQuestion),
                Option(title: "Cagado de fome", action: self.nextQuestion, isCorrect: true),
                Option(title: "Caindo de sono", action: self.nextQuestion),
            ]),
            .init(question: "Quantos filhos a grávida de Taubaté fingiu estar \"esperando\"?", image: #imageLiteral(resourceName: "gravidaTaubate"), options: [
                Option(title: "4", action: self.nextQuestion, isCorrect: true),
                Option(title: "6", action: self.nextQuestion),
                Option(title: "3", action: self.nextQuestion),
                Option(title: "5", action: self.nextQuestion),
            ]),
            .init(question: "Quais as impressões dessa menina sobre a visita no setor agropecuário?", image: #imageLiteral(resourceName: "bemLouco"), options: [
                Option(title: "Bem louco", action: self.nextQuestion),
                Option(title: "Empolgante", action: self.nextQuestion),
                Option(title: "Tem bastante vaca grande", action: self.nextQuestion),
                Option(title: "Todas as opções", action: self.nextQuestion, isCorrect: true),
            ]),
            .init(question: "O que a mulher queria do Pedro?", image: #imageLiteral(resourceName: "pedroChip"), options: [
                Option(title: "O Chip", action: self.nextQuestion, isCorrect: true),
                Option(title: "A carteira", action: self.nextQuestion),
                Option(title: "Um abraço", action: self.nextQuestion),
                Option(title: "Uma chave", action: self.nextQuestion),
            ]),
            .init(question: "O jardineiro é Jesus e...", image: #imageLiteral(resourceName: "jardineiroJesus"), options: [
                Option(title: "As árvores somos nozes", action: self.nextQuestion),
                Option(title: "As árviris somo nós", action: self.nextQuestion),
                Option(title: "Todas as opções", action: self.nextQuestion, isCorrect: true),
                Option(title: "As árvoreze somo nós", action: self.nextQuestion),
            ]),
        ]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizCell", for: indexPath) as! QuizTableViewCell
        let quiz = self.quizzes[indexPath.row]
        
        cell.title.text = quiz.name.uppercased()
        cell.total.text = "\(quiz.complete)/10"
        switch quiz.level {
        case .easy:
            cell.level.text = "Fácil"
            cell.cellView.layer.backgroundColor = #colorLiteral(red: 0.4705882353, green: 0.7450980392, blue: 0.5882352941, alpha: 1)
            cell.memeImage.image = #imageLiteral(resourceName: "easy")
        case .medium:
            cell.level.text = "Intermediário"
            cell.cellView.layer.backgroundColor = #colorLiteral(red: 0.4901960784, green: 0.7647058824, blue: 0.9176470588, alpha: 1)
            cell.memeImage.image = #imageLiteral(resourceName: "medium")
        case .hard:
            cell.level.text = "Difícil"
            cell.cellView.layer.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.8980392157, blue: 0.3019607843, alpha: 1)
            cell.memeImage.image = #imageLiteral(resourceName: "hard")
        default:
            cell.level.text = "Para mestres"
            cell.cellView.layer.backgroundColor = #colorLiteral(red: 0.8784313725, green: 0.3921568627, blue: 0.4666666667, alpha: 1)
            cell.memeImage.image = #imageLiteral(resourceName: "superHard")
        }
        
        cell.cellView.layer.cornerRadius = 10
        cell.title.font = FontKit.roundedFont(ofSize: 20, weight: .medium)
        cell.level.font = FontKit.roundedFont(ofSize: 12, weight: .regular)
        cell.total.font = FontKit.roundedFont(ofSize: 12, weight: .regular)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.startQuiz()
    }
    
    func startQuiz() {
        let questionController = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
        questionController.question = questions[self.currentQuestion]
        navigationController?.pushViewController(questionController, animated: true)
    }
    
    func nextQuestion(option: Option) {
        self.currentQuestion += 1
        if option.isCorrect && self.currentQuestion < questions.count {
            let questionController = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
            questionController.question = questions[self.currentQuestion]
            navigationController?.pushViewController(questionController, animated: false)
            return
        }
        
        let score: Int = option.isCorrect ? self.currentQuestion : self.currentQuestion - 1
        let questionFinishedController = QuizFinishedViewController(nibName: "QuizFinishedViewController", bundle: nil)
        questionFinishedController.numberCorrectAnswers = score
        
        if self.highestScore < score {
            self.highestScore = score
        }
        self.currentQuestion = 0
        navigationController?.pushViewController(questionFinishedController, animated: false)
    }
}

