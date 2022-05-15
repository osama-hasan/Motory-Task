//
//  ApiService.swift
//  Task
//
//  Created by Osama Walid on 14/05/2022.
//

import Foundation

class ApiService  {

    public static let instance = ApiService()
    let baseUrl = BaseUrl.dataApi.rawValue
    let session = URLSession.shared
    
    func searchPhotos(page: Int, query: String,completion: @escaping ( _ isSuccess:Bool,_ data:SearchPhotosResponse?,_ error:String) -> ()) {
        let requestUrl = baseUrl + EndPoints.search.rawValue + "?page=\(page)&query=\(query)"
        var request = URLRequest(url: URL(string:requestUrl)!)

        request.allHTTPHeaderFields = HttpCustomHeaders.authHeaders
        
        session.dataTask(with: request) { data, response, error in
            if error != nil {
                print("Search Photos ==================== connection error")
                return completion(false , nil,"Something went wrong! please check you connection")
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("Search Photos ==================== response code \(httpResponse.statusCode)")
                if httpResponse.statusCode == 200 {
                    do {
                   
                        let result = try JSONDecoder().decode(SearchPhotosResponse.self, from: data!)
                        return completion(true , result ,"Something went wrong! please check you connection")
                    } catch {
                        return completion(false , nil ,"Something went wrong! please try again later")
                    }
                    
                }
                return completion(false , nil ,"Error couldn't search Photos \(httpResponse.statusCode)")
            }
            print("Search Photos Fail ==================== unkown error")
            
            return completion(false , nil ,"Something went wrong! please try again later")
            
            
        }.resume()

    }
    
    func getPhotos(page: Int,completion: @escaping ( _ isSuccess:Bool,_ data:[Photo]?,_ error:String) -> ()) {
        let requestUrl = baseUrl + EndPoints.photos.rawValue + "?page=\(page)"
        var request = URLRequest(url: URL(string:requestUrl)!)

        request.allHTTPHeaderFields = HttpCustomHeaders.authHeaders
        
        session.dataTask(with: request) { data, response, error in
            if error != nil {
                print("Get Photos Fail ==================== connection error")
                return completion(false , nil,"Something went wrong! please check you connection")
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("Get Photos Success ==================== response code \(httpResponse.statusCode)")
                if httpResponse.statusCode == 200 {
                    do {
                        let str = String(decoding: data!, as: UTF8.self)
                        print(str)
                        let result = try JSONDecoder().decode([Photo].self, from: data!)
                        
                        return completion(true , result ,"Something went wrong! please check you connection")
                    } catch let myError{
                        return completion(false , nil ,"Something went wrong! please try again later \(myError)")
                    }
                    
                }
                return completion(false , nil ,"Error couldn't  get Photos \(httpResponse.statusCode)")
            }
            print("Get Photos Fail ==================== unkown error")
            
            return completion(false , nil ,"Something went wrong! please try again later")
            
            
        }.resume()
    }
    
     
}
