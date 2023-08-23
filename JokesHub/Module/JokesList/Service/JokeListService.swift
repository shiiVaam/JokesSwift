//
//  JokeListService.swift
//  JokesHub
//
//  Created by Shivam on 23/08/23.
//

import Foundation

enum ConversionFailure: Error {
    case urlConversion
}

protocol JokeModelDelegate: AnyObject {
    func fetchJoke() async throws
    func jokesUpdated(_ joke: String)
}

final class JokeListService {
    weak var delegate: JokeModelDelegate?
    
    init() {}
    
    func fetchJoke() async throws {
        guard let url = URL(string: "https://geek-jokes.sameerkumar.website/api") else {
            throw ConversionFailure.urlConversion
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let joke = try JSONDecoder().decode(String.self, from: data)
                        
            await MainActor.run {
                self.delegate?.jokesUpdated(joke)
            }
        } catch {
            throw error
        }
    }
    
}



