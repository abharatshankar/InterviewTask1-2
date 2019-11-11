//
//  myExtensions.swift
//  myTask
//
//  Created by Bharat shankar on 11/11/19.
//  Copyright © 2019 Bharat. All rights reserved.
//

import Foundation
import UIKit

let COUNTRIES_URL = "https://restcountries.eu/rest/v2/all"

let EACH_COUNTRY_URL = "https://restcountries.eu/rest/v2/callingcode/"


class MobileFixServices: NSObject {
    
    static let sharedInstance = MobileFixServices()

let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)

func loader(view: UIView) -> () {

DispatchQueue.main.async {
self.indicator.frame = CGRect(x: 0,y: 0,width: 75,height: 75)
self.indicator.layer.cornerRadius = 8
self.indicator.center = view.center
self.indicator.color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
view.addSubview(self.indicator)
    self.indicator.backgroundColor = .darkGray
self.indicator.bringSubviewToFront(view)
UIApplication.shared.isNetworkActivityIndicatorVisible = true
self.indicator.startAnimating()
UIApplication.shared.beginIgnoringInteractionEvents()
}
}

func dissMissLoader()  {
    DispatchQueue.main.async {
        self.indicator.stopAnimating()

        UIApplication.shared.endIgnoringInteractionEvents()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}

}
