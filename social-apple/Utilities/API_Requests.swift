//
//  API_Requests.swift
//  social-apple
//
//  Created by Daniel Kravec on 2023-04-19.
//

import Foundation


class API_Rquests {
    let baseAPIurl = "https://interact-api.novapro.net/v1";
    let appToken = "token"
    let devToken = "token"

    func getDataFromAPI(route: String, bodyData: Any, completion: @escaping (Result<Data, Error>) -> Void) {
        let url = URL(string: baseAPIurl + route)!
        var request = URLRequest(url: url)
        request.addValue("Bearer YOUR_ACCESS_TOKEN_HERE", forHTTPHeaderField: "Authorization")
                
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "com.example.error", code: 0, userInfo: nil)))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }

    func userLoginRequest(userLogin: UserLoginData, completion: @escaping (Result<UserLoginResponse, Error>) -> Void) {
        let url = URL(string: baseAPIurl + "/auth/userLogin")!
        var request = URLRequest(url: url)
        
        // request.httpBody = try? JSONEncoder().encode(userLogin)
        
        request.addValue(appToken, forHTTPHeaderField: "apptoken")
        request.addValue(devToken, forHTTPHeaderField: "devtoken")
                
        request.addValue(userLogin.username, forHTTPHeaderField: "username")
        request.addValue(userLogin.password, forHTTPHeaderField: "password")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print ("ERROR ")
                print(error)
                // Handle error here
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,

                  (200...299).contains(httpResponse.statusCode) else {
                print ("NOT 2XX result ")

                // Handle non-2xx status code here
                return
            }
            guard let data = data else {
                  completion(.failure(NSError(domain: "com.example.error", code: 0, userInfo: nil)))
                print ("data=data line ")

                  return
              }
            do {
                  let decoder = JSONDecoder()
                  let dataModel = try decoder.decode(UserLoginResponse.self, from: data)
                print ("DO AREWA")
                print (dataModel)
                  completion(.success(dataModel))
              } catch {
                  completion(.failure(error))
              }
        }
        
        task.resume()
        /*
         
         */
    }
    func getAllPosts2() {
//        let response = try JSONDecoder().decode(Response.self, from: jsonData)
//               if let users = response.users {
//                   print(users)
//               }
    }
    func getAllPosts(userTokens: UserTokenData, completion: @escaping (Result<[AllPosts], Error>) -> Void) {
        let url = URL(string: baseAPIurl + "/get/AllPosts")!
        var request = URLRequest(url: url)
        
        // request.httpBody = try? JSONEncoder().encode(userLogin)
        
        request.addValue(appToken, forHTTPHeaderField: "apptoken")
        request.addValue(devToken, forHTTPHeaderField: "devtoken")
        request.addValue(userTokens.accessToken, forHTTPHeaderField: "accesstoken")
        request.addValue(userTokens.userToken, forHTTPHeaderField: "usertoken")

        request.addValue(userTokens.userID, forHTTPHeaderField: "userid")

//        request.addValue(userLogin.username, forHTTPHeaderField: "username")
//        request.addValue(userLogin.password, forHTTPHeaderField: "password")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print ("ERROR ")
                print(error)
                // Handle error here
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,

                  (200...299).contains(httpResponse.statusCode) else {
                print(response!)
                print(data!)
                do {
                    let error = try JSONDecoder().decode(ErrorDataWithAuth.self, from: data!)
                    print("API error: \(error.error.msg), code: \(error.error.code)")
                } catch {
                    print("Error decoding API error: \(error.localizedDescription)")
                }

//                let decoder = JSONDecoder()
//                let dataModel = try decoder.decode(ErrorDataWithAuth.self, from: data)
                print ("NOT 2XX result ")

                // Handle non-2xx status code here
                return
            }
            guard let data = data else {
                  completion(.failure(NSError(domain: "com.example.error", code: 0, userInfo: nil)))
                print ("data=data line ")

                  return
              }
            do {
                  let decoder = JSONDecoder()
                  let dataModel = try decoder.decode([AllPosts].self, from: data)
                print ("DO AREWA")
                print (dataModel)
                  completion(.success(dataModel))
              } catch {
                  completion(.failure(error))
              }
        }
        
        task.resume()
        /*
         
         */
    }
}
