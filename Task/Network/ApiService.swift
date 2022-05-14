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
    
    func searchPhotos(page: Int, query: String,completion: @escaping ( _ isSuccess:Bool,_ data:[SearchPhotosResponse]?,_ error:String) -> ()) {
        let requestUrl = baseUrl + EndPoints.search.rawValue
        var request = URLRequest(url: URL(string:requestUrl)!)

        request.allHTTPHeaderFields = HttpCustomHeaders.basicHeaders
        
        session.dataTask(with: request) { data, response, error in
            if error != nil {
                print("AuthToken Fail ==================== connection error")
                return completion(false , nil,"Something went wrong! please check you connection")
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("AuthToken Success ==================== response code \(httpResponse.statusCode)")
                if httpResponse.statusCode == 200 {
                    do {
                   
                        
                        return completion(true , [] ,"Something went wrong! please check you connection")
                    } catch {
                        return completion(false , nil ,"Something went wrong! please try again later")
                    }
                    
                }
                return completion(false , nil ,"Error couldn't get AccessToken \(httpResponse.statusCode)")
            }
            print("AuthToken Fail ==================== unkown error")
            
            return completion(false , nil ,"Something went wrong! please try again later")
            
            
        }.resume()

    }
    
    func getPhotos(page: Int,completion: @escaping ( _ isSuccess:Bool,_ data:[Photo]?,_ error:String) -> ()) {
        let requestUrl = baseUrl + EndPoints.search.rawValue
        var request = URLRequest(url: URL(string:requestUrl)!)

        request.allHTTPHeaderFields = HttpCustomHeaders.basicHeaders
        
        session.dataTask(with: request) { data, response, error in
            if error != nil {
                print("AuthToken Fail ==================== connection error")
                return completion(false , nil,"Something went wrong! please check you connection")
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("AuthToken Success ==================== response code \(httpResponse.statusCode)")
                if httpResponse.statusCode == 200 {
                    do {
                   
                        
                        return completion(true , [] ,"Something went wrong! please check you connection")
                    } catch {
                        return completion(false , nil ,"Something went wrong! please try again later")
                    }
                    
                }
                return completion(false , nil ,"Error couldn't get AccessToken \(httpResponse.statusCode)")
            }
            print("AuthToken Fail ==================== unkown error")
            
            return completion(false , nil ,"Something went wrong! please try again later")
            
            
        }.resume()
    }
    
     
}
