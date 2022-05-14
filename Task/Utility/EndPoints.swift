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


struct HttpCustomHeaders{
    static var authHeaders = ["Content-Type":"application/json","Authorization":"Bearer" ]
    static var basicHeaders = ["Content-Type":"application/json"]
   
}
