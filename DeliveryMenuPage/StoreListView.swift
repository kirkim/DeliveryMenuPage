//
//  StoreListView.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/08.
//

import UIKit
import RxSwift
import RxCocoa

class StoreListView: UICollectionView {
    private let disposeBag = DisposeBag()
    private let sectionManager = StoreListSectionManager()
    
    init() {
        super.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: StoreListViewModel) {
        let dataSource = viewModel.dataSource()
        viewModel.cellData
            .bind(to: self.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        self.register(cellType: StoreListCell.self)
        self.delegate = self
        self.showsVerticalScrollIndicator = false
    }
    
    private func layout() {
//        self.collectionViewLayout = sectionManager.createLayout()
    }
}

//MARK: - StoreListView: UICollectionViewDelegateFlowLayout
extension StoreListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.frame.width
        let height = self.frame.height/8
        return CGSize(width: width , height: height)
    }
}
