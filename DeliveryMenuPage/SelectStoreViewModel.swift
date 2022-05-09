//
//  DeliveryListViewModel.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/06.
//

import Foundation
import RxSwift
import RxRelay

struct SelectStoreViewModel {
    let topSlideBarViewModel = TopSlideBarViewModel()
    let sortSlideBarViewModel = SortSlideBarViewModel()
    let containerListViewModel = ContainerStoreListViewModel()
    private let disposeBag = DisposeBag()
    
    // ViewModel -> View
    let changeTitle = PublishRelay<String>()
    
    init() {
        let slotChanged = topSlideBarViewModel.slotChanged.share()
        slotChanged
            .bind(to: containerListViewModel.slotChanged)
            .disposed(by: disposeBag)
        
        slotChanged
            .map { StoreType.allCases[$0].title }
            .bind(to: changeTitle)
            .disposed(by: disposeBag)
        
        
        containerListViewModel.scrollPaged
            .bind(to: topSlideBarViewModel.scrollPaged)
            .disposed(by: disposeBag)
    }
    
}
