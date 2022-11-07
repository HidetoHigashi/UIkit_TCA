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
    
    private var modalLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "モーダル"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        self.view.addSubview(modalLabel)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let modalLabelConstraints = [
            modalLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            modalLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(modalLabelConstraints)
    }
}

struct ModalViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = ModalViewController()
        return UIViewReresented(makeUIView: { _ in vc.view })
    }
}



