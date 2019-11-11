//
//  ViewController.swift
//  myTask
//
//  Created by Bharat shankar on 11/11/19.
//  Copyright © 2019 Bharat. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController ,WKNavigationDelegate {
    
    @IBOutlet weak var myWebView: WKWebView!
    
    @IBOutlet weak var myCountryTitle: UILabel!
    @IBOutlet weak var myCapitalTitle: UILabel!
    @IBOutlet weak var myCurrencyTitle: UILabel!
    @IBOutlet weak var myreligionTitle: UILabel!
    @IBOutlet weak var mysubmRegionTitle: UILabel!
    @IBOutlet weak var mypopulationTitle: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    var myCallingCode = ""
    var mycodabalenew : [DetailCountry] = [].self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(myCallingCode)
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Reachability.isConnectedToNetwork(){
            print("Internet Connection Available!")
            getCompleteCountryDetails()
        }else{
            print("Internet Connection not Available!")
            DispatchQueue.main.async {
                
                
                let alertMessage = UIAlertController(title: "Internet Connection not Available!", message: nil, preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertMessage.addAction(alertAction)
                self.present(alertMessage, animated: true, completion: nil)
                
            }
        }
        
        
    }
    
    
    
    //** calling networkApi call methods..
    
    func getCompleteCountryDetails(){
        
        MobileFixServices.sharedInstance.loader(view: self.view)// loader started
        
        NetworkApi.sharedinstance.getCountryDetails(urlStr:(EACH_COUNTRY_URL + myCallingCode)) { (suceess, mycodabalenew, err) in
            
            if let error = err {
                
                DispatchQueue.main.async {
                    
                    
                    let alertMessage = UIAlertController(title: "Currently server is facing heavy traffic. Please try later", message: nil, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alertMessage.addAction(alertAction)
                    self.present(alertMessage, animated: true, completion: nil)
                    
                }
                
                
                
                print("Error While getCompleteCountryDetails ----", error)

                print("Err", error)
            }
            else {
                
                DispatchQueue.main.async {
                    
                    if let mycodabalenew = mycodabalenew {
                        
                        let url = URL(string: mycodabalenew[0].flag!)
                        
                        self.myCountryTitle.text = mycodabalenew[0].name
                        self.myCapitalTitle.text = mycodabalenew[0].capital
                        self.myCurrencyTitle.text = mycodabalenew[0].currencies?[0].name
                        self.myreligionTitle.text = mycodabalenew[0].region
                        self.mysubmRegionTitle.text = mycodabalenew[0].region
                        self.mypopulationTitle.text = String(mycodabalenew[0].population ?? 0)
                        
                        
                        let myimgurl = mycodabalenew[0].flag ?? ""
                        
                        let request: NSURLRequest = NSURLRequest(url: url!)
                        
                        
                        self.myWebView.load(request as URLRequest)
                        
                        self.myWebView.loadHTMLString("""
                            <!DOCTYPE html>
                            <html>
                            <body>

                            <div style="" >
                            <center>
                            <img style="" src="\(myimgurl)" />
                            </center>
                            </div>
                            
                            </body>
                            </html>", baseURL: nil
                            """, baseURL: url)
                        
                        
                    }
                }
                
                
            }
            
            MobileFixServices.sharedInstance.dissMissLoader()// loader stopped
        }
    }
}

