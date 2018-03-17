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
        let url = url as! URL
        URLSession.shared.dataTask(with: url)
    }
    
    public static func makeRequestToURL(url: String, withHandler handler: @escaping (Data?, URLResponse?, Error?) -> Void){
        let url = url as! URL
//        URLSession.shared.dataTask(with: url, )
        URLSession.shared.dataTask(with: url, completionHandler: handler)
    }
    
}
