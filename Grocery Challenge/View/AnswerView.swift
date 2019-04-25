//
//  AnswerView.swift
//  Grocery Challenge
//
//  Created by Atish on 4/24/19.
//  Copyright © 2019 Instacart. All rights reserved.
//

import UIKit

class AnswerView: UIView {
    var firstStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        
        stack.spacing = 30
        return stack
    }()
    
    var secondStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 30

        return stack
    }()
    
    var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .top
        stack.spacing = 30
        return stack
    }()
    
    let contentMargins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)

    
    init(answers: [Answer]) {
        super.init(frame: .zero)
        addSubview(verticalStack)
        NSLayoutConstraint.activate([
            verticalStack.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: contentMargins.left
            ),
            verticalStack.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -contentMargins.right
            ),
            verticalStack.topAnchor.constraint(
                equalTo: topAnchor,
                constant: contentMargins.top
            ),
            verticalStack.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -contentMargins.bottom
            )
        ])
        
        for (index, answer) in answers.enumerated() {
            switch index {
            case 0, 1:
                let answerImage = AnswerImageView(url: answer.url, isCorrect: answer.correct)
                firstStack.addArrangedSubview(answerImage)
            case 2, 3 :
                let answerImage = AnswerImageView(url: answer.url, isCorrect: answer.correct)
                secondStack.addArrangedSubview(answerImage)
            default:
                break
            }
        }
        
        verticalStack.addArrangedSubview(firstStack)
        verticalStack.addArrangedSubview(secondStack)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
