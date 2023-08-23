//
//  JokeModel.swift
//  JokesHub
//
//  Created by Shivam on 23/08/23.
//

import Foundation
import RealmSwift

class JokeDB: Object {
    @objc dynamic var joke: String?
}
