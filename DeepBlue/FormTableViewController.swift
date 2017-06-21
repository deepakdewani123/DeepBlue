//
//  FormTableViewController.swift
//  DeepBlue
//
//  Created by Deepak Dewani on 13/03/16.
//  Copyright © 2016 Deepak Dewani. All rights reserved.
//

import UIKit
//import CoreData

class FormTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var thingLabel: UILabel!
    
    @IBOutlet weak var categoryCell1: UITableViewCell!
    @IBOutlet weak var categoryCell2: UITableViewCell!
    @IBOutlet weak var categoryCell3: UITableViewCell!
    
    var item = ""
    
    let dateFormatter = NSDateFormatter()
    let timeFormatter  = NSDateFormatter()
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    //    var selected = [String]()
    
    func delay(seconds seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
        
        dispatch_after(popTime, dispatch_get_main_queue()) {
            completion()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.allowsMultipleSelection = true
        
        
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        timeFormatter.dateFormat = "hh:mm a"
        
        let strDate = dateFormatter.stringFromDate(NSDate())
        let strTime = timeFormatter.stringFromDate(NSDate())
        
        dateLabel.text = strDate
        timeLabel.text = strTime
        
        datePicker.date = NSDate()
        //        dateLabel.text = "\(dobDatePicker.date)" // my label in cell above
        datePicker.hidden = true
        
        categoryCell1.hidden = true
        categoryCell2.hidden = true
        categoryCell3.hidden = true
        
        
        let tlabel: UILabel = UILabel(frame: CGRectMake(0, 0, 100, 40))
        tlabel.text = "Deep Blue"
        tlabel.textColor = UIColor.whiteColor()
        tlabel.font = UIFont(name: "Futura", size: 25)
        //        tlabel.backgroundColor = UIColor.clearColor()
        tlabel.adjustsFontSizeToFitWidth = true
        //        self.navigationItem.titleView = tlabel
        self.navigationItem.titleView = tlabel
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        print(NSUUID().UUIDString)
    }
    
    
    @IBAction func dateChanges(sender: AnyObject) {
        
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        timeFormatter.dateFormat = "hh:mm a"
        
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        let strTime = timeFormatter.stringFromDate(datePicker.date)
        
        dateLabel.text = strDate
        timeLabel.text = strTime
        
    }
    
    

    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 1 && indexPath.row == 1 {
            let height:CGFloat = datePicker.hidden ? 0.0 : 216.0
            return height
        }
        else if indexPath.section == 0 && indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 {
            let height:CGFloat = categoryCell3.hidden ? 0.0 : 38.0
            return height
        }
        
        return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        let index = NSIndexPath(forRow: 1, inSection: 0)
//        
//        if index == indexPath {
//        item = (categoryCell1.textLabel?.text)!
//        print(item)
//        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
//        print(indexPath.row,indexPath.section)
        
        if indexPath.section == 0 && indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 {
            
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            
            if cell!.accessoryType == .Checkmark {
                
                tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.None
                //                self.selected.removeAtIndex(indexPath.row)
            }
            else {
                tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
            }
        }
        
        let datePickerIndexPath = NSIndexPath(forRow: 0, inSection: 1)
        let thingsPickerIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        
        if datePickerIndexPath == indexPath {
            
            if datePicker.hidden {
                self.dateLabel.textColor = UIColor.redColor()
                self.timeLabel.textColor = UIColor.redColor()
            }
            else {
                self.dateLabel.textColor = UIColor.blackColor()
                self.timeLabel.textColor = UIColor.blackColor()
            }
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.tableView.beginUpdates()
                // apple bug fix - some TV lines hide after animation
                self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
                self.datePicker.hidden = !self.datePicker.hidden
                self.tableView.endUpdates()
            })
        }
            
        else if thingsPickerIndexPath == indexPath {
            
            if categoryCell1.hidden {
                thingLabel.textColor = UIColor.redColor()
            }
            else {
                thingLabel.textColor = UIColor.blackColor()
            }
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.tableView.beginUpdates()
                // apple bug fix - some TV lines hide after animation
                self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
                self.categoryCell1.hidden = !self.categoryCell1.hidden
                self.categoryCell2.hidden = !self.categoryCell2.hidden
                self.categoryCell3.hidden = !self.categoryCell3.hidden
                self.tableView.endUpdates()
            })
            
        }
    }
    
    
    @IBAction func doneButton(sender: AnyObject) {
        
        var sweetAlert = SweetAlert()
        
//        SwiftSpinner.show("Please wait!\nUploading data to the server")
        
        self.delay(seconds: 2) { () -> () in
//            SwiftSpinner.hide()
            
            sweetAlert.showAlert("Congratulations!", subTitle: "Thank you for being generous and helping someone with your donation", style: .Success, buttonTitle: "Done", buttonColor: UIColor.darkRed(), action: { (isOtherButton) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
        }
        
        let date = NSDate()
        
        let mynotification = date.dateByAddingTimeInterval(7)
        
        let settings = UIUserNotificationSettings(forTypes: [.Alert,.Badge,.Sound], categories: nil)
        
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        
        //notification
        let notification = UILocalNotification()
        notification.alertTitle = "Good news"
        notification.alertBody = "your donations have helped someone to go to school!"
        notification.fireDate = mynotification
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://citron.cloudapp.net/api/sexy.php?uid=13001&items=NewsPaper")!)
        
        request.HTTPMethod = "POST"
        
//        let postString = "method=getPlaces&key=leuk12&secret=gammayz&sessionid=8d7233a4dbdd1dd41a421f061f1c6e52&token=36e0fd22f571c0f27016ce5974bb20efb30ceed63e2624f9b2d94c4c0e2d8ff5"
//        
//        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }
        
        task.resume()
     
        defaults.setObject(true, forKey: "firstDonation")
        
        
    }
    
//    func saveToCoreData() {
//        
//        let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        //reference managed object context
//        let context : NSManagedObjectContext = appDelegate.managedObjectContext
//        
//        let entity =  NSEntityDescription.entityForName("UserEvents",
//            inManagedObjectContext:context)
//        
//        let newItem = Model(entity: entity!,
//            insertIntoManagedObjectContext: context)
//        
//        newItem.eventName = eventName
//        newItem.userName = userName
//        //        newItem.eventImage = eventImage
//        
//        do {
//            try context.save()
//        }
//        catch let error as NSError {
//            print(error)
//        }
//    }
    
    
    //
    //    // MARK: - UIPickerControllerDelegate Methods
    //
    //    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    //        return 1
    //    }
    //
    //    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //        print(things[row])
    //
    //        thingLabel.text = things[row]
    //    }
    //
    //
    //    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //
    //        return things.count
    //    }
    //
    //    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //
    //        print(things[row])
    //
    //        return things[row]
    //    }
    
    //    @IBAction func clickPhoto() {
    //
    //        let imagePicker = UIImagePickerController()
    //        imagePicker.delegate = self
    //        imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
    //        //        imagePicker.cameraDevice = .Front
    //        //        imagePicker.allowsEditing = true
    //
    //        self.presentViewController(imagePicker, animated: true, completion: nil)
    //
    //    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
    //
    //    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    //        picker.dismissViewControllerAnimated(true, completion: nil)
    //    }
    //
    //    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    //        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
    //
    //            imageView.contentMode = .ScaleAspectFill
    //            imageView.image = pickedImage
    //
    //        }
    //
    //        dismissViewControllerAnimated(true, completion: nil)
    //    }
    
    
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
