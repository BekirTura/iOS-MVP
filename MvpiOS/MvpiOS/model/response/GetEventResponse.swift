//
//  GetEventResponse.swift
//  MvvmExampleSwift5.0
//
//  Created by Bekir on 14.01.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

import Foundation

public class GetEventResponse:Codable{
    
    
    var data : [Event]?
    
    enum CodingKeys: String, CodingKey {
          case data = "Data"
    }
 }
