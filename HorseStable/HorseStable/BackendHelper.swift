//
//  BackendHelper.swift
//  HorseStable
//
//  Created by Student on 16/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import Foundation

public class BackendHelper {
    let session = URLSession.shared
    //let url = URL(string: "http://localhost:8083/horse/1")!
    
    init(url: URL) {
        // Do any additional setup after loading the view.
               

               let task = session.dataTask(with: url) { data, response, error in

                   if error != nil || data == nil {
                       print("Client error!")
                       return
                   }


                   do {
                       let json = try JSONSerialization.jsonObject(with: data!, options: [])
                       print(json)
                   } catch {
                       print("JSON error: \(error.localizedDescription)")
                   }
               }

               task.resume()
    }
}
