//
//  DonationsTableViewController.swift
//  DeepBlue
//
//  Created by Deepak Dewani on 08/04/16.
//  Copyright © 2016 Deepak Dewani. All rights reserved.
//

import UIKit

class DonationsTableViewController: UITableViewController {

    var items = ["Newspaper","Clothes","Used Items"]
    var date = ["9 April, 2016","9 April, 2016","9 April, 2016"]
    var bool = true
    
    func delay(seconds seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
        
        dispatch_after(popTime, dispatch_get_main_queue()) {
            completion()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tlabel: UILabel = UILabel(frame: CGRectMake(0, 0, 100, 40))
        tlabel.text = "Deep Blue"
        tlabel.textColor = UIColor.whiteColor()
        tlabel.font = UIFont(name: "Futura", size: 25)
        //        tlabel.backgroundColor = UIColor.clearColor()
        tlabel.adjustsFontSizeToFitWidth = true
        //        self.navigationItem.titleView = tlabel
        self.navigationItem.titleView = tlabel
        
        self.tabBarController?.title = "My Donations"
  
        
    }
    
    override func viewWillAppear(animated: Bool) {
        bool = true
        self.tableView.reloadData()


    }
    override func viewDidAppear(animated: Bool) {
        
//        SwiftSpinner.show("Getting the data\n from the server...")
        
        delay(seconds: 2) { () -> () in
            self.bool = false
            self.tableView.reloadData()
            self.animateTable()
//            SwiftSpinner.hide()
        }
    }
//    override func viewWillAppear(animated: Bool) {
//        animateTable()
//
//    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bool ? 0 : 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("donationCell", forIndexPath: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = "Donated: \(items[indexPath.item])"
        cell.detailTextLabel?.text = "On: \(date[indexPath.item])"
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: animate the tableview cells
    func animateTable() {
        
        let cells = tableView.visibleCells
        
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for cell in cells {
            let cell: UITableViewCell = cell as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for cell in cells {
            let cell: UITableViewCell = cell as UITableViewCell
            UIView.animateWithDuration(0.8, delay: 0.05 * Double(index), usingSpringWithDamping: 2, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0)
                }, completion: nil)
            
            index += 1
        }
        
    }


}
