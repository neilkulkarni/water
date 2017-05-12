//
//  HomeViewController.swift
//  Water
//
//  Created by Neil Kulkarni on 5/10/17.
//  Copyright © 2017 Neil Kulkarni. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var dailyAmount: Int = 8
    var numCupsLeft: Int = 8
    
    @IBOutlet weak var numCupsLeftLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerSettingsBundle()
        updateDisplayFromDefaults()
        numCupsLeft = dailyAmount
        numCupsLeftLabel.text = String(numCupsLeft)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // UI ACTIONS
    
    @IBAction func increaseCups(_ sender: Any) {
        if (numCupsLeft < 16) {
            numCupsLeft = numCupsLeft + 1
            numCupsLeftLabel.text = String(numCupsLeft)
        }
    }
    
    @IBAction func decreaseCups(_ sender: Any) {
        if (numCupsLeft > 0) {
            numCupsLeft = numCupsLeft - 1
            numCupsLeftLabel.text = String(numCupsLeft)
        }
    }
    
    // SETTINGS
    
    func registerSettingsBundle() {
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }
    
    func updateDisplayFromDefaults() {
        //Get the defaults
        let defaults = UserDefaults.standard
        //let amount = defaults.string(forKey: "daily_amount_preference")
        //dailyAmount = Int(amount!)!
        dailyAmount = defaults.integer(forKey: "daily_amount_preference")
    }
    
    // 3D TOUCH
    
    func decrease() {
        if (numCupsLeft > 0) {
            numCupsLeft = numCupsLeft - 1
            numCupsLeftLabel.text = String(numCupsLeft)
        }
    }
    
    func finish() {
        numCupsLeft = 0
        numCupsLeftLabel.text = String(numCupsLeft)
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
