//
//  BasePresenter.swift
//  MvpiOS
//
//  Created by Bekir on 13.02.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

public class BasePresenter<V>{
    var baseView : V?
    
    let restClient = RestClient.sharedInstance
    
    init(baseView: V) {
        self.baseView = baseView
    }
   
    func detachView() {
           baseView = nil
    }
    
}
