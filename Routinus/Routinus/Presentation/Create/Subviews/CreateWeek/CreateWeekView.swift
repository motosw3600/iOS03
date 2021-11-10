//
//  CreateWeekView.swift
//  Routinus
//
//  Created by 유석환 on 2021/11/09.
//

import UIKit

import SnapKit

final class CreateWeekView: UIView {
    enum WeekTitle: String, CaseIterable {
        case one = "1주"
        case two = "2주"
        case three = "3주"
        case four = "4주"
        case other = "기타"
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "챌린지 기간"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()

    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: WeekTitle.allCases.map { $0.rawValue })
        control.frame = CGRect.zero
        control.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 0
        return control
    }()

    private lazy var weekLeftLabel: UILabel = {
        let label = UILabel()
        label.text = "직접 입력"
        return label
    }()

    private lazy var weekTextField: UITextField = {
        let textField = UITextField()
        textField.text = "1"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        return textField
    }()

    private lazy var weekRightLabel: UILabel = {
        let label = UILabel()
        label.text = "주"
        return label
    }()

    private lazy var endDateView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 1, green: 119/255, blue: 119/255, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor(red: 252/255, green: 209/255, blue: 209/255, alpha: 1)
        return view
    }()

    private lazy var endTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "챌린지 예상 종료일"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var endDateLabel: UILabel = {
        let label = UILabel()
        label.text = "1999.01.01(금)"
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    convenience init() {
        self.init(frame: CGRect.zero)
    }

    @objc private func didChangeValue(_ sender: UISegmentedControl) {
        weekTextField.isEnabled = !(sender.selectedSegmentIndex == 4)
    }
}

extension CreateWeekView {
    private func configure() {
        configureSubviews()
    }

    private func configureSubviews() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.width.equalToSuperview()
            make.height.equalTo(24)
        }

        addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.width.equalToSuperview()
        }

        addSubview(weekLeftLabel)
        weekLeftLabel.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(25)
            make.left.equalToSuperview()
        }

        addSubview(weekTextField)
        weekTextField.snp.makeConstraints { make in
            make.centerY.equalTo(weekLeftLabel.snp.centerY)
            make.left.equalTo(weekLeftLabel.snp.right).offset(20)
            make.width.equalTo(50)
        }

        addSubview(weekRightLabel)
        weekRightLabel.snp.makeConstraints { make in
            make.centerY.equalTo(weekLeftLabel.snp.centerY)
            make.left.equalTo(weekTextField.snp.right).offset(10)
        }

        addSubview(endDateView)
        endDateView.snp.makeConstraints { make in
            make.top.equalTo(weekLeftLabel.snp.bottom).offset(25)
            make.width.equalToSuperview()
            make.height.equalTo(40)
        }
        
        endDateView.addSubview(endTitleLabel)
        endTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        endDateView.addSubview(endDateLabel)
        endDateLabel.snp.makeConstraints { make in
            make.left.equalTo(endTitleLabel.snp.right).offset(10)
            make.centerY.equalToSuperview()
        }
    }
}
