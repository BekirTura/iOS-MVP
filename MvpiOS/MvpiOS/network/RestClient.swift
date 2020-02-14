//
//  RestClient.swift
//  MvpiOS
//
//  Created by Bekir on 14.02.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

import UIKit
import Alamofire

public class RestClient: IServiceHandler {

    static let sharedInstance:RestClient = RestClient.init()
    
    private init() {}
    
    private func sendRequest<T:Codable>(_ request:BaseApiRequest,_ type :T.Type,successHandler:@escaping(T)->(),failHandler:@escaping(Error)->()){
        AF.request(request.request()).responseDecodable { (response:AFDataResponse<T>) in
             switch response.result{
                       case .success(let responseEventList):
                           successHandler(responseEventList)
                           print("success")
                       case .failure(let error):
                           failHandler(error)
                           print("fail")
            }
        }
    }
    
    public func getEventList(successHandler: @escaping (GetEventResponse) -> (), failHandler: @escaping (Error) -> ()) {
        let request = GetEventListApiRequest();
        sendRequest(request, GetEventResponse.self, successHandler: successHandler, failHandler: failHandler)
    }
    
    public func postEvent(event:Event,successHandler: @escaping (GetEventResponse) -> (), failHandler: @escaping (Error) -> ()) {
           let request = PostEventApiRequest();
            request.setBodyObject(bodyObject: event )
           sendRequest(request, GetEventResponse.self, successHandler: successHandler, failHandler: failHandler)
    }
       
    
}
