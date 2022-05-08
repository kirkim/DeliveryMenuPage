//
//  SortSlideBarViewModel.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/07.
//

import Foundation
import RxCocoa
import RxSwift

struct SortSlideBarViewModel {
    private let disposeBag = DisposeBag()
    let cellData: [String]
    let model = SortSlideBarModel()
    
    // View -> ViewModel
    let itemSelected = PublishRelay<Int>()
    
    // ViewModel -> View
    let slotChanged = PublishRelay<Int>()
    
    init() {
        cellData = model.cellData
        itemSelected.bind(to: slotChanged).disposed(by: disposeBag)
    }
}
