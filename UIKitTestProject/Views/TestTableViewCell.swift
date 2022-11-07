//
//  TestTableViewCell.swift
//  UIKitTestProject
//
//  Created by hideto.higashi on 2022/11/07.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    static let identifier: String = "TestTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
