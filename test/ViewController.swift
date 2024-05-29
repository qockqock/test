//
//  ViewController.swift
//  test
//
//  Created by 머성이 on 5/27/24.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var testingViewController: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        testingViewController.backgroundColor = .yellow
        testingViewController.delegate = self
        testingViewController.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = testingViewController.dequeueReusableCell(withIdentifier: "testing", for: indexPath)
        return cell
    }
}
