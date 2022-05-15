//
//  EndPoints.swift
//  Task
//
//  Created by Osama Walid on 14/05/2022.
//

import Foundation


enum BaseUrl : String {
    case dataApi = "https://api.unsplash.com/"
}


enum EndPoints:String {
    case photos = "photos"
    case search = "search/photos"
}

enum LayoutType:Int{
    case list = 1
    case grid = 2
}


struct HttpCustomHeaders{
    static var authHeaders = ["Content-Type":"application/json","Authorization":"Client-ID k7EvWytw8sbrdzxfYEjeqO1Qy6oAMoP28fURRxLGfG4" ]
    static var basicHeaders = ["Content-Type":"application/json"]
   
}
