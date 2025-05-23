import UIKit

class ViewController: UIViewController {
    private let flashcardLabel = UILabel()
    private var showingQuestion = true
    private let flashcard = Flashcard(question: "What is the capital of France?", answer: "Paris")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        flashcardLabel.frame = CGRect(x: 40, y: 200, width: view.frame.width - 80, height: 200)
        flashcardLabel.textAlignment = .center
        flashcardLabel.font = UIFont.systemFont(ofSize: 24)
        flashcardLabel.numberOfLines = 0
        flashcardLabel.text = flashcard.question
        view.addSubview(flashcardLabel)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(flipCard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func flipCard() {
        UIView.transition(with: flashcardLabel, duration: 0.5, options: .transitionFlipFromRight, animations: {
            self.showingQuestion.toggle()
            self.flashcardLabel.text = self.showingQuestion ? self.flashcard.question : self.flashcard.answer
        }, completion: nil)
    }
}