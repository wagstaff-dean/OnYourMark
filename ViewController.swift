//
//  ViewController.swift
//  OnYourMark
//
//  Created by CTO on 4/26/16.
//  Copyright © 2016 Pocket Me Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var timerDisplayLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    var counterTenthOfASecond   = 0
    var counterSeconds          = 0
    var counterMinutes          = 0
    
    var tenthOfASecondStr   = ""
    var secondsStr          = ""
    var minutesStr          = ""
    
    var timer = Timer()
    
  //  var raceRecordId: CKRecordID!
  //  var raceRecord: CKRecord!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // fetch race record to determin if 
        // Create the alert
        let alert = UIAlertController(title: "Official Race Starter", message: "If you are the Official Race Starter tap Official.  Note there can only be 1 designated Official per race.", preferredStyle: .alert)
        
        // Add the actions (buttons)
        
        alert.addAction(UIAlertAction(title: "Official", style: .destructive, handler: { action in
            // save UUID to cloud to identify official
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Not Official", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)


    }
    
    @IBAction func goButtonPressed(_ sender: AnyObject) {
        timer.invalidate() // just in case this button is tapped multiple times

        if goButton.titleLabel?.text == "GO" {
            counterTenthOfASecond   = 0
            counterSeconds          = 0
            counterMinutes          = 0
            
            tenthOfASecondStr   = ""
            secondsStr          = ""
            minutesStr          = ""

            // start the timer
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)

          //  raceRecordId = CKRecordID(recordName: "ClintonTwpCountryRun1")
            
          //  raceRecord = CKRecord(recordType: "Race", recordID: raceRecordId)
        } else {
        }
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // stop timer
    @IBAction func cancelTimerButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    // called every time interval from the timer
    func timerAction() {
        counterTenthOfASecond += 1
        
        if counterTenthOfASecond == 10 {
            counterSeconds += 1
            counterTenthOfASecond = 00
        }
        
        if counterSeconds == 60 {
            counterMinutes += 1
            counterSeconds = 00
        }
        
        tenthOfASecondStr = "\(counterTenthOfASecond)"
        
        if counterSeconds < 10 {
            secondsStr = "0" + "\(counterSeconds)"
        } else {
            secondsStr = "\(counterSeconds)"
        }
        
        if counterMinutes < 10 {
            minutesStr = "0" + "\(counterMinutes)"
        } else {
            minutesStr = "\(counterMinutes)"
        }
        
        timerDisplayLabel.text = "\(minutesStr):\(secondsStr).\(tenthOfASecondStr)"
        print(timerDisplayLabel.text)
        
      //  raceRecord["raceNumberId"] = 1 as CKRecordValue?
      //  raceRecord["raceTime"] = timerDisplayLabel.text! as CKRecordValue?
        
     //   let defaultContainer = CKContainer.default()
     //   let publicDatabase = defaultContainer.publicCloudDatabase
        
     /*   defaultContainer.accountStatus { (accountStatus, error) in
            if accountStatus == CKAccountStatus.noAccount {
                let alert = UIAlertController(title: "Sign in to iCloud", message: "Sign in to your iCloud account to write records.  On the Home screen, launch Settings, tap iCloud, and enter your Apple ID.  Turn iCloud Drive on.  If you don't have an iCloud account, tap Create a new Apple ID.", preferredStyle: UIAlertControllerStyle.alert)
                
                self.present(alert, animated: true, completion: nil)
            } else {
                publicDatabase.save(self.raceRecord, completionHandler: { (raceRecord, error) in
                    if (error == nil) {
                        print("Race record saved successfully")
                    } else {
                        print("Error saving race record")
                    }
                })
            }
        }*/
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel!.text = "Race: " + "\([(indexPath as NSIndexPath).row])"
        
        cell.textLabel!.textColor = UIColor(red: 29.0/255.0, green: 53.0/255.0, blue: 67.0/255.0, alpha: 1.0)
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let runsTableViewHeaderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 100))
        runsTableViewHeaderLabel.text = "  RACES"
        runsTableViewHeaderLabel.backgroundColor = UIColor.lightGray
        runsTableViewHeaderLabel.textColor = UIColor.blue
        return runsTableViewHeaderLabel
    }
}

