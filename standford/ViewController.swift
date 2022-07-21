//
//  ViewController.swift
//  standford
//
//  Created by Bekzod Qahhorov on 20/07/22.
//

import UIKit

class ViewController: UIViewController {
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
        mainView.buttonStack.arrangedSubviews.forEach { btn in
            guard let button = btn as? UIButton else {return}
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
       
    }
    @objc private func buttonTapped(button: UIButton) {
     flipCount += 1
     flipCard(withTitle: titles[button.tag], on: button)
    }
    
    private func flipCard(withTitle title: String , on button: UIButton) {
        
        if button.currentTitle == title {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.backgroundColor = .white 
            button.setTitle(title, for: .normal)
        }
    }
    
    
    
    
//    let titlesIndex = titles.enumerated().forEach{ index, btn in
//         for title in titles {
//             let itemIndex = titles.firstIndex(where: {$0 ==  btn})
//             button.setTitle(titles[itemIndex!], for: .normal)
//             print(itemIndex)
//         }
//     }
}

