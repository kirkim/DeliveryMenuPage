//
//  File.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/08.
//

import Foundation
import RxDataSources
import RxCocoa

struct StoreListViewModel {
    let cellData = PublishRelay<[StoreListSection]>()
    
    init() {
        
    }
    
    func updateData(data: [StoreListSection]) {
        cellData.accept(data)
    }
    
    func dataSource() -> RxCollectionViewSectionedReloadDataSource<StoreListSection> {
        let dataSource = RxCollectionViewSectionedReloadDataSource<StoreListSection>(
            configureCell: { dataSource, collectionView, indexPath, item in
                let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: StoreListCell.self)
                cell.setData(data: item)
                return cell
            })
        
        // Header
//        dataSource.configureSupplementaryView = {(dataSource, collectionView, kind, indexPath) -> UICollectionReusableView in
//            switch dataSource[indexPath.section] {
//
//            }
//        }
        return dataSource
    }

}
