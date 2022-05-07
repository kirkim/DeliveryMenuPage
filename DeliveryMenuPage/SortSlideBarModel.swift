//
//  SortSlideBarModel.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/07.
//

import Foundation

struct SortSlideBarModel {
    var cellData: [String]
    
    init() {
        cellData = SortSlideType.allCases
            .map { $0.title }
    }
}
