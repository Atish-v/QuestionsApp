//
//  ViewController.swift
//  Grocery Challenge
//
//  Created by Andrew Crookston on 5/14/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let api = ChallengeAPI()
        for view in stackView.arrangedSubviews {
            stackView.removeArrangedSubview(view)
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        api.allQuestionsAsync { (results) in
            switch results {
            case let .success(questions):
                for question in questions {
                    let queryView = QueryView(question: question)
                    self.stackView.addArrangedSubview(queryView)
                    let separator = UIView()
                    separator.backgroundColor = .black
                    separator.translatesAutoresizingMaskIntoConstraints = false
                    self.stackView.addArrangedSubview(separator)
                    separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
                    separator.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.80).isActive = true

                }
            case let .error(error):
                print(error)
            }
        }
    }
}
