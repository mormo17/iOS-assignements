//
//  ViewController.swift
//  Bidirectional Layout
//
//  Created by Mariam on 12/14/20.
//

import UIKit

class ViewController: UIViewController {
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp(){
        registerCells()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func registerCells(){
        tableView.register(RedCell.nib(), forCellReuseIdentifier: RedCell.identifier)
        tableView.register(BlueCell.nib(), forCellReuseIdentifier: BlueCell.identifier)
        tableView.register(YellowCell.nib(), forCellReuseIdentifier: YellowCell.identifier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: BlueCell.identifier, for: indexPath)
        } else if indexPath.row == 2 {
            cell = tableView.dequeueReusableCell(withIdentifier: YellowCell.identifier, for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: RedCell.identifier, for: indexPath)
        }
        
        return cell
    }
}

