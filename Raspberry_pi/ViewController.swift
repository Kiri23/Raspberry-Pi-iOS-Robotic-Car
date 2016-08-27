//
//  ViewController.swift
//  Raspberry_pi
//
//  This class send event to Firebase to controll the diferente stage of the Raspberry Pi car robot
//  and also control the UI for the iphone app(Client Side)
//
//  Created by Christian Nogueras on 08/23/16.
//  Copyright © 2016 com.christian.nogueras. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /// Call the method to runn the motor foward
        led("ON")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /**
       Send an event to Firebase to run the motor foward or Stop the motor
       -author: 
        Christian Nogueras
       -parameters: 
          -state: The State of the motor only possible values:"ON" to
          run foward and "OF" to stop the motor
       -version: 
       0.1 
       This function is to run the motor foward on the raspberry pi.
       This function send a event to firebase to change the state of the motor 
       and then in the Raspberry Pi the python script is set to listen to any change on the database 
       to change the states of the Gpio Pins
      */ 
    func led(ChangedStateTo state: String){
        /// Get a reference to the Firebase Database
        let ref = FIRDatabase.database().reference()
        /// The object post to post in the database
        let post : [String: AnyObject] = ["state": state]
        /// setValue Post of the child led in the Database
        ref.child("led").setValue(post)
        
        
        
    }

}

