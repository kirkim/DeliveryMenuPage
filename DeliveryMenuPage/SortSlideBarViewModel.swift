//
//  SortSlideBarViewModel.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/07.
//

import Foundation

struct SortSlideBarViewModel {
    let cellData: [String]
    let model = SortSlideBarModel()
    
    init() {
        cellData = model.cellData
    }
}
