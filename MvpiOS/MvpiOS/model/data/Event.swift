//
//  Event.swift
//  MvvmExampleSwift5.0
//
//  Created by Bekir on 14.01.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

import Foundation

public class Event: Codable {
    var categoryName:String
    var cityName:String
     enum CodingKeys: String, CodingKey {
        case categoryName = "CategoryName"
        case cityName = "CityName"
    }
}
