//
//  SecondViewController.swift
//  Final_project
//
//  Created by evanlou on 11/6/19.
//  Copyright © 2019 evanlou. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var tableView: UITableView!
    
    let cellHeight: CGFloat = 60
    let reuseIdentifier = "settingCellReuse"
    var settingTableCells: [TableCellItem]!
    var preferenceTableCells: [TableCellItem]!
    var timerTableCells: [TableCellItem]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationItem.title = "Setting"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        let login = TableCellItem(title: "Login", icon: "login.png")
        let signUp = TableCellItem(title: "Sign-up", icon: "login.png")
        settingTableCells = [login, signUp]
        preferenceTableCells = [login]
        timerTableCells = [login]

        setUpConstraints()
    }
    
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension SecondViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return settingTableCells.count
        case 1:
            return preferenceTableCells.count
        default:
            return timerTableCells.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingTableViewCell
        
        switch indexPath.section {
        case 0:
            let tableCell = settingTableCells[indexPath.item]
            cell.configure(for: tableCell)
        case 1:
            let tableCell = preferenceTableCells[indexPath.item]
            cell.configure(for: tableCell)
        default:
            let tableCell = timerTableCells[indexPath.item]
            cell.configure(for: tableCell)
        }
        cell.selectionStyle = .none
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch (section) {
//            case 0:
//                return "Setting"
//            case 1:
//                return "Preference"
//            default:
//                return "Timer"
//        }
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        switch (section) {
            case 0:
                headerLabel.text = "Setting"
            case 1:
                headerLabel.text = "Preference"
            default:
                headerLabel.text = "Timer"
        }
        headerLabel.backgroundColor = UIColor(white: 0.8, alpha: 0.4)
        headerLabel.font = UIFont.systemFont(ofSize: 14)
        headerLabel.textColor = UIColor(white: 0.4, alpha: 1)
        headerLabel.textAlignment = .center
//        headerLabel.translatesAutoresizingMaskIntoConstraints = false
//        headerLabel.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 20).isActive = true
//        headerLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
//        headerLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        return headerLabel
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0, indexPath.row == 0 {
            let loginView = LoginViewController()
            navigationController?.pushViewController(loginView, animated: true)
        } else if indexPath.section == 0, indexPath.row == 1 {
            let signUpView = SignUpViewController()
            navigationController?.pushViewController(signUpView, animated: true)
        }
    }
}
