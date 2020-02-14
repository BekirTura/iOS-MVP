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
        self.baseView!.onSuccessVideo()
    }
}
