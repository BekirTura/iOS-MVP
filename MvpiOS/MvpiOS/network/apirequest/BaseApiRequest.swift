//
//  ApiRequest.swift
//  MvvmExampleSwift5.0
//
//  Created by Bekir on 14.01.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

import Alamofire

public protocol BaseApiRequest {
    var requestMethod: RequestHttpMethod?{ get }
    var requestBodyObject: BaseObject?{ get }
    var requestPath: String {get}
    func request() -> URLRequest
}


extension BaseApiRequest{
    var enviroment: Environment {
        return Environment.Dev
    }
    public func request() -> URLRequest {
        let url: URL! = URL(string: baseUrl+requestPath)
        var request = URLRequest(url: url)
        switch requestMethod {
        case .Get:
            request.httpMethod = "GET"
            break
        case .Post:
            request.httpMethod = "POST"
            if(requestBodyObject != nil){
                let jsonEncoder = JSONEncoder()
                do {
                    request.httpBody = try jsonEncoder.encode(requestBodyObject)
                } catch  {
                    print(error)
                }
            }
            break
        default:
            request.httpMethod = "GET"
            break
        }
        return request
    }
    
    
    var baseUrl: String {
        switch enviroment {
        case .Prod:
            return "https://api.myjson.com/bins"
        case .Dev:
            return "https://api.myjson.com/bins"
        default:
            return "https://api.myjson.com/"
        }
    }
}

public enum RequestHttpMethod{
    case Get
    case Post
}

public enum Environment{
    case Prod
    case Dev
    case UAT
}




