//
//  TopSlideBar.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/06.
//

import UIKit
import RxCocoa
import RxSwift

class TopSlideBar: UICollectionView {
    private let disposeBag = DisposeBag()
    private var cellData: [StoreType]?
    private let startPage: Int
    private var flag:Bool = false
    private var selectedRow: Int
    
    init(startPage: Int) {
        self.startPage = startPage
        self.selectedRow = startPage
        super.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: TopSlideBarViewModel) {
        self.cellData = viewModel.cellData
        Driver.just(viewModel.cellData)
            .drive(self.rx.items(cellIdentifier: "TopSlideCell", cellType: TopSlideCell.self)) { [weak self] row, data, cell in
                cell.setData(title: data.title)
                if ((self?.flag == false)) {
                    self?.scrollToItem(at: IndexPath(row: row, section: 0), at: .centeredHorizontally, animated: false)
                }
                if ((row == self?.startPage && self?.flag == false) || (row == self?.selectedRow)) {
                    self?.flag = true
                    cell.isValid(true)
                }
            }
            .disposed(by: disposeBag)
        
        self.rx.itemSelected
            .map { $0.row }
            .distinctUntilChanged()
            .bind(to: viewModel.itemSelected)
            .disposed(by: disposeBag)
        
        viewModel.slotChanged
            .bind { [weak self] row in
                self?.visibleCells.forEach { cell in
                    (cell as? TopSlideCell)?.isValid(false)
                }
                let indexPath = IndexPath(row: row, section: 0)
                guard let cell = self?.cellForItem(at: indexPath) as? TopSlideCell else { return }
                cell.isValid(true)
                self?.selectedRow = row
                self?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        self.backgroundColor = .brown
        self.register(TopSlideCell.self, forCellWithReuseIdentifier: "TopSlideCell")
        self.delegate = self
        self.showsHorizontalScrollIndicator = false
    }
    
    private func layout() {
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
        }
    }
}


//MARK: - TopSlideBar: UICollectionViewDelegateFlowLayout
extension TopSlideBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let slot = self.cellData?[indexPath.row] else { return CGSize.zero }
        var length = slot.title.size(withAttributes: nil).width*2 + 20
        length = length > 150 ? 150 : length
        return CGSize(width: length , height: CGFloat(self.frame.height))
    }
}
