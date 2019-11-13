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

class FirstViewController: UIViewController {
    
    var timerCollectionView: UICollectionView!
//    var addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTimer))
    var addBtn: UIButton!
    
    let padding: CGFloat = 8
    let timerCellReuseIdentifier = "timer"
//    let timer1 = Timer(backgroundImage: "iphone.jpg", duration: "25", title: "自习")
//    let timer2 = Timer(backgroundImage: "iphone.jpg", duration: "20", title: "自习")
    
    var timers: Array<Timer> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
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
        
        addBtn = UIButton()
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.setTitle("add", for: .normal)
        addBtn.setTitleColor(.black, for: .normal)
        addBtn.addTarget(self, action: #selector(addTimer), for: .touchUpInside)
        view.addSubview(addBtn)
        
//        navigationItem.rightBarButtonItem = addBtn
        
//        timers = [timer1, timer2]
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            timerCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5*padding),
            timerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            timerCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            timerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ]);
        NSLayoutConstraint.activate([
            addBtn.leadingAnchor.constraint(equalTo: timerCollectionView.leadingAnchor),
            addBtn.bottomAnchor.constraint(equalTo: timerCollectionView.topAnchor, constant: -20),
            addBtn.widthAnchor.constraint(equalToConstant: 100),
            addBtn.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    @objc func addTimer() {
        let timerSetupView = TimerSetupViewController()
        timerSetupView.delegate = self
        present(timerSetupView, animated: true, completion: nil)
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
        let timer = Timer(backgroundImage: "iphone.jpg", duration: newDuration, title: newTitle)
        timers.append(timer)
        timerCollectionView.reloadData()
    }
}
