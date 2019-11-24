//
//  FirstViewController.swift
//  Final_project
//
//  Created by evanlou on 11/6/19.
//  Copyright © 2019 evanlou. All rights reserved.
//

import UIKit

protocol TimerSetupDelegate: class {
    func timerSetup(newTitle: String, newDuration: String)
}

protocol TimerDeleteDelegate: class {
    func timerDelete(selectedCell: UICollectionViewCell)
}

class FirstViewController: UIViewController {
    
    var timerCollectionView: UICollectionView!
    var addBtn: UIButton!
    var editBtn: UIBarButtonItem!
    
    let padding: CGFloat = 8
    let timerCellReuseIdentifier = "timer"
    
    var timers: Array<TimerData> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "first view"
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTimer))
        editBtn = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAndDelete))
        navigationItem.leftBarButtonItem = editBtn

        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            timerCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            timerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            timerCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            timerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ]);
    }
    
    
    @objc func addTimer() {
        let timerSetupView = TimerSetupViewController()
        timerSetupView.delegate = self
        present(timerSetupView, animated: true, completion: nil)
    }
    
    @objc func editAndDelete() {
        if (editBtn.title == "Edit") {
            editBtn.title = "Done"
        } else {
            editBtn.title = "Edit"
        }
    }

}

extension FirstViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: timerCellReuseIdentifier, for: indexPath) as! TimerCollectionViewCell
        cell.configure(for: timers[indexPath.row])
        cell.parentViewController = self
        return cell
    }
}

extension FirstViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width)
        return CGSize(width: size, height: size/5)
    }
}

extension FirstViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.reloadData()
    }

}

extension FirstViewController: TimerSetupDelegate {
    func timerSetup(newTitle: String, newDuration: String) {
        let timer = TimerData(backgroundImage: "iphone.jpg", duration: newDuration, title: newTitle)
        timers.append(timer)
        self.timerCollectionView.insertItems(at: [IndexPath(item: timers.count-1, section: 0)])
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
