//
//  MainView.swift
//  standford
//
//  Created by Bekzod Qahhorov on 20/07/22.
//

import UIKit

class MainView: UIView {
    var titles = ["🌏", "🧟‍♀️","😆","🦁","🤡"]
    // just 4 button's with titles
     lazy var buttonStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [
            createButton(withTitle:"", withTag: 0),
            createButton(withTitle:"", withTag: 1),
            createButton(withTitle:"", withTag: 2),
            createButton(withTitle:"", withTag: 3),
//            createButton(withTitle:"", withTag: 4),
//            createButton(withTitle:"", withTag: 5)
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.spacing = 10
        return view
    }()
     lazy var flipCountLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "flips: 0"
        view.font = .monospacedSystemFont(ofSize: 46, weight: .bold)
        view.textColor = .systemGray6
        view.textAlignment = .center
        return view
    }()
    
    func createButton(withTitle title: String ,withTag tag: Int) -> UIButton {
        lazy var cardButton: UIButton = {
            let view = UIButton()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.titleLabel?.font =  .monospacedSystemFont(ofSize: 40, weight: .bold)
            view.backgroundColor = .orange
            view.contentMode = .center
            view.setTitle(title, for: .normal)
            view.layer.borderWidth = 3
            view.layer.borderColor = .init(red: 250, green: 50, blue: 240, alpha: 1)
            view.tag = tag
            return view
        }()
        return cardButton
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        self.addSubview(buttonStack)
        self.addSubview(flipCountLabel)
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: self.topAnchor,constant: 30),
            buttonStack.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 30),
            buttonStack.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -30),
            buttonStack.arrangedSubviews[0].heightAnchor.constraint(equalToConstant: 120),
            flipCountLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20),
            flipCountLabel.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -20),
            flipCountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -25),
        ])
    }
}

