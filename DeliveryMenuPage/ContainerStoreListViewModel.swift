//
//  SlideStoreListViewModel.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/08.
//

import Foundation
import RxCocoa

struct ContainerStoreListViewModel {
    let cellData: [StoreType]
    
    // View -> ViewModel
    let scrollPaged = PublishRelay<Int>()
    
    // TopSlideView -> ViewModel -> View
    let slotChanged = PublishRelay<Int>()
    
    init() {
        self.cellData = StoreType.allCases
        
    }
}
