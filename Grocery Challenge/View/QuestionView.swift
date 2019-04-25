//
//  QuestionView.swift
//  Grocery Challenge
//
//  Created by Atish on 4/24/19.
//  Copyright © 2019 Instacart. All rights reserved.
//

import UIKit

class QuestionView: UIView {
    
    private var questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(question: String) {
        super.init(frame: .zero)
        questionLabel.text = question
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Unimplemented")
    }
    
    let contentMargins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    
    private func commonInit() {
        addSubview(questionLabel)
        NSLayoutConstraint.activate([
            questionLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: contentMargins.left
            ),
            questionLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -contentMargins.right
            ),
            questionLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: contentMargins.top
            ),
            questionLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -contentMargins.bottom
            )
        ])
    }
    
}
