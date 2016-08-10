//
//  LoginViewController.swift
//  OAProject
//
//  Created by Geetion on 8/9/16.
//  Copyright © 2016 Geetion. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func loadView() {
        view = LoginView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
                presentViewController(MainTabViewController(), animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
