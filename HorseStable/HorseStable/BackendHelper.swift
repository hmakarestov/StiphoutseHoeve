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
    var horses : [Horse] = []
    //let url = URL(string: "http://localhost:8083/horse/1")!
    
    init(url: URL) {
        // Do any additional setup after loading the view.
               

               let task = session.dataTask(with: url) { data, response, error in

                   if error != nil || data == nil {
                       print("Client error!")
                       return
                   }


                   do {
                    let decoder = JSONDecoder()
                    
                     let json = try? decoder.decode(Message<Horse>.self, from: data!)
                    print(json?.type ?? "Is nil")
                        
                    
                    
                   } catch {
                       print("JSON error: \(error.localizedDescription)")
                   }
               }

               task.resume()
         print("finished")
    }
    
    func getJSON (completion: @escaping (Message<Horse>)->()) {
            let url = "http://localhost:8083/horse/2"
        if let url = URL(string: url)
        {
            let task = session.dataTask(with: url) { data, response, error in

                      if error != nil || data == nil {
                          print("Client error!")
                          return
                      }
                let str = String(decoding: data!, as: UTF8.self)
                print(str)
                      do {
                       let decoder = JSONDecoder()
                       print("nothing")
                        
                        let json = try JSONDecoder().decode(Message<Horse>.self, from: data!)
                        
                        print(json.model?.name)
                       // print(json.model as Horse)
                      //  print(json.self.model)
                      //  print(json.model)
                      
                        print(json.model as Any)
                        print("something")
                        
                       
                       
                      } catch {
                          print("JSON error: \(error)")
                        print("erroooorrrrrr")
                      }
                  }

                  task.resume()
            print("finished")
        }
    }
    
    private func handleMessage(_ data : Message<Horse>) {
        // Do something with the message.

        print("Successful printing \(String(describing: data.model))")
        self.horses.append(data.model!)

        //test fetching of name
        for h in self.horses {
            print("Hello, \(String(describing: h.name))!")
        }

    }

}
