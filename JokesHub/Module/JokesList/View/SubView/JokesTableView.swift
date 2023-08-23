//
//  JokesTableView.swift
//  JokesHub
//
//  Created by Shivam on 23/08/23.
//

import UIKit

final class JokeTableView: UITableView, UITableViewDataSource {
    private let cellIdentifier = "JokeCell"
    
    var jokePresenter: JokePresenter?
    var jokes: [String] = []

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    

    private func setup() {
        dataSource = self
        register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    private func updateRows() {
        beginUpdates()
        insertRows(at: [IndexPath(row: 0, section: 0)], with: .left)
        deleteRows(at: [IndexPath(row: jokes.count - 1, section: 0)], with: .right)
        endUpdates()
    }
    
    private func addRow() {
        beginUpdates()
        insertRows(at: [IndexPath(row: jokes.count - 1, section: 0)], with: .left)
        endUpdates()
    }
    
    func updateJokes(_ joke: String) {
        if self.jokes.count >= 10 {
            jokes.removeLast()
            jokes.insert(joke, at: 0)
            self.jokePresenter?.updateData(jokes: jokes)
            updateRows()
        } else {
            self.jokes.append(joke)
            let jokeDB = JokeDB()
            jokeDB.joke = joke
            self.jokePresenter?.saveData(joke: jokeDB)
            addRow()
        }
    }
    
// MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = jokes[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}
