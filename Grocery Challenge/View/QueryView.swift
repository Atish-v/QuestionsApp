//
//  QueryView.swift
//  Grocery Challenge
//
//  Created by Atish on 4/24/19.
//  Copyright © 2019 Instacart. All rights reserved.
//

import UIKit

class QueryView: UIView {

    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let contentMargins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)

    
    init(question: Question) {
        super.init(frame: .zero)
        let answers = question.answers
        let questionView = QuestionView(question: question.query)
        let answerView = AnswerView(answers: answers)
        
        addSubview(stackView)
        stackView.addArrangedSubview(questionView)
        stackView.addArrangedSubview(answerView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: contentMargins.left
            ),
            stackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -contentMargins.right
            ),
            stackView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: contentMargins.top
            ),
            stackView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -contentMargins.bottom
            )
        ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
