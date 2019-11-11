//
//  firstViewController.swift
//  myTask
//
//  Created by Bharat shankar on 11/11/19.
//  Copyright © 2019 Bharat. All rights reserved.
//

import UIKit

class firstViewController: UIViewController  {

    
    @IBOutlet weak var countriesTbl: UITableView!
    
    var codabalenew : [Json4Swift_Base] = [].self
    
    var myCountriesCodesArr = [String]()
    var myCountryName = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Reachability.isConnectedToNetwork(){
            print("Internet Connection Available!")
            getCompleteCountryList()
        }else{
            print("Internet Connection not Available!")
            DispatchQueue.main.async {
                
                
                let alertMessage = UIAlertController(title: "Internet Connection not Available!", message: nil, preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertMessage.addAction(alertAction)
                self.present(alertMessage, animated: true, completion: nil)
                
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    //** calling networkApi call methods..
    
    func getCompleteCountryList(){
        
        MobileFixServices.sharedInstance.loader(view: self.view)// loader started
        
        NetworkApi.sharedinstance.getCompleteCountryList(urlStr:COUNTRIES_URL) { (suceess, mycodabalenew, error) in
            
            if suceess {
                
                self.codabalenew  = mycodabalenew!
                
                DispatchQueue.main.async {
                    self.countriesTbl.reloadData()
                }
                
            }
            else{
                
                print(error?.localizedDescription ?? "some error came")
            }
            
            MobileFixServices.sharedInstance.dissMissLoader()// loader stopped
        }
        
        
    }
    
}

extension firstViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.codabalenew.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // let cell : UITableViewCell = self.countriesTbl.dequeueReusableCell(withIdentifier: "cell")!
        let cell:countriesTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "countriesTableViewCell") as! countriesTableViewCell?)!
        
        
        cell.myCountryName?.text =  self.codabalenew[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //       print(self.codabalenew[indexPath.row].callingCodes?[0])
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        newViewController.myCallingCode = self.codabalenew[indexPath.row].callingCodes?[0] ?? "0"
        //self.present(newViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

