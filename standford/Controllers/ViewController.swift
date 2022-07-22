//
//  ViewController.swift
//  standford
//
//  Created by Bekzod Qahhorov on 20/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    var buttons = [UIButton]()
    
    lazy var game =  Concentration(numberOfPairsOfCards: (buttons.count+1) /  2)
    var titles = ["🧟‍♀️", "🧟‍♀️","🤡","🦁","🤡","🦁"]
    var flipCount = 0 {
        didSet {
            mainView.flipCountLabel.text = "flips: \(flipCount)"
        }
    }
    private lazy var mainView: MainView = {
        var view = MainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubViews()
    }
    
    private func setupSubViews() {
        view.backgroundColor = .black
        view.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
        // append all ui buttons on array and create targets
        addTargetForAllButtons()
    }
    @objc private func buttonTapped(button: UIButton) {
        flipCount += 1
        if let cardIndex = buttons.firstIndex(of: button) {  // save index of tappedCard
            game.chooseCard(at: cardIndex)
            updateViewFromModule()
        } else {
            fatalError("card not found")
        }
    }
    private func updateViewFromModule() {
        for index in buttons.indices  {  // indices =>  0..<someArray.count
            let button = buttons[index]
            let card = game.cards[index]  // save one card also with index to match with burron
            if card.isFaceUp {
                button.setTitle(addEmoji(for : card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.9607841372, green: 0.9607844949, blue: 0.9693934321, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9607841372, green: 0.9607844949, blue: 0.9693934321, alpha: 0) :  #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
                button.layer.borderWidth = 0
            }
            
        }
    }
    var emojiChoces = ["🧟‍♀️", "🥹","😎","🦁","🤡","😡","🥷🏻","🧛🏽","🐱","👩🏻‍🚀"]
    var emoji = [Int: String]()
    
    private func addEmoji(for card: Card)-> String {
        if emoji[card.id] == nil, emojiChoces.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoces.count)))
            emoji[card.id] = emojiChoces.remove(at: randomIndex)
        }
        return emoji[card.id] ?? "?"
    }
    
    func addTargetForAllButtons() {
        //TODO: -  YO MUST CHANGE THIS  (can't do dynamic)
        mainView.buttonStack.arrangedSubviews.forEach { btn in
            guard let button = btn as? UIButton else {return}
            buttons.append(button)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        mainView.secondButtonStack.arrangedSubviews.forEach { btn in
            guard let button = btn as? UIButton else {return}
            buttons.append(button)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        mainView.thirdButtonStack.arrangedSubviews.forEach { btn in
            guard let button = btn as? UIButton else {return}
            buttons.append(button)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
    }
    
}

