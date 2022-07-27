//
//  MainView.swift
//  standford
//
//  Created by Bekzod Qahhorov on 20/07/22.
//

import UIKit

class MainView: UIView {
    lazy var mainStackView: UIStackView = {
       var view = UIStackView(arrangedSubviews: [
          buttonStack,
          secondButtonStack,
          thirdButtonStack,
       ])
       view.translatesAutoresizingMaskIntoConstraints = false
       view.distribution = .fillEqually
       view.spacing = 15
       view.axis = .vertical
       return view
   }()
     lazy var buttonStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [
            createButton(withTitle:"", withTag: 0),
            createButton(withTitle:"", withTag: 1),
            createButton(withTitle:"", withTag: 2),
            createButton(withTitle:"", withTag: 3),
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.spacing = 15
        view.axis = .horizontal
        return view
    }()
    lazy var secondButtonStack: UIStackView = {
       var view = UIStackView(arrangedSubviews: [
           createButton(withTitle:"", withTag: 4),
           createButton(withTitle:"", withTag: 5),
           createButton(withTitle:"", withTag: 6),
           createButton(withTitle:"", withTag: 7),
       ])
       view.translatesAutoresizingMaskIntoConstraints = false
       view.distribution = .fillEqually
       view.spacing = 15
        view.axis = .horizontal
       return view
   }()
    lazy var thirdButtonStack: UIStackView = {
       var view = UIStackView(arrangedSubviews: [
           createButton(withTitle:"", withTag: 8),
           createButton(withTitle:"", withTag: 9),
           createButton(withTitle:"", withTag: 10),
           createButton(withTitle:"", withTag: 11),
       ])
       view.translatesAutoresizingMaskIntoConstraints = false
       view.distribution = .fillEqually
       view.spacing = 15
       view.axis = .horizontal
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
            view.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            view.titleLabel?.textColor = .black
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
        self.addSubview(mainStackView)
        self.addSubview(flipCountLabel)
        let verticalSpace = NSLayoutConstraint(item: self.mainStackView, attribute: .bottom, relatedBy: .equal, toItem: self.flipCountLabel, attribute: .bottom, multiplier: 0.5, constant: 70)
        
        NSLayoutConstraint.activate([
            verticalSpace,
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor,constant: 50),
            mainStackView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 50),
            mainStackView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -30),
//            buttonStack.arrangedSubviews[0].heightAnchor.constraint(equalToConstant: 100),
            
            
            flipCountLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20),
            flipCountLabel.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -20),
            flipCountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -25),
        ])
    }
}

