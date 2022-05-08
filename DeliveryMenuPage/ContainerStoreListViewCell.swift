//
//  ContainerStoreListViewCell.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/08.
//

import UIKit

class ContainerStoreListViewCell: UICollectionViewCell {
    private var flag:Bool = false
    private let storeListView = StoreListView()
    private let storeListViewModel = StoreListViewModel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        layout()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(data: [StoreListSection]) {
        self.storeListViewModel.updateData(data: data)
    }
    
    private func bind() {
        self.storeListView.bind(storeListViewModel)
    }
    
    private func attribute() {
        
    }
    
    private func layout() {
        [storeListView].forEach {
            self.addSubview($0)
        }
        
        storeListView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

    }
}
