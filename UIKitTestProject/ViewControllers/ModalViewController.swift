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
    
    private lazy var closeButton: UIButton = {
        let button: UIButton = UIButton(type: .system)
        let buttonImage: UIImage? = UIImage(systemName: "xmark.circle.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        button.setImage(buttonImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        self.view.addSubview(modalLabel)
        self.view.addSubview(closeButton)
        
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
        
        
        NSLayoutConstraint.activate(modalLabelConstraints)
        NSLayoutConstraint.activate(closeButtonConstraints)
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



