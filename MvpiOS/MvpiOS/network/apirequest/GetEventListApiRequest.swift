//
//  GetEventListApiRequest.swift
//  MvvmExampleSwift5.0
//
//  Created by Bekir on 14.01.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

import Foundation
public class GetEventListApiRequest: BaseApiRequest {
    public var requestBodyObject: BaseObject?
    public var requestMethod: RequestHttpMethod?
    public var requestPath: String = "/sltf6"
}
