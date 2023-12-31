//
//  ToDoTableViewCell.swift
//  Pomidorro
//
//
//

import Foundation
import UIKit
import SnapKit

class ToDoTableViewCell: UITableViewCell {
    //MARK: -Variable-
    let leftImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "list.dash.header.rectangle")
        img.tintColor = .black
        img.clipsToBounds = true
        img.layer.cornerRadius = img.frame.height / 2
        return img
    }()
    
    let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Finish first task"
        lbl.font = .systemFont(ofSize: 20, weight: .heavy)
        lbl.textColor = .black
        return lbl
    }()
    
    let subAmountbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Finish first task"
        lbl.font = .systemFont(ofSize: 10, weight: .light)
        lbl.textColor = .black
        return lbl
    }()
    
    let threeSomeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        btn.tintColor = .systemGray
        return btn
    }()
    
    //MARK: -LifeCycle-
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: -functions-
    func configureWith(item: TaskData) {
        nameLbl.text = item.title
        subAmountbl.text = item.subtitle
        leftImage.image = item.image ?? UIImage(named: "list.dash.header.rectangle")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        
        let currentDate = Date()
        if item.date < currentDate {
            backgroundColor = UIColor.systemRed.withAlphaComponent(0.3)
        } else {
            backgroundColor = UIColor.white
        }
    }
}
extension ToDoTableViewCell {
    private func setUpViews() {
        addSubview(leftImage)
        addSubview(nameLbl)
        addSubview(subAmountbl)
        addSubview(threeSomeBtn)
    }
    
    private func setUpConstraints() {
        leftImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(5)
        }
        
        nameLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalTo(leftImage.snp.trailing).offset(10)
        }
        
        subAmountbl.snp.makeConstraints { make in
            make.top.equalTo(nameLbl.snp.bottom).offset(2)
            make.leading.equalTo(leftImage.snp.trailing).offset(10)
        }
        threeSomeBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailingMargin.equalToSuperview().offset(-10)
        }
    }
}
