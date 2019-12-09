//
//  ThirdViewController.swift
//  Final_project
//
//  Created by evanlou on 12/6/19.
//  Copyright © 2019 evanlou. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
//    weak var delegate: ToDoToTimerDelegate?
    
    var tableView: UITableView!
    var addToDoTextField: UITextField!
//    var addBoxView: UIView!
//    var addIcon: UIImageView!
    
    let padding: CGFloat = 10
    let cellHeight: CGFloat = 80
    let reuseIdentifier = "todoCellReuse"
    let placeHolderText = "To-Do Item"
    var toDoTableCells: [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        navigationItem.title = "To-Dos"
        UINavigationBar.appearance().isOpaque = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        
//        addBoxView = UIView()
//        addBoxView.translatesAutoresizingMaskIntoConstraints = false
//        addBoxView.backgroundColor = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 0.5)
//        view.addSubview(addBoxView)
        
        addToDoTextField = UITextField()
        addToDoTextField.font = UIFont.systemFont(ofSize: 20)
        addToDoTextField.textColor = UIColor.init(white: 0.3, alpha: 0.9)
        addToDoTextField.backgroundColor = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 0.5)
        addToDoTextField.layer.cornerRadius = 8
        addToDoTextField.placeholder = placeHolderText
        addToDoTextField.translatesAutoresizingMaskIntoConstraints = false
        addToDoTextField.addTarget(self, action: #selector(addToDo), for: .editingDidEndOnExit)
        view.addSubview(addToDoTextField)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.addToDoTextField.frame.height))
        addToDoTextField.leftView = paddingView
        addToDoTextField.leftViewMode = UITextField.ViewMode.always
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToDo))
        
        NotificationCenter.default.addObserver(self, selector: #selector(moveScreenUp(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveScreenDown(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
        setUpConstraints()
    }
    
    
    func setUpConstraints() {
//        NSLayoutConstraint.activate([
//            addBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
//            addBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
//            addBoxView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
//            addBoxView.heightAnchor.constraint(equalToConstant: 50)
//        ])
        
        NSLayoutConstraint.activate([
            addToDoTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            addToDoTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            addToDoTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            addToDoTextField.heightAnchor.constraint(equalToConstant: 50)
        ]);
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: addToDoTextField.topAnchor, constant: -padding)
        ])
    }
    
    @objc func addToDo() {
        if let textInput = addToDoTextField.text, textInput != "" {
            toDoTableCells.append(ToDo(title: textInput))
            let indexPath: IndexPath = IndexPath(row: toDoTableCells.count-1, section: 0)
            tableView.insertRows(at: [indexPath], with: .fade)
        }
    }
    
    @objc func moveScreenUp(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height - 85
            }
        }
    }
    
    @objc func moveScreenDown(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height - 85
            }
        }
        addToDoTextField.text = ""
        
    }
    
}

extension ThirdViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoTableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ToDoTableViewCell
//        cell.configure(title: toDoTableCells[indexPath.item].mTitle)
        cell.configure(toDo: toDoTableCells[indexPath.item])
        cell.selectionStyle = .none
        return cell
    }

}

extension ThirdViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoTableCells.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = self.tableView.cellForRow(at: indexPath)
        print(toDoTableCells[indexPath.item].mfinished)
    }
    
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let addToTimer = addToTimerAction(indexPath: indexPath)
//        return UISwipeActionsConfiguration(actions: [addToTimer])
//    }
    
//    func addToTimerAction(indexPath: IndexPath) -> UIContextualAction {
//        let toDo = toDoTableCells[indexPath.item]
//        let action = UIContextualAction(style: .normal, title: "Add To timer") { (action, view, completion) in
//            print(1)
////            NotificationCenter.default.post(name: Notification.Name("NewFunctionName"), object: nil)
//            self.delegate?.toDoToTimer(newTitle: toDo.mTitle, newDuration: "25")
//        }
//        action.image = UIImage(named: "clock.png")
//        action.backgroundColor = .green
//        return action
//    }
}

