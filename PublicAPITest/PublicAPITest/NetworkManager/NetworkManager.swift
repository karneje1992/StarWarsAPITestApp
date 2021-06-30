//
//  NetworkManager.swift
//  StarWarsTestApp
//
//  Created by Rostyslav Didenko on 21.06.2021.
//

import Foundation
import Alamofire

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    func sendGetRequest(from strURL:String, complition: @escaping (_ responseData: Data) -> Void, faile: @escaping(_ response: Any?) -> Void){
        
        AF.request(strURL, method: .get).responseData { (responseData) in
             
            if let responseValue = responseData.value{
                complition(responseValue)
            }else{
                faile(responseData)
            }
        }
    }
}
