//
//  Posts.swift
//  social-apple
//
//  Created by Daniel Kravec on 2023-11-19.
//

import Foundation

class PostsApi: API_Helper {
    func getUserFeed(userTokens: UserTokenData, completion: @escaping (Result<FeedV2Data, Error>) -> Void) {
        print("Getting all posts")
        let APIUrl = baseAPIurl + "/feeds/userFeed/v2"
        self.requestData(urlString: APIUrl) { (result: Result<FeedV2Data, Error>) in
            switch result {
            case .success(var allPosts):
                let reversed:[AllPosts] = allPosts.posts.reversed()
                allPosts.posts = reversed
                completion(.success(allPosts))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getUserFeedIndex(userTokens: UserTokenData, index: String, completion: @escaping (Result<FeedV2Data, Error>) -> Void) {
        print("Getting all posts")
        let APIUrl = baseAPIurl + "/feeds/userFeed/v2/" + index
        self.requestData(urlString: APIUrl) { (result: Result<FeedV2Data, Error>) in
            switch result {
            case .success(var allPosts):
                let reversed:[AllPosts] = allPosts.posts.reversed()
                allPosts.posts = reversed
                completion(.success(allPosts))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getAllPosts(userTokens: UserTokenData, completion: @escaping (Result<[AllPosts], Error>) -> Void) {
        print("Getting all posts")
        let APIUrl = baseAPIurl + "/feeds/userFeed"
        self.requestData(urlString: APIUrl) { (result: Result<[AllPosts], Error>) in
            switch result {
            case .success(let allPosts):
                completion(.success(allPosts.reversed()))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func createPost(postCreateContent: PostCreateContent, completion: @escaping (Result<PostData, Error>) -> Void) {
        print("Creating post")
        let APIUrl = baseAPIurl + "/posts/create"
        self.requestDataWithBody(urlString: APIUrl, httpMethod: "POST", httpBody: postCreateContent) { (result: Result<PostData, Error>) in
            switch result {
            case .success(let postData):
                print("Created Post")
                completion(.success(postData))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    // like post
    func likePost(postID: String, completion: @escaping (Result<PostData, Error>) -> Void) {
        print("liking post")

        let APIUrl = baseAPIurl + "/posts/like/\(postID)"
        self.requestData(urlString: APIUrl, httpMethod: "PUT") { (result: Result<PostData, Error>) in
            switch result {
            case .success(let postData):
                print("Liked Post")
                completion(.success(postData))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    // unlike post
    func unlikePost(postID: String, completion: @escaping (Result<PostData, Error>) -> Void) {
        print("unliking post")
        let APIUrl = baseAPIurl + "/posts/unlike/\(postID)"
        self.requestData(urlString: APIUrl, httpMethod: "DELETE") { (result: Result<PostData, Error>) in
            switch result {
            case .success(let postData):
                print("Unliked Post")
                completion(.success(postData))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    // get post likes
    func getLikes(postID: String, completion: @escaping (Result<PostLikesRes, Error>) -> Void) {
        print("likes of post")
        let APIUrl = baseAPIurl + "/posts/likes/\(postID)"
        self.requestData(urlString: APIUrl, httpMethod: "GET") { (result: Result<PostLikesRes, Error>) in
            switch result {
            case .success(let postData):
                print("Unliked Post")
                completion(.success(postData))
            case .failure(let error):
                completion(.failure(error))
                print("Error: \(error)")
            }
        }
    }
    
    
    // get post replies
    func getReplies(postID: String, completion: @escaping (Result<PostReplyRes, Error>) -> Void) {
        print("replies of post")
        let APIUrl = baseAPIurl + "/posts/replies/\(postID)"
        self.requestData(urlString: APIUrl, httpMethod: "GET") { (result: Result<PostReplyRes, Error>) in
            switch result {
            case .success(let postData):
                print("replies Post")
                completion(.success(postData))
            case .failure(let error):
                completion(.failure(error))
                print("Error: \(error)")
            }
        }
    }
    
    // get post replies
    func getQuotes(postID: String, completion: @escaping (Result<PostQuoteRes, Error>) -> Void) {
        print("quotes of post")
        let APIUrl = baseAPIurl + "/posts/quotes/\(postID)"
        self.requestData(urlString: APIUrl, httpMethod: "GET") { (result: Result<PostQuoteRes, Error>) in
            switch result {
            case .success(let postData):
                print("quotes Post")
                completion(.success(postData))
            case .failure(let error):
                completion(.failure(error))
                print("Error: \(error)")
            }
        }
    }
    
    // get post edits
    func getEdits(postID: String, completion: @escaping (Result<PostEditSchema, Error>) -> Void) {
        print("edits of post")
        let APIUrl = baseAPIurl + "/posts/edits/\(postID)"
        self.requestData(urlString: APIUrl, httpMethod: "GET") { (result: Result<PostEditSchema, Error>) in
            switch result {
            case .success(let postData):
                print("edits Post")
                completion(.success(postData))
            case .failure(let error):
                completion(.failure(error))
                print("Error: \(error)")
            }
        }
    }
    
    // delete post
    func deletePost(postID: String, completion: @escaping (Result<PostDeleteRes, Error>) -> Void) {
        print("unliking post")
        let APIUrl = baseAPIurl + "/posts/remove/\(postID)"
        self.requestData(urlString: APIUrl, httpMethod: "DELETE") { (result: Result<PostDeleteRes, Error>) in
            switch result {
            case .success(let postData):
                print("Unliked Post")
                completion(.success(postData))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    // add to bookmarks
    func savePost(bookmarkData: PostBookmarkReq, completion: @escaping (Result<PostBookmarkRes, Error>) -> Void) {
        let APIUrl = baseAPIurl + "/posts/save/"
        self.requestDataWithBody(urlString: APIUrl, httpMethod: "POST", httpBody: bookmarkData) { (result: Result<PostBookmarkRes, Error>) in
            switch result {
            case .success(let postData):
                print("Unliked Post")
                completion(.success(postData))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    // remove from bookmark
    func unsavePost(bookmarkData: PostBookmarkReq, completion: @escaping (Result<PostUnbookmarkRes, Error>) -> Void) {
        let APIUrl = baseAPIurl + "/posts/unsave/"
        self.requestDataWithBody(urlString: APIUrl, httpMethod: "DELETE", httpBody: bookmarkData) { (result: Result<PostUnbookmarkRes, Error>) in
            switch result {
            case .success(let postData):
                print("Unliked Post")
                completion(.success(postData))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
