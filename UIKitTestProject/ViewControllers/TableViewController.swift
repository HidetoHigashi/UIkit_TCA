//
//  TableViewController.swift
//  UIKitTestProject
//
//  Created by hideto.higashi on 2022/11/07.
//

import SwiftUI
import UIKit

class TableViewController: UIViewController {

    private let testTable: UITableView = {
        let table: UITableView = UITableView()
        table.register(TestTableViewCell.self, forCellReuseIdentifier: TestTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(testTable)
        
        testTable.delegate = self
        testTable.dataSource = self
    }
    
    override func viewWillLayoutSubviews() {
        testTable.frame = self.view.bounds
    }
}

struct TableViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = TableViewController()
        return UIViewReresented(makeUIView: { _ in vc.view })
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCell.identifier, for: indexPath) as? TestTableViewCell else { return UITableViewCell() }
        cell.textLabel?.text = "テスト\(indexPath.row)"
        cell.backgroundColor = .red
        return cell
    }
    
    
}
