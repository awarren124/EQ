//
//  RequestHandler.swift
//  EQ
//
//  Created by Alexander Warren on 3/17/18.
//  Copyright © 2018 Alexander Warren. All rights reserved.
//

import Foundation

public class RequestHandler {
    
    public static func makeRequestToURL(url: String){
        let url = URL(string: url)!
        URLSession.shared.dataTask(with: url)
    }
    
    public static func makeRequestToURL(url: String, withHandler handler: @escaping ([String: Any]) -> Void){
        let url = URL(string: url)!
        //        URLSession.shared.dataTask(with: url, )
        URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
//            print(error!.localizedDescription)
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            print(url.absoluteString)
            handler(json as! [String: Any])
        }).resume()
    }
    
    public static func postRequestToURL(url: String, info: String, withHandler handler: @escaping ([String: Any]) -> Void){
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = info.data(using: .utf8)
        //        URLSession.shared.dataTask(with: url, )
        
        URLSession.shared.dataTask(with: request, completionHandler:{ (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            handler(json as! [String: Any])
        }).resume()
        
    }
    
}
