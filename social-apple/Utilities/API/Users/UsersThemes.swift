//
//  Theme.swift
//  social-apple
//
//  Created by Daniel Kravec on 2024-02-11.
//

import Foundation

class UsersThemesAPI: API_Helper {
    func possible(completion: @escaping (Result<UserData, Error>) -> Void) {
        let APIUrl = baseAPIurl + "/users/profile/theme/possible"
        self.requestData(urlString: APIUrl) { (result: Result<UserData, Error>) in
            switch result {
            case .success(let userData):
                print("Logged in")
                completion(.success(userData))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func themes(completion: @escaping (Result<UserData, Error>) -> Void) {
        let APIUrl = baseAPIurl + "/users/profile/theme/themes"
        self.requestData(urlString: APIUrl) { (result: Result<UserData, Error>) in
            switch result {
            case .success(let userData):
                print("Logged in")
                completion(.success(userData))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func themes(indexID: String, completion: @escaping (Result<UserData, Error>) -> Void) {
        let APIUrl = baseAPIurl + "/users/profile/theme/themes"+indexID
        
        self.requestData(urlString: APIUrl) { (result: Result<UserData, Error>) in
            switch result {
            case .success(let userData):
                print("Logged in")
                completion(.success(userData))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
