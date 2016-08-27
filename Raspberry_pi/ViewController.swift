//
//  ViewController.swift
//  Raspberry_pi
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
        led("ON")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func led(state: String){
        let ref = FIRDatabase.database().reference()
        let post : [String: AnyObject] = ["state": state]
        ref.child("led").setValue(post)
        
        
        
    }

}

