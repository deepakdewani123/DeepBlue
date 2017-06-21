//
//  ProfileViewController.swift
//  DeepBlue
//
//  Created by Deepak Dewani on 07/04/16.
//  Copyright © 2016 Deepak Dewani. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var profilePhoto: UIImageView!
    
    @IBOutlet weak var leagueImageView: UIImageView!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        profilePhoto.layer.borderColor = UIColor.whiteColor().CGColor
        profilePhoto.layer.cornerRadius = profilePhoto.bounds.height / 2
        profilePhoto.clipsToBounds = true
        profilePhoto.layer.borderWidth = 3.0
        
        
        leagueImageView.layer.borderColor = UIColor.darkRed().CGColor
        leagueImageView.clipsToBounds = true
        leagueImageView.layer.borderWidth = 1.0
        leagueImageView.layer.cornerRadius = 10

        }
    
    override func viewDidAppear(animated: Bool) {
        
        let first = defaults.boolForKey("firstDonation") 
        
        if first == true {
            leagueImageView.image = UIImage(named: "gold")
        }
        else {
            leagueImageView.image = UIImage(named: "silver")

        }
        
        UIView.animateWithDuration(0.8, delay: 0.0, usingSpringWithDamping: 2, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            
            self.leagueImageView.transform = CGAffineTransformMakeTranslation(0, 0)
            
            }, completion: nil)
    }

    
    override func viewWillAppear(animated: Bool) {
        self.leagueImageView.transform = CGAffineTransformMakeTranslation(0, self.view.frame.height)

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
