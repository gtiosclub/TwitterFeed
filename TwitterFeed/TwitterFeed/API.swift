//
//  API.swift
//  TwitterFeed
//
//  Created by Luke Newman on 3/6/16.
//  Copyright © 2016 GTiOS. All rights reserved.
//

import Foundation
import Alamofire

public class API {
    static let baseURL: String = "https://api.twitter.com/1.1/"
    
    public enum Endpoints {
        case HomeTimeline()
        case UserTimeline(String)
        case Tweet(String)
        
        public var method: Alamofire.Method {
            switch self {
                case .HomeTimeline: return .GET
                case .UserTimeline: return .GET
                case .Tweet:        return .POST
            }
        }
        
        public var parameters: [String : AnyObject] {
            switch self {
            case .HomeTimeline:
                return [:]
            case .UserTimeline(let handle):
                return ["screen_name" : handle]
            case .Tweet(let tweet):
                return ["status" : tweet]
            }
        }
        
        public var path: String {
            switch self {
                case .HomeTimeline: return "statuses/home_timeline.json"
                case .UserTimeline: return "statuses/user_timeline.json"
                case .Tweet:        return "statuses/update.json"
            }
        }
        
        public var description: String {
            switch self {
                case .HomeTimeline:             return "GETting home timeline"
                case .UserTimeline(let handle): return "GETting user timeline for \(handle)"
                case .Tweet(let tweet):         return "POSTing tweet: \(tweet)"
            }
        }
    }
    
    public static func request(endpoint: API.Endpoints, completionHandler: Response<AnyObject, NSError> -> Void) -> Request {
        print("API | \(endpoint.description)")
        let request = Manager.sharedInstance.request(endpoint.method, baseURL + endpoint.path, parameters: endpoint.parameters, encoding: .URL, headers: nil).responseJSON { response in
            if (response.result.error) != nil {
                completionHandler(response)
            } else {
                completionHandler(response)
            }
        }
        
        return request
    }
}
