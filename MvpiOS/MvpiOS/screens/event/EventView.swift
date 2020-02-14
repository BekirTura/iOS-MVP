//
//  VideoView.swift
//  MvpiOS
//
//  Created by Bekir on 13.02.2020.
//  Copyright © 2020 Bekir. All rights reserved.
//

import Foundation

public protocol EventView: BaseView{
    func onSuccessEventData(data:[Event]);
}
