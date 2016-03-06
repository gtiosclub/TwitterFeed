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
        
        public var method: Alamofire.Method {
            switch self {
                case .HomeTimeline(): return .GET
            }
        }
        
        public var parameters: [String : AnyObject] {
//            switch self {
//            case .VerifyEmail(let email):
//                return ["api" : "verify.email", "email" : email]
//            case .UserInitialize(let authData):
//                return ["api" : "user.initialize", "authData" : authData]
//            case .DoesEmailExist(let email):
//                return ["api" : "user.exists", "email" : email]
//            case .Dashboard:
//                return ["api" : "user.dashboard"]
//            }
            
            return [:]
        }
        
        public var path: String {
            switch self {
                case .HomeTimeline: return "statuses/home_timeline.json"
            }
        }
        
        public var description: String {
            switch self {
            case .HomeTimeline(): return "GET home timeline"
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
