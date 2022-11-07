//
//  ViewController.swift
//  UIKitTestProject
//
//  Created by hideto.higashi on 2022/11/07.
//

import SwiftUI
import UIKit
import ComposableArchitecture

class ViewController: UIViewController {
    let viewStore: ViewStoreOf<Test>

    init(store: StoreOf<Test>) {
        self.viewStore = ViewStore(store)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var testButton: UIButton = {
        let button: UIButton = UIButton(type: .system)
        button.setTitle("テスト", for: .normal)
//        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testButton.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
        self.view.addSubview(testButton)

        applyConstraints()
    }
    
    
    private func applyConstraints() {
        let testButtonConstraints = [
            testButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            testButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(testButtonConstraints)
    }
    
    @objc func onTapButton() {
        self.viewStore.send(.onTapButton)
    }
}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        let store: StoreOf<Test> = Store(initialState: Test.State(), reducer: Test())
        let vc = ViewController(store: store)
        
        return UIViewReresented(makeUIView: { _ in vc.view })
    }
}

