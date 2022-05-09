//
//  DeliveryListPage.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/06.
//

import UIKit
import RxSwift
import SnapKit

class SelectStoreVC: UIViewController {
    private let topBar: TopSlideBar
    private let sortBar = SortSlideBar()
    private let disposeBag = DisposeBag()
    private let containerListView: ContainerStoreListView
    
    init(startPage: Int) {
        self.topBar = TopSlideBar(startPage: startPage)
        self.containerListView = ContainerStoreListView(startPage: startPage)
        super.init(nibName: nil, bundle: nil)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: SelectStoreViewModel) {
        self.topBar.bind(viewModel.topSlideBarViewModel)
        self.sortBar.bind(viewModel.sortSlideBarViewModel)
        self.containerListView.bind(viewModel.containerListViewModel)
        viewModel.changeTitle
            .bind(to: self.rx.title)
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        self.view.backgroundColor = .white
    }
    
    private func layout() {
        [containerListView, topBar, sortBar].forEach {
            self.view.addSubview($0)
        }
        
        topBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        sortBar.snp.makeConstraints {
            $0.top.equalTo(topBar.snp.bottom).offset(1)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        containerListView.snp.makeConstraints {
            $0.top.equalTo(sortBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
