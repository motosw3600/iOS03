//
//  SearchTermButton.swift
//  Routinus
//
//  Created by 박상우 on 2021/11/10.
//

import UIKit

class PopularTermButton: UIButton {
    var term: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
