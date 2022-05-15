//
//  UIColor.swift
//  Task
//
//  Created by Osama Walid on 15/05/2022.
//

import UIKit

extension UIColor {
    @nonobjc class var lightBlue: UIColor {
        UIColor(named: "lightBlue") ?? black
    }
    @nonobjc class var secondary: UIColor {
        UIColor(named: "Secondary") ?? black
    }
    
}
