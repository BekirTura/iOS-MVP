//
//  VideoPresenter.swift
//  MvpiOS
//
//  Created by Bekir on 13.02.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

import Foundation


public class EventPresenter: BasePresenter<EventView> {
  
    func denemeRequest()  {
        self.restClient.getEventList(successHandler: {(response) in
            if(response.data != nil){
                self.baseView?.onSuccessVideo(data: response.data!)
            }
        }, failHandler: {_ in
            
        })
        
        self.restClient.postEvent(event: Event(), successHandler: { (response) in
            
        }) { (error) in
        
        }
    }
}
