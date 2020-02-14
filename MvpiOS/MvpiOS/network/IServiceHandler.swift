//
//  IServiceHandler.swift
//  MvpiOS
//
//  Created by Bekir on 14.02.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

public protocol IServiceHandler {

    func getEventList(successHandler:@escaping(GetEventResponse)->(),
                      failHandler:@escaping(Error)->())
    
    func postEvent(event:Event,successHandler: @escaping (GetEventResponse) -> (), failHandler: @escaping (Error) -> ())

}
