//
//  NewsTableViewController.swift
//  DeepBlue
//
//  Created by Deepak Dewani on 06/04/16.
//  Copyright © 2016 Deepak Dewani. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    let newsImages = ["mastek"]
    let newsTitles = ["My New Title"]
    let newsDescription = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."]
    
    override func viewDidLoad() {
        super.viewDidLoad()

//      to adjust the height of the tableview cell automatically
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 256.0
        
        
        let tlabel: UILabel = UILabel(frame: CGRectMake(0, 0, 100, 40))
        tlabel.text = "Deep Blue"
        tlabel.textColor = UIColor.whiteColor()
        tlabel.font = UIFont(name: "Futura", size: 25)
        //        tlabel.backgroundColor = UIColor.clearColor()
        tlabel.adjustsFontSizeToFitWidth = true
        //        self.navigationItem.titleView = tlabel
        self.navigationItem.titleView = tlabel
        
        self.tabBarController?.title = "Form"
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        animationFromSide()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("newsCell", forIndexPath: indexPath) as! NewsTableViewCell

        // Configure the cell...
        
        cell.newsImageView.image = UIImage(named: "mastek")
        cell.titleLabel.text = "MESCO"
        cell.descriptionLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
//        cell.setNeedsUpdateConstraints()
//        cell.updateConstraintsIfNeeded()
//        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    
    func animationFromSide(){
        
        let cells = tableView.visibleCells
        
        for cell in cells {
            let cell: UITableViewCell = cell as UITableViewCell
            cell.center.x = self.view.frame.width - 700
        }
        
        var index = 0
        
        for cell in cells {
            let cell: UITableViewCell = cell as UITableViewCell
            UIView.animateWithDuration(0.7, delay: 0.05 * Double(index), usingSpringWithDamping: 3, initialSpringVelocity: 4, options: UIViewAnimationOptions.CurveEaseIn, animations: ({
                cell.center.x = self.view.frame.width / 2
                
            }), completion: nil)
            
            index += 1
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
