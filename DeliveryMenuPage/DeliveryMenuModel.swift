//
//  DeliveryMenuModel.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/06.
//

import Foundation

struct DeliveryMenuModel {
    var data: [DeliveryMenuSectionModel] = []
    let bannerCellData = DeliveryMenuSectionModel.SectionBanner(items: [
        BannerItem(data: BannerSources(bannerType: .basic,
                                       sources: [
                                        BannerSource(bannerImage: BeminCellImage.storedImage(name: "space_bread1"), presentVC: TestVC()),
                                        BannerSource(bannerImage: BeminCellImage.storedImage(name: "space_bread2"), presentVC: TestVC()),
                                        BannerSource(bannerImage: BeminCellImage.storedImage(name: "space_bread3"), presentVC: TestVC())
                                       ]
                                      ))])
    let specialCellData = DeliveryMenuSectionModel.SectionSpecialMenu(items: [
        SpecialMenuItem(title: "딱\n1인분", backgroundImage: ""),
        SpecialMenuItem(title: "군침 싹!\n비빔밥", backgroundImage: ""),
        SpecialMenuItem(title: "딸기\n홈 뷔패", backgroundImage: ""),
        SpecialMenuItem(title: "떡볶이\n타임", backgroundImage: ""),
        SpecialMenuItem(title: "special Menu five", backgroundImage: "")
    ])
    
    let basicCellData = DeliveryMenuSectionModel.SectionBasicMenu(items: [
        BasicMenuItem(logoImage: "japanese", menuType: .japanese),
        BasicMenuItem(logoImage: "chinese", menuType: .chinese),
        BasicMenuItem(logoImage: "chicken", menuType: .chicken),
        BasicMenuItem(logoImage: "cafe", menuType: .cafe),
        BasicMenuItem(logoImage: "snackbar", menuType: .snackbar),
        BasicMenuItem(logoImage: "soup", menuType: .soup),
        BasicMenuItem(logoImage: "pizza", menuType: .pizza),
        BasicMenuItem(logoImage: "western", menuType: .western),
        BasicMenuItem(logoImage: "meat", menuType: .meat),
        BasicMenuItem(logoImage: "asian", menuType: .asian),
        BasicMenuItem(logoImage: "fastfood", menuType: .fastFood),
    ])
    
    init() {
        [bannerCellData, specialCellData, basicCellData].forEach {
            self.data.append($0)
        }
    }
    
    func getBasicCellTitles() -> [String] {
        switch basicCellData {
        case .SectionBanner(_):
            return []
        case .SectionSpecialMenu(_):
            return []
        case .SectionBasicMenu(let items):
            return items.map { item in
                return item.menuType.title
            }
        }
    }
}
