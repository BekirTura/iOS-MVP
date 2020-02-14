//
//  PostEventApiRequest.swift
//  MvpiOS
//
//  Created by Bekir on 14.02.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//
public class PostEventApiRequest: BaseApiRequest {
    public var requestBodyObject: BaseObject?
    public var requestMethod: RequestHttpMethod? = RequestHttpMethod.Post
    public var requestPath: String = "/sltf6"

    func setBodyObject(bodyObject: Event) {
        self.requestBodyObject = bodyObject
    }
}
