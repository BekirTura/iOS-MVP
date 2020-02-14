//
//  GetEventResponse.swift
//  MvvmExampleSwift5.0
//
//  Created by Bekir on 14.01.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

import Foundation

public class GetEventResponse:BaseObject{
    
  // Json  =>   {"Data":[{"CategoryName":"Deneme1","CityName":"City Name Deneme 2"},{"CategoryName":"Deneme2","CityName":"City Name Deneme 3"}]}
    var data : [Event]?
    
    var errorMsg :String?
    
    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case errorMsg = "ErrorMessage"
    }
 }
