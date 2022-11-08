//
//  ModalViewController.swift
//  UIKitTestProject
//
//  Created by hideto.higashi on 2022/11/07.
//
import SwiftUI
import ComposableArchitecture
import UIKit

class ModalViewController: UIViewController {
    
    private let tableViewController = TableViewController()
    private var modalLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "モーダル"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button: UIButton = UIButton(type: .system)
        let buttonImage: UIImage? = UIImage(systemName: "xmark.circle.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        button.setImage(buttonImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        return button
    }()
    
    private lazy var testTable: UITableView = {
        let table: UITableView = tableViewController.testTable
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        self.view.addSubview(modalLabel)
        self.view.addSubview(closeButton)
        
        testTable.delegate = tableViewController.self
        testTable.dataSource = tableViewController.self
        
        self.view.addSubview(testTable)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let modalLabelConstraints = [
            modalLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            modalLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        let closeButtonConstraints = [
            closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)
        ]
        let testTableConstraints = [
            testTable.topAnchor.constraint(equalTo: modalLabel.bottomAnchor, constant: 10),
        ]

        NSLayoutConstraint.activate(modalLabelConstraints)
        NSLayoutConstraint.activate(closeButtonConstraints)
        NSLayoutConstraint.activate(testTableConstraints)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        testTable.frame = CGRect(x: 0,
                                 y: modalLabel.frame.height + 20,
                                 width: UIScreen.main.bounds.width,
                                 height: UIScreen.main.bounds.height)
    }
    
    @objc private func closeModal() {
        self.dismiss(animated: true)
    }
}

struct ModalViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = ModalViewController()
        return UIViewReresented(makeUIView: { _ in vc.view })
    }
}



