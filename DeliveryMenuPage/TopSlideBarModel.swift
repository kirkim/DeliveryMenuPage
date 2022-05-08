//
//  TopSlideBarModel.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/07.
//

import Foundation

struct TopSlideBarModel {
    var cellData: [StoreType]
    
    init() {
        cellData = StoreType.allCases
    }
}
