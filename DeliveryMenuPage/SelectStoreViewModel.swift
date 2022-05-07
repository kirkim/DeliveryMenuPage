//
//  DeliveryListViewModel.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/06.
//

import Foundation

struct SelectStoreViewModel {
    let topSlideBarViewModel: TopSlideBarViewModel
    
    init(itemTitles: [String]) {
        self.topSlideBarViewModel = TopSlideBarViewModel(itemTitles: itemTitles)
    }
    
}
