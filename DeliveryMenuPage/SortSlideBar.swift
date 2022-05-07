//
//  SortSlideBar.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/07.
//

import UIKit
import RxCocoa
import RxSwift

class SortSlideBar: UICollectionView {
    private let disposeBag = DisposeBag()
    private var cellData: [String]?
    
    init() {
        super.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        attribute()
        layout()
        bind(SortSlideBarViewModel())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: SortSlideBarViewModel) {
        self.cellData = viewModel.cellData
        Driver.just(viewModel.cellData)
            .drive(self.rx.items(cellIdentifier: "SortSlideCell", cellType: SortSlideCell.self)) { row, data, cell in
                cell.setData(title: data)
                cell.layer.cornerRadius = 15
//                if (row == self.startPage) {
//                    cell.backgroundColor = .systemMint
//                    cell.titleLabel.textColor = .white
//                    self.scrollToItem(at: IndexPath(row: row, section: 0), at: .centeredHorizontally, animated: true)
//                }
            }
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        self.register(SortSlideCell.self, forCellWithReuseIdentifier: "SortSlideCell")
        self.delegate = self
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
extension SortSlideBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let slot = self.cellData?[indexPath.row] else { return CGSize.zero }
        var length = slot.size(withAttributes: nil).width*2 + 20
        length = length > 150 ? 150 : length
        return CGSize(width: length , height: CGFloat(self.frame.height)-20)
    }
}
