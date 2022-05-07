//
//  DeliveryMenuVC.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/06.
//

import UIKit
import SnapKit
import RxDataSources
import RxSwift
import RxCocoa

class DeliveryMenuVC: UIViewController {
    private let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let sectionManager = DeliveryMenuSectionManager()
    private let disposeBag = DisposeBag()
    
    //temp
    let viewModel = DeliveryMenuViewModel()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        attribute()
        layout()
        bind(viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: DeliveryMenuViewModel) {
        let dataSource = viewModel.dataSource()
        Observable.just(viewModel.data)
            .bind(to: self.collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        self.collectionView.rx.itemSelected
            .bind(to: viewModel.itemSelected)
            .disposed(by: disposeBag)
        
        viewModel.presentVC
            .bind { vc in
                self.present(vc, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        self.collectionView.collectionViewLayout = sectionManager.createLayout()
        self.collectionView.register(cellType: DeliveryMenuBannerCell.self)
        self.collectionView.register(cellType: DeliveryMenuSpecialCell.self)
        self.collectionView.register(cellType: DeliveryMenuBasicCell.self)
    }
    
    private func layout() {
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
