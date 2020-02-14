//
//  VideoScreen.swift
//  MvpiOS
//
//  Created by Bekir on 13.02.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

import UIKit

class EventScreen:BaseScreen<EventPresenter>,EventView{
    //let baseData2:BaseData = BaseData.shared
    
    override func viewDidLoad() {
           super.viewDidLoad()
    }
    
    override func initPresenter() {
          presenter =  EventPresenter(baseView: self)
    }
    
    override func initUI() {
        
    }
    
    override func initData() {
        presenter?.denemeRequest()
    }
    
  
    
    func onSuccessVideo(data:[Event]) {
          
    }
      

      
}
