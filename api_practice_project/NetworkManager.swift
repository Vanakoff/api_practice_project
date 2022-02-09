//
//  NetworkManager.swift
//  api_practice_project
//
//  Created by Andrey Vanakoff on 09/02/2022.
//

import Foundation

enum Link: String {
    case pulpFiction = "https://www.omdbapi.com/?t=Pulp+Fiction&apikey=dfe96dbe"
    case jackieBrown = "https://www.omdbapi.com/?t=jackie+brown&apikey=dfe96dbe"
    case killBill = "https://www.omdbapi.com/?t=kill+bill&apikey=dfe96dbe"
    case inglouriousBasterds = "https://www.omdbapi.com/?t=inglourious+basterds&apikey=dfe96dbe"
}

class NetworkManager {
    static let shaerd = NetworkManager()
    
    private init() {}
    
    
}
