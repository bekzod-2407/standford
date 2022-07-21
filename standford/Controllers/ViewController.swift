//
//  ViewController.swift
//  standford
//
//  Created by Bekzod Qahhorov on 20/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    var buttons = [UIButton]()
    
    lazy var game =  Concentration(numberOfPairsOfCards: buttons.count /  2)
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
        mainView.buttonStack.arrangedSubviews.forEach { btn in
            guard let button = btn as? UIButton else {return}
            buttons.append(button)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        
    }
    @objc private func buttonTapped(button: UIButton) {
        flipCount += 1
        if let cardIndex = buttons.firstIndex(of: button) {  // save index of tappedCard
            game.chooseCard(at: cardIndex)
           
        } else {
            fatalError("card not found")

        }
        
    private func updateViewFromModule() {
        
        for index in buttons.indices  {  // indices =>  0..<someArray.count
            let button = buttons[index]     // save one btn with index to match with card
            let card = game.cards[index]  // save one card also with index to match with burron
            
            if card.isFaceUp {
                if button.currentTitle == title {
                    button.setTitle("", for: .normal)
                    button.backgroundColor = .orange
                } else {
                    button.backgroundColor = .white
                    button.setTitle(title, for: .normal)
                }
            }
            }
            
        }
    }
}

