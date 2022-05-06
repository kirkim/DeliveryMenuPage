//
//  StoreType.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/06.
//

import Foundation

enum StoreType {
    case cafe
    case korean
    case japanese
    case chinese
    case soup
    case fastFood
    case chicken
    case pizza
    case asian
    case western
    case meat
    case snackbar
    
    var title:String {
        switch self {
        case .cafe:
            return "카페∙디저트"
        case .korean:
            return "한식"
        case .japanese:
            return "회∙일식"
        case .chinese:
            return "중식"
        case .soup:
            return "찜∙탕∙찌개"
        case .fastFood:
            return "패스트푸드"
        case .chicken:
            return "치킨"
        case .pizza:
            return "피자"
        case .asian:
            return "아시안"
        case .western:
            return "양식"
        case .meat:
            return "고기∙구이"
        case .snackbar:
            return "분식"
        }
    }
}
