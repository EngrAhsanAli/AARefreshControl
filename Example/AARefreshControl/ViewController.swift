//
//  ViewController.swift
//  AARefreshControl
//
//  Created by EngrAhsanAli on 06/15/2019.
//  Copyright (c) 2019 EngrAhsanAli. All rights reserved.
//

import UIKit
import AARefreshControl

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl: AARefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        refreshControl = AARefreshControl(scrollView: tableView)
        refreshControl.tintColor = UIColor.black
        refreshControl.activityIndicatorViewColor = UIColor.gray
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
    }

    @objc func refresh(_ sender: Any?) {
        
        refreshControl.beginRefreshing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
            self.refreshControl.endRefreshing()
            print("REFRESHED")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = "NUMBER \(indexPath.row)"
        return cell
    }
    
}
