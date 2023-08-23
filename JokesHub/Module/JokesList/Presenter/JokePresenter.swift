//
//  JokePresenter.swift
//  JokesHub
//
//  Created by Shivam on 23/08/23.
//

import Foundation
import RealmSwift

protocol JokePresenterDelegate: AnyObject {
    func updateJokesList(_ joke: String)
    func fetchFromDB(_ jokes: [String])
}

class JokePresenter: JokeModelDelegate {
    weak var delegate: JokePresenterDelegate?
    
    private let jokeService = JokeListService()
    var realmDB: Realm!

    init() {
        realmDB = try! Realm()
        jokeService.delegate = self
    }
    
// MARK: Service Delegates

    func fetchJoke() {
        Task(priority: .background) {
            do {
                try await jokeService.fetchJoke()
            } catch {
                await MainActor.run {
                 print(error)
                }
            }
        }
    }
    
    func jokesUpdated(_ joke: String) {
        delegate?.updateJokesList(joke)
    }
    
// MARK: DB CALLS
    
    func saveData(joke: JokeDB) {
        do {
            try self.realmDB.write {
                self.realmDB.add(joke)
            }
        } catch {
            debugPrint(error)
        }
    }
    
    func updateData(jokes: [String]) {
        do {
            let allJokeObjects = realmDB.objects(JokeDB.self)

            try self.realmDB.write {
                realmDB.delete(allJokeObjects)
                for joke in jokes {
                    let jokeDBValue = JokeDB()
                    jokeDBValue.joke = joke
                    self.realmDB.add(jokeDBValue)
                }
            }
        } catch {
            debugPrint(error)
        }
    }
    
    func fetchDBData() {
        let jokesDB = realmDB.objects(JokeDB.self)
        
        var jokes = [String]()
        for joke in jokesDB {
            jokes.append(joke.joke ?? "")
        }
        delegate?.fetchFromDB(jokes)
    }
        
}
