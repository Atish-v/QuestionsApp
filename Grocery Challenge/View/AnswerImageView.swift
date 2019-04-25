//
//  AnswerImageView.swift
//  Grocery Challenge
//
//  Created by Atish on 4/24/19.
//  Copyright © 2019 Instacart. All rights reserved.
//

import UIKit

class AnswerImageView: UIImageView {
    
    private var selected = false
    private var isCorrect: Bool
    
    init(url: URL, isCorrect: Bool) {
        self.isCorrect = isCorrect
        super.init(frame: .zero)
        UIImage.asyncFrom(url: url) { [weak self] result in
            switch result {
            case let .success(img):
                self?.image = img
                
            case .error:
                self?.backgroundColor = .gray
            }
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 100),
            heightAnchor.constraint(equalToConstant: 100)
        ])
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2.0
        
        layer.cornerRadius = 5
        isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        addGestureRecognizer(tapGesture)
    }
    
    @objc func didTap() {
        selected.toggle()
        if selected {
            self.alpha = 0.6
        } else {
            self.alpha = 1.0
        }
        
        if selected {
            if isCorrect {
                layer.borderColor = UIColor.green.cgColor
                UIView.animate(withDuration: 0.3, animations: {
                    self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                }) { (success) in
                    self.transform = CGAffineTransform.identity
                }
            } else {
                layer.borderColor = UIColor.red.cgColor
            }
            

        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
