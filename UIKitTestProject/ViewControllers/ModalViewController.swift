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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
    }
}

struct ModalViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = ModalViewController()
        return UIViewReresented(makeUIView: { _ in vc.view })
    }
}



