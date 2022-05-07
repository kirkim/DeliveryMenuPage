//
//  TopSlideBarViewModel.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/06.
//

import Foundation

struct TopSlideBarViewModel {
    let cellData: [String]
    
    init(itemTitles: [String]) {
        self.cellData = itemTitles
    }
}
