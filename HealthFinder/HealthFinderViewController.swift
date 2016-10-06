//
//  HealthFinderViewController.swift
//  HealthFinder
//
//  Created by Bryan McLellan on 10/5/16.
//  Copyright © 2016 Bryan McLellan. All rights reserved.
//

import UIKit
import AFNetworking

class HealthFinderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var topics:[NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://healthfinder.gov/developer/MyHFSearch.json?api_key=demo_api_key&who=child&age=16&gender=male")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (dataOrNil, response, err) in
            if let data = dataOrNil {
                if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    // responseDictionary exists!
                    if let results = responseDictionary["Result"] as? NSDictionary {
                        print("response \(results)")
                        self.topics = results["Topics"] as? [NSDictionary]
                        self.tableView.reloadData()
                    }
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let topics = self.topics {
            return topics.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HealthFinderTableViewCell
        cell.titleLabel.text = topics![indexPath.row]["Title"] as? String
        let url = URL(string: topics![indexPath.row]["ImageUrl"] as! String)
        cell.imageView?.setImageWith(url!)
        return cell
//        let newCell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
//        newCell.textLabel?.text = topics![indexPath.row]["Title"] as? String
//        return newCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
