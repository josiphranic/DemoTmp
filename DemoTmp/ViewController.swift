//
//  ViewController.swift
//  Demo1
//
//  Created by Josip Hranic on 26.04.2022..
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let tableView = UITableView()
    private let data: [Int: [String]] = [0 : ["Jason", "Alex", "Sloan"],
                                         1: ["Jimmy", "Brian", "Kristina"],
                                         2: ["Pavel", "Naima", "Ali"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupTableView()
        layout()
    }
}

private extension ViewController {

    func addSubviews() {
        view.addSubview(tableView)
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func layout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data[section]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let text = data[indexPath.section]?[indexPath.row]
        cell.textLabel?.text = text
        
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Section \(section) 😁" // I don't see section names from google meet comment any more so I will write this 😁
    }
}
