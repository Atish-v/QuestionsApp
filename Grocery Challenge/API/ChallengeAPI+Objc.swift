//
//  ChallengeAPI+Objc.swift
//  Grocery Challenge
//
//  Created by Andrew Crookston on 11/15/18.
//  Copyright © 2018 Instacart. All rights reserved.
//

import Foundation

extension ChallengeAPI {
    /// Usage:
    /// ```
    /// [[ChallengeAPI new] randomQuestionAsyncWithSuccess:^(Question *question) {
    ///     NSLog(@"%@", question.query);
    /// } failure:^(NSError *error) {
    ///     NSLog(@"%@", error);
    /// }];
    /// ```
    @objc(randomQuestionAsyncWithSuccess:failure:) func bridgedRandomQuestionAsync(success: @escaping ((Question) -> Void), failure: @escaping ((Error) -> Void)) {
        randomQuestionAsync { result in
            switch result {
            case .success(let question):
                success(question)
            case .error(let error):
                failure(error)
            }
        }
    }

    /// Usage:
    /// ```
    /// [[ChallengeAPI new] allQuestionsAsyncWithSuccess:^(NSArray<Question *> *questions) {
    ///     NSLog(@"%@", questions[0].query);
    /// } failure:^(NSError *error) {
    ///     NSLog(@"%@", error);
    /// }];
    /// ```
    @objc(allQuestionsAsyncWithSuccess:failure:) func bridgedAllQuestionsAsync(success: @escaping (([Question]) -> Void), failure: @escaping ((Error) -> Void)) {
        allQuestionsAsync { result in
            switch result {
            case .success(let question):
                success(question)
            case .error(let error):
                failure(error)
            }
        }
    }
}
