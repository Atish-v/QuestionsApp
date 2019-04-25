//
//  Question.swift
//  Grocery Challenge
//
//  Created by Andrew Crookston on 5/14/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import Foundation

@objc final class Question: NSObject, Codable {
    @objc let query: String // The prompt/title/question we want to ask
    @objc let answers: [Answer] // List of answers (always 4)
}

@objc final class Answer: NSObject, Codable {
    @objc let url: URL // A URL pointing to a remote image
    @objc let correct: Bool // Is this the correct answer or not
}
