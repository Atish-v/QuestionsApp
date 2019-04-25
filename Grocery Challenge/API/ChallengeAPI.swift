//
//  ChallengeAPI.swift
//  Grocery Challenge
//
//  Created by Andrew Crookston on 5/14/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import Foundation

@objc final class ChallengeAPI: NSObject {
    let service: Service

    @objc convenience override init() {
        self.init(service: NetworkService())
    }

    init(service: Service) {
        self.service = service
    }

    func randomQuestionAsync(request: Requests = APIRequests.questions, _ completion: @escaping (Result<Question>) -> Void) {
        allQuestionsAsync(request: request) { result in
            switch result {
            case .success(let questions):
                guard questions.count > 0 else {
                    completion(.error(APIError.noQuestions))
                    return
                }
                let index = Int(arc4random_uniform(UInt32(questions.count)))
                completion(.success(questions[index]))
            case .error(let error):
                completion(.error(error))
            }
        }
    }

    func allQuestionsAsync(request: Requests = APIRequests.questions, _ completion: @escaping (Result<[Question]>) -> Void) {
        service.get(request: request) { result in
            switch result {
            case .success(let data):
                do {
                    let questions: Questions = try JSONDecoder().decode(Questions.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(questions.questions))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.error(error))
                    }
                }
            case .error(let error):
                DispatchQueue.main.async {
                    completion(.error(error))
                }
            }
        }
    }
}

enum APIRequests: String, Requests {
    case questions = "https://gist.github.com/acrookston/e1af7bf2e2607db3d27a0b44ed1843c1/raw/490d746e54e774476652cf8ab65f9c912e54e95f/question.json"

    var url: URL {
        return URL(string: rawValue)!
    }
}

enum APIError: Error {
    case noQuestions
}

// Only used for decoding
private struct Questions: Codable {
    let questions: [Question]
}
