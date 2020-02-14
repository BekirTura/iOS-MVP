//
//  VideoScreen.swift
//  MvpiOS
//
//  Created by Bekir on 13.02.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

import UIKit

class EventScreen:BaseScreen<EventPresenter>,EventView{
  
    let baseData2:BaseData = BaseData.shared
    override func initPresenter() {
        presenter =  EventPresenter(baseView: self)
    }
    
    func onSuccessVideo(data:[Event]) {
          
    }
      
    func setUIData() {
          
    }
      
}
