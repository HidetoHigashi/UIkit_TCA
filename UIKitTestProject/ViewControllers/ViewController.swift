//
//  ViewController.swift
//  UIKitTestProject
//
//  Created by hideto.higashi on 2022/11/07.
//

import SwiftUI
import Combine
import UIKit
import ComposableArchitecture

class ViewController: UIViewController {
    let viewStore: ViewStoreOf<Test>
    private var cancellables: Set<AnyCancellable> = []
    
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var testTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testButton.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
        testTextField.addTarget(self, action: #selector(changeText(sender: )), for: .editingChanged)
        
        self.view.addSubview(testButton)
        self.view.addSubview(testTextField)

        applyConstraints()
        applyPublisher()
    }
    
    
    private func applyConstraints() {
        let testButtonConstraints = [
            testButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            testButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        
        let testTextFieldConstraints = [
            testTextField.topAnchor.constraint(equalTo: testButton.bottomAnchor, constant: 10),
            testTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            testTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(testButtonConstraints)
        NSLayoutConstraint.activate(testTextFieldConstraints)
    }
    
    private func applyPublisher() {
        self.viewStore.publisher.text
            .assign(to: \.text, on: testTextField)
            .store(in: &self.cancellables)
        
        self.viewStore.publisher.alert
            .sink { [weak self] alert in
                guard let self = self else { return }
                guard let alert = alert else { return }
                let title: String = String(state: alert.title)
                let message: String = String(state: alert.message ?? TextState(""))
                
                let alertContoller = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alertContoller.addAction(UIAlertAction(title: "はい", style: .default) { _ in
                    self.viewStore.send(.onDismissAlert("はい"))
                })
                alertContoller.addAction(UIAlertAction(title: "いいえ", style: .destructive) { _ in
                    self.viewStore.send(.onDismissAlert("いいえ"))
                })
                self.present(alertContoller, animated: true, completion: nil)
            }
            .store(in: &self.cancellables)
    }
    
    @objc func onTapButton() {
        self.viewStore.send(.onTapButton)
    }
    
    @objc func changeText(sender: UITextField) {
        self.viewStore.send(.textChange(sender.text ?? ""))
    }
}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        let store: StoreOf<Test> = Store(initialState: Test.State(), reducer: Test())
        let vc = ViewController(store: store)
        
        return UIViewReresented(makeUIView: { _ in vc.view })
    }
}

