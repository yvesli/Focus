//
//  FirstViewController.swift
//  Final_project
//
//  Created by evanlou on 11/6/19.
//  Copyright © 2019 evanlou. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {
    enum mode {
        case select
        case view
    }
    
    var timerCollectionView: UICollectionView!
    var addBtn: UIBarButtonItem!
    var editBtn: UIBarButtonItem!
    var deleteBtn: UIBarButtonItem!
    var trashButton: UIButton!
    var dictionaryIndexPath: [IndexPath: Bool] = [:]
    var currentCell: IndexPath? = nil
    
    let padding: CGFloat = 15
    let timerCellReuseIdentifier = "timer"
    
    var timers: Array<TimerData> = []
    var mMode: mode = .view
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Timer"
        UINavigationBar.appearance().isOpaque = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = padding
        
        timerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        timerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        timerCollectionView.backgroundColor = .white
        timerCollectionView.register(TimerCollectionViewCell.self, forCellWithReuseIdentifier: timerCellReuseIdentifier)
        timerCollectionView.dataSource = self
        timerCollectionView.delegate = self
        view.addSubview(timerCollectionView)
        
        addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTimer))
        editBtn = UIBarButtonItem(title: "EDIT", style: .plain, target: self, action: #selector(edit))
        deleteBtn = UIBarButtonItem(title: "DELETE", style: .plain, target: self, action: #selector(deleteTimer))
        navigationItem.leftBarButtonItem = editBtn
        navigationItem.rightBarButtonItem = addBtn

        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            timerCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            timerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            timerCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            timerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    
    @objc func addTimer() {
        
        let timerSetupView = TimerSetupViewController()
        timerSetupView.delegate = self
        present(timerSetupView, animated: true, completion: nil)
    }
    
    @objc func edit() {
        switch mMode {
        case .select:
            editBtn.title = "Edit"
            navigationItem.rightBarButtonItem = addBtn
            dictionaryIndexPath.removeAll()
            timerCollectionView.reloadData()
            mMode = .view
        case .view:
            editBtn.title = "Done"
            navigationItem.rightBarButtonItem = deleteBtn
            mMode = .select
        }
    }
    
    @objc func deleteTimer() {
        var itemToDelete: [IndexPath] = []
        for (path, isSelected) in dictionaryIndexPath {
            if isSelected {
                itemToDelete.append(path)
            }
        }
        for indexPath in itemToDelete.sorted(by: { $0.item > $1.item }) {
            timers.remove(at: indexPath.item)
        }
        timerCollectionView.deleteItems(at: itemToDelete)
        dictionaryIndexPath.removeAll()
    }
    
    
}

extension FirstViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: timerCellReuseIdentifier, for: indexPath) as! TimerCollectionViewCell
//        switch mMode {
//        case .view:
//            cell.configureForView(for: timers[indexPath.row])
//        case .select:
//            cell.configureForView(for: timers[indexPath.row])
//        }
//        return cell
        cell.parentViewController = self
        cell.configureForView(for: timers[indexPath.row])
        return cell
    }
}

extension FirstViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width)
        return CGSize(width: size, height: size/4)
    }
}

extension FirstViewController: UICollectionViewDelegate {
    
    // delete the highlighted timer cells
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        switch mMode {
        case .view:
            break
        case .select:
            if !dictionaryIndexPath.keys.contains(indexPath) {
                dictionaryIndexPath[indexPath] = false
            }
            print(dictionaryIndexPath[indexPath]!)
            if let cell = collectionView.cellForItem(at: indexPath) as? TimerCollectionViewCell {
                if dictionaryIndexPath[indexPath]! {
                    cell.removeSelectedEffect()
                    dictionaryIndexPath[indexPath] = false
                } else {
                    cell.addSelectedEffect()
                    dictionaryIndexPath[indexPath] = true
                }
            }
        }
    }

    // select timer cell for setting
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           switch mMode {
           case .view:
               let cell = collectionView.cellForItem(at: indexPath) as! TimerCollectionViewCell
               let timerSetup = TimerSetupViewController(currentCell: cell, title: cell.title.text ?? "")
               currentCell = indexPath
               timerSetup.delegate = self
               navigationController?.present(timerSetup, animated: true, completion: nil)
//               collectionView.reloadData()
           case .select:
               break
            }
       }
}

extension FirstViewController: TimerSetupDelegate {    
    func timerSetup(newTitle: String?, newDuration: String?) {
        let timer = TimerData(backgroundImage: "iphone.jpg", duration: newDuration!, title: newTitle!)
        if let i = currentCell?.row {
            timers[i] = timer
            currentCell = nil
        } else {
            timers.append(timer)
            self.timerCollectionView.insertItems(at: [IndexPath(item: timers.count-1, section: 0)])
        }
        timerCollectionView.reloadData()
    }
}

extension FirstViewController: TimerDeleteDelegate {
    func timerDelete(selectedCell: UICollectionViewCell) {
        if let indexPath = self.timerCollectionView.indexPath(for: selectedCell) {
            timers.remove(at: indexPath.item)
            self.timerCollectionView.deleteItems(at: [indexPath])
        }
    }
}
