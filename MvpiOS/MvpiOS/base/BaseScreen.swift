//
//  BaseScreen.swift
//  MvpiOS
//
//  Created by Bekir on 13.02.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

import Foundation
import UIKit

class BaseScreen<P>: UIViewController{
    
    var presenter: P?
    
    let baseData = BaseData.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        initPresenter()
        initData()
        initUI()
    }
    
    func initData(){
        fatalError("Subclasses must implement initData()")

    }
    
    func initUI() {
        fatalError("Subclasses must implement initUI()")
    }
    
    func initPresenter() {
        fatalError("Subclasses must implement initPresenter()")
    }
    
    func getBaseData()-> BaseData {
        return baseData
    }
}

extension BaseScreen:BaseView{
    func loaderStart() {
        // Spinner Loading Start
    }
    
    func loaderStop() {
        // Spinner Loading Start
    }
    
    func errorPopup(error:String) {
        // Service and Phone Error Popup
    }
}



