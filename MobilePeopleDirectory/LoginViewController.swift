//
//  LoginViewController.swift
//  MobilePeopleDirectory
//
//  Created by Martin Zary on 1/11/15.
//  Copyright (c) 2015 Rivet Logic. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginScreenletDelegate {

    @IBOutlet weak var loginScreenlet: LoginScreenlet!
    
    var appHelper = AppHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreenlet!.delegate = self
        loginScreenlet!.authMethod = AuthMethod.Email.rawValue
        loginScreenlet!.saveCredentials = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK - Liferay Login Screenlet delegate
    
    func onLoginResponse(attributes: [String : AnyObject]) {
        println("onLoginResponse attributes:", attributes)
        appHelper.getAppDelegate().startup()
        
    }
    
    func onLoginError(error: NSError) {
        println(error)
        // handled failed login using passed error
    }
    
    func onCredentialsLoaded(session:LRSession) {
        print("Saved loaded for server " + session.server)
    }
    
    func onCredentialsSaved(session:LRSession) {
        print("Saved credentials for server " + session.server)
    }
    
    @IBAction func forgotPasswordPressed(sender: AnyObject) {
        appHelper.getAppDelegate().forgotPassword()
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
