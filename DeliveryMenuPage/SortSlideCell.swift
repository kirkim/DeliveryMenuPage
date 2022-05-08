//
//  SortSlideCell.swift
//  DeliveryMenuPage
//
//  Created by 김기림 on 2022/05/07.
//

import UIKit
import SnapKit

class SortSlideCell: UICollectionViewCell {
    let titleLabel = SortSlidePaddingLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isValid(_ isValid: Bool) {
        if (isValid) {
            self.backgroundColor = .systemMint
            self.titleLabel.textColor = .white
        } else {
            self.backgroundColor = .clear
            self.titleLabel.textColor = .black
        }
    }
    
    private func attribute() {
        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor = .black
        self.layer.cornerRadius = self.frame.height/2
    }
    
    private func layout() {
        [titleLabel].forEach {
            self.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    func setData(title: String) {
        self.titleLabel.text = title
    }
}

class SortSlidePaddingLabel: UILabel {
    private var padding = UIEdgeInsets(top: 0, left: 10.0, bottom: 0, right: 10.0)

    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right

        return contentSize
    }
}
