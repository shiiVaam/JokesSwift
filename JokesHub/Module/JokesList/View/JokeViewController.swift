//
//  JokeViewController.swift
//  JokesHub
//
//  Created by Shivam on 23/08/23.
//

import UIKit

class JokeViewController: UIViewController, JokePresenterDelegate {
  
    private var tableView: JokeTableView?
    
    var presenter: JokePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = JokePresenter()
        presenter?.delegate = self
        setupUI()

        if let presenter {
            if presenter.realmDB.isEmpty {
                presenter.fetchJoke()
            } else {
                presenter.fetchDBData()
            }
        }

        Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(fetchJoke), userInfo: nil, repeats: true)
    }
    
    @objc func fetchJoke() {
        presenter?.fetchJoke()
    }
    
    func updateJokesList(_ joke: String) {
        tableView?.updateJokes(joke)
    }
    
    func fetchFromDB(_ jokes: [String]) {
        tableView?.jokes = jokes
        tableView?.reloadData()
    }
    
    private func setupUI() {
        self.navigationItem.title = "Jokes"
        self.view.backgroundColor = .white
        tableView = JokeTableView()
        if let tableView {
            tableView.jokePresenter = presenter
            tableView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(tableView)
            
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
    }
}
