//
//  NetworkApiClass.swift
//  InterviewTask
//
//  Created by Raghu ram mahathi on 10/11/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation
import UIKit


class NetworkApi {
    private  init(){}
    
    
    
    static let sharedinstance:NetworkApi = NetworkApi()
    
    
    
    
    public func getCountryDetails( urlStr:String, completionHandler: @escaping(_ sucess:Bool,_ object:[DetailCountry]?,_ error:Error?) -> Void) {
        
        let url = NSURL(string:urlStr)!
        
        var request = URLRequest(url: url as URL)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            if let error = error {
                completionHandler( false, nil, error)
            }
            else {
                
                do {
                    
                    let decoder = JSONDecoder()
                    let countryDetailsList : [DetailCountry]  = try decoder.decode([DetailCountry].self, from:
                        data!)
                    
                    completionHandler( true, countryDetailsList, nil)
                }
                catch let error {
                    completionHandler( false, nil, error)
                }
                
            }
            
            }.resume()
        
    }
    
    public func getCompleteCountryList( urlStr:String, completionHandler: @escaping(_ sucess:Bool,_ object:[Json4Swift_Base]?,_ error:Error?) -> Void) {
        
        let url = NSURL(string:urlStr)!
        
        var request = URLRequest(url: url as URL)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            if let error = error {
                completionHandler( false, nil, error)
            }
            else {
                
                do {
                    
                    let decoder = JSONDecoder()
                    let countryDetailsList : [Json4Swift_Base]  = try decoder.decode([Json4Swift_Base].self, from:
                        data!)
                    
                    completionHandler( true, countryDetailsList, nil)
                }
                catch let error {
                    completionHandler( false, nil, error)
                }
                
            }
            
            }.resume()
        
    }
    
}
