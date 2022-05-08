//
//  DeliveryListViewModel.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/06.
//

import Foundation
import RxSwift

struct SelectStoreViewModel {
    let topSlideBarViewModel = TopSlideBarViewModel()
    let sortSlideBarViewModel = SortSlideBarViewModel()
    let containerListViewModel = ContainerStoreListViewModel()
    private let disposeBag = DisposeBag()
    
    init() {
        topSlideBarViewModel.slotChanged
            .bind(to: containerListViewModel.slotChanged)
            .disposed(by: disposeBag)
        
        containerListViewModel.scrollPaged
            .bind(to: topSlideBarViewModel.scrollPaged)
            .disposed(by: disposeBag)
    }
    
}
