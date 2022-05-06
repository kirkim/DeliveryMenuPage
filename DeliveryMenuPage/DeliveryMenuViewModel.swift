//
//  DeliveryMenuViewModel.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/06.
//

import Foundation
import RxDataSources

struct DeliveryMenuViewModel {
    let data: [DeliveryMenuSectionModel] = [
        DeliveryMenuSectionModel.SectionBanner(items: [
            BannerItem(data: BannerSources(bannerType: .basic,
                                           sources: [
                                            BannerSource(bannerImage: BeminCellImage.storedImage(name: "space_bread1"), presentVC: TestVC()),
                                            BannerSource(bannerImage: BeminCellImage.storedImage(name: "space_bread2"), presentVC: TestVC()),
                                            BannerSource(bannerImage: BeminCellImage.storedImage(name: "space_bread3"), presentVC: TestVC())
                                           ]
                                          ))]),
        DeliveryMenuSectionModel.SectionSpecialMenu(items: [
            SpecialMenuItem(title: "딱\n1인분", backgroundImage: ""),
            SpecialMenuItem(title: "군침 싹!\n비빔밥", backgroundImage: ""),
            SpecialMenuItem(title: "딸기\n홈 뷔패", backgroundImage: ""),
            SpecialMenuItem(title: "떡볶이\n타임", backgroundImage: ""),
            SpecialMenuItem(title: "special Menu five", backgroundImage: "")
        ]),
        DeliveryMenuSectionModel.SectionBasicMenu(items: [
            BasicMenuItem(logoImage: "", menuType: .japanese),
            BasicMenuItem(logoImage: "", menuType: .chinese),
            BasicMenuItem(logoImage: "", menuType: .chicken),
            BasicMenuItem(logoImage: "", menuType: .cafe),
            BasicMenuItem(logoImage: "", menuType: .snackbar),
            BasicMenuItem(logoImage: "", menuType: .soup),
            BasicMenuItem(logoImage: "", menuType: .pizza),
            BasicMenuItem(logoImage: "", menuType: .western),
            BasicMenuItem(logoImage: "", menuType: .meat),
            BasicMenuItem(logoImage: "", menuType: .asian),
            BasicMenuItem(logoImage: "", menuType: .fastFood),
        ])
    ]
    
    func dataSource() -> RxCollectionViewSectionedReloadDataSource<DeliveryMenuSectionModel> {
        let dataSource = RxCollectionViewSectionedReloadDataSource<DeliveryMenuSectionModel>(
            configureCell: { dataSource, collectionView, indexPath, item in
                switch dataSource[indexPath.section] {
                case .SectionBanner(items: let items):
                    let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: DeliveryMenuBannerCell.self)
                    cell.setData(data: items[indexPath.row].data)
                    return cell
                case .SectionSpecialMenu(items: let items):
                    let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: DeliveryMenuSpecialCell.self)
                    cell.setData(data: items[indexPath.row])
                    return cell
                case .SectionBasicMenu(items: let items):
                    let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: DeliveryMenuBasicCell.self)
                    cell.setData(data: items[indexPath.row])
                    return cell
                }
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
