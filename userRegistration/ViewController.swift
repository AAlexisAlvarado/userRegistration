//
//  ViewController.swift
//  userRegistration
//
//  Created by Alexis Alvarado Tarrillo on 11/12/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//
import Alamofire
import UIKit


class ViewController: UIViewController {

    let URL_USER_REGISTER = "http://10.200.173.14:8888/userRegistration/v1/register.php";
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldLastName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    @IBAction func buttonRegister(_ sender: UIButton) {
        //creating parameters for the post request
        let parameters: Parameters=[
            "name":textFieldName.text!,
            "lastname":textFieldLastName.text!,
            "email":textFieldEmail.text!,
            "password":textFieldPassword.text!
        ]
        
        //Sending http post request
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                    
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    self.labelMessage.text = jsonData.value(forKey: "message") as! String?
                }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

