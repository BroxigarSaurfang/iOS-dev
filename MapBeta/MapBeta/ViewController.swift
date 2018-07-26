//
//  ViewController.swift
//  MapBeta
//
//  Created by ASURADA on 2018. 4. 27..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit
import SnapKit
import Firebase
import TextFieldEffects
import EFAutoScrollLabel

class ViewController: UIViewController {

    // - MARK: IBOutlet
    
    @IBOutlet weak var emailTextField: HoshiTextField!
    @IBOutlet weak var passwordTextField: HoshiTextField!
    @IBOutlet weak var nickNameTextField: HoshiTextField!
    @IBOutlet weak var currentUserLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var testImage: UIImageView!
    
    @IBOutlet weak var efauto: EFAutoScrollLabel!
    
    // - MARK: Properties
    
    
    
    // - MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        emailTextField.placeholderColor = .gray
//        passwordTextField.placeholderColor = .gray
//        nickNameTextField.placeholderColor = .gray
//        emailTextField.borderColor = UIColor.clear
//        passwordTextField.borderColor = UIColor.clear
        
        testImage.layer.cornerRadius = 10
        testImage.layer.shadowColor = UIColor.black.cgColor
        testImage.layer.shadowOpacity = 1
        testImage.layer.shadowOffset = CGSize.zero

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
//            // ...
//        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
//        Auth.auth().removeStateDidChangeListener(handle!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // - MARK: IBAction
    
    @IBAction func loginButton(_ sender: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
            if let user = user {
                self.currentUserLabel.text = user.email
            }
        }

    }
    
    @IBAction func signinButton(_ sender: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        Auth.auth().createUser(withEmail: email!, password: password!) { (user, error) in
            if let user = user {
                print(user)
                self.currentUserLabel.text = user.email
            } else {
                print(error)
            }
        }
        
    }
    
    @IBAction func changeNickButton(_ sender: UIButton) {
        let displayName = nickNameTextField.text
        
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = displayName
        changeRequest?.commitChanges { (error) in
            // ...
        }
        
        let user = Auth.auth().currentUser
        nickNameLabel.text = user?.displayName
    }
    
    
    
}

