//
//  TestVC.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/06.
//

import UIKit

class TestVC: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func attribute() {
        self.view.backgroundColor = .green
    }
    
    private func layout() {
        
    }
}
