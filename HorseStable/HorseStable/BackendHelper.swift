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
    let url = URL(string: "http://localhost:8083/horse/1")!
    var model : String = ""
    var feedback : String = ""
    var type : String = ""
    var number : Int = 0
    init() {
        // Do any additional setup after loading the view.
               

//               let task = session.dataTask(with: url) { data, response, error in
//
//                   if error != nil || data == nil {
//                       print("Client error!")
//                       return
//                   }
//
//                    print("rotrrrr")
//                   do {
//                    let decoder = JSONDecoder()
//                    
//                     let json = try decoder.decode(Message<Horse>.self, from: data!)
//                    print(json.type ?? "Is nil")
//                    print(json.model?.name as Any)
//                    print("cacaoooooo")
//                    
//                   } catch {
//                       print("JSON error: \(error)")
//                   }
//               }
//
//               task.resume()
//         print("finished first connection")
    }
    
    //AUTHENTICATION
//    let dd =  userInfo["extraData"] as! String
//    let con = try JSONSerialization.jsonObject(with: dd.data(using: .utf8)!, options: []) as! [String:Any]
//    print(con["message_id"])
    
    func authenticate (email: String, passowrd: String, completion: @escaping (String?,String?,String?)-> ()){
            //this should be different
           let json: [String: Any] = [//"id": 0,
                                      "email" : email,
                                      "password" : passowrd]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        print(jsonData as Any)
         //  let yourAuthorizationToken = "JWTSECRET"
           // create post request
        guard  let url = URL(string: "http://localhost:8083/authenticate") else {return}
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
            
           // insert json data to the request
           request.httpBody = jsonData
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.addValue("application/json", forHTTPHeaderField: "Accept")
            
           let task = URLSession.shared.dataTask(with: request) { data, response, error in
               guard let data = data, error == nil else {
                   print(error ?? "No data")
                
                   return
               }
            
               let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [] )
               if let responseJSON = responseJSON as? [String: Any] {
                   print(responseJSON)
                   print("Backend Success")
               // if let result = data. as? [String:String] {
                
                self.model = responseJSON["model"] as? String ?? ""
                self.feedback = responseJSON["feedback"] as? String ?? ""
                self.type = responseJSON["type"] as? String ?? ""
                completion(self.model ,self.feedback , self.type)
                
               }
            
            else {print("EROORRR")}
            
           
            
            
           }

           task.resume()
       }
    func verify(token:String) {
        
    }
    func verifyToken (to:String, completion: @escaping (Date?,String?)->()) {
        // make sure to not crash if nil or wrong credentials
        var str : String = ""
        str = to
        var payload64 = str.components(separatedBy: ".")[1]
        
        // need to pad the string with = to make it divisible by 4,
        // otherwise Data won't be able to decode it
        while payload64.count % 4 != 0 {
            payload64 += "="
        }

        print("base64 encoded payload: \(payload64)")
        let payloadData = Data(base64Encoded: payload64,
                               options:.ignoreUnknownCharacters)!
        let payload = String(data: payloadData, encoding: .utf8)!
        print(payload)
        
        
        let json = try! JSONSerialization.jsonObject(with: payloadData, options: []) as! [String:Any]
        let exp = json["exp"] as! Int
        let sub = json["sub"] as! String
        let expDate = Date(timeIntervalSince1970: TimeInterval(exp))
        completion(expDate,sub)
       }
       
    
    //HORSES
    
    func postJSON (id: String,name:String, lifeNum : String,chipNum:String,date : Date,gender: String,completion: @escaping (Error?)->()) {
        
     // prepare json data
        let json: [String: Any] = ["id": id,
                                   "name" : name, //"Horse",
                                   "race" : "White",
                                   "lifeNumber": lifeNum,// "lifeNum",
                                   "chipNumber": chipNum,//"chipNum",
                                   "birthDate":"2012-04-21T18:25:43-05:00",
                                   "gender":  gender,//"MALE",
                                   "medicalReports":[],
                                   "owners":[]]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://localhost:8083/horse")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // insert json data to the request
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                
                completion(error)
            }
        }

        task.resume()
    }
    
    func putJSON (completion: @escaping (Message<Horse>)->()) {
        
     // prepare json data
        let json: [String: Any] = ["id": 4,
                                   "name" : "Horse",
                                   "race" : "White",
                                   "lifeNumber": "lifeNum",
                                   "chipNumber": "chipNum",
                                   "birthDate": "2012-04-21T18:25:43-05:00",
                                   "gender": "MALE",
                                   "medicalReports":[],
                                   "owners":[]]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://localhost:8083/horse")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"

        // insert json data to the request
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                
            }
            
        }

        task.resume()
    }
    //HOW SHOULD THIS WORK?
    func putJSONRemoveHorseFromUser (completion: @escaping (Message<Horse>)->()) {
           
        // prepare json data
           let json: [String: Any] = ["id": 4,
                                      "name" : "Horse",
                                      "race" : "White",
                                      "lifeNumber": "lifeNum",
                                      "chipNumber": "chipNum",
                                      "birthDate": "2012-04-21T18:25:43-05:00",
                                      "gender": "MALE",
                                      "medicalReports":[],
                                      "owners":[]]

           let jsonData = try? JSONSerialization.data(withJSONObject: json)
           
           // create post request
           let url = URL(string: "http://localhost:8083/horse/RemoveHorseFromUser/0")!
           var request = URLRequest(url: url)
           request.httpMethod = "PUT"

           // insert json data to the request
           request.httpBody = jsonData
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           let task = URLSession.shared.dataTask(with: request) { data, response, error in
               guard let data = data, error == nil else {
                   print(error ?? "No data")
                   return
               }
               let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
               if let responseJSON = responseJSON as? [String: Any] {
                   print(responseJSON)
                   
               }
               
           }

           task.resume()
       }
    //HOW SHOULD THIS WORK?
    func putJSONAddHorseToUser (query:String,name:String, race : String, lifeNum : String, chipNumber : String, birthDate: String, gender: String, completion: @escaping (Error?)->()) {
           
        // prepare json data
           let json: [String: Any] = ["id": query ,// 4,
                                      "name" : name,// "Horse",
                                      "race" : race, //"White",
                                      "lifeNumber": lifeNum,//"lifeNum",
                                      "chipNumber": chipNumber,//"chipNum",
                                      "birthDate": birthDate,//"2012-04-21T18:25:43-05:00",
                                      "gender": gender,//"MALE",
                                      "medicalReports":[],
                                      "owners":[]]

           let jsonData = try? JSONSerialization.data(withJSONObject: json)
           
           // create post request
           let url = URL(string: "http://localhost:8083/horse/addHorseToUser/\(query)")!
           var request = URLRequest(url: url)
           request.httpMethod = "PUT"

           // insert json data to the request
           request.httpBody = jsonData
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           let task = URLSession.shared.dataTask(with: request) { data, response, error in
               guard let data = data, error == nil else {
                   print(error ?? "No data")
                   return
               }
               let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
               if let responseJSON = responseJSON as? [String: Any] {
                   print(responseJSON)
                   completion(error)
               }
               
           }

           task.resume()
       }
     //HOW SHOULD THIS WORK?
    func getJSONAssignedHorseToUser (query: String, completion: @escaping([Horse]) -> Void){
            let url = "http://localhost:8083/horse/getAssignedToUser/\(query)"
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
                       print("nothing")
                        
                        let json = try JSONDecoder().decode(Message<[Horse]>.self, from: data!)
                        
                        print(json.model?.count as Any)
                       // print(json.model as Horse)
                      //  print(json.self.model)
                      //  print(json.model)
                      
                        print(json.model as Any)
                        print("something")
                        guard  let results = json.model else { return  }
                        print("Results: \(results.count)")
                        DispatchQueue.main.async {
                            completion(results)
                        }

                       
                       
                      } catch {
                          print("JSON error: \(error)")
                        print("erroooorrrrrr")
                      }
                  }

                  task.resume()
            print("finished")
        }
    }
    
    func getJSON (completion: @escaping (Message<Horse>)->()) { //query : String
       
//        let api = "https://api.github.com"
//        let endpoint = "/search/repositories?q=\(query)"
//        let url = URL(string: api + endpoint)
        
        let url = "http://localhost:8083/horse/3"
        
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
                       print("nothing")
                        
                        let json = try JSONDecoder().decode(Message<Horse>.self, from: data!)
                        
                        print(json.model?.name as Any)
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
    func getJSONHorses(completion: @escaping([Horse]) -> Void){ //Message<[Horse]>
        let url = "http://localhost:8083/horses"

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
                    print("nothing")
                    let json = try JSONDecoder().decode(Message<[Horse]>.self, from: data!)
                        print(json.model?.count as Any)
                        print(json.model as Any)
                        print("something")
                        
                    let results = json.model!
                    print("Results: \(results.count)")
                    DispatchQueue.main.async {
                        completion(results)
                    }
                        } catch {
                            print("JSON error: \(error)")
                            print("erroooorrrrrr")
                        }
                    }

                    task.resume()
              print("finished")
            
          }
      }
    
    func deleteJSON () { //completion: @escaping (Message<Horse>)->()
        let url = "http://localhost:8083/horse/1"
        
        guard let connUrl = URL(string:url) else {
            print("Error creating URL")
            return
        }
       
        var request = URLRequest(url: connUrl)
        request.httpMethod = "DELETE"

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
        
         let task = URLSession.shared.dataTask(with: request) { data, response, error in
                   guard let data = data, error == nil else {
                       print(error ?? "No data")
                       return
                   }
                   let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                   if let responseJSON = responseJSON as? [String: Any] {
                       print(responseJSON)
                       
                   }
                   
               }
        
        task.resume()
    }
    //POSTS
    
    func postJSONPost ( type: String, description: String, image: String,completion: @escaping (Error?)->()) {
        
     // prepare json data
        
        let json: [String: Any] = [//"id": 4,
                                   "type" : type,//"ADMIN_NOTICE",
                                   "imageUrl" : image, //"",
                                   "description": description as String,//"first post",
                                   "dateTime": "2012-04-21T18:25:43-05:00",
                                   //"user": (),
                                   "comments":[]]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://localhost:8083/post")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // insert json data to the request
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                
            }
        }

        task.resume()
    }
    
    func getJSONPost (query:String,completion: @escaping ([Post])->()) {
            let url = "http://localhost:8083/post/\(query)"
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
                      // let decoder = JSONDecoder()
                       print("nothing")
                        
                        let json = try JSONDecoder().decode(Message<[Post]>.self, from: data!)
                        
                        print(json.model?.description as Any)
                       // print(json.model as Horse)
                      //  print(json.self.model)
                      //  print(json.model)
                      
                        print(json.model as Any)
                        print("something")
                        completion(json.model!)
                       
                       
                      } catch {
                          print("JSON error: \(error)")
                        print("erroooorrrrrr")
                      }
                  }

                  task.resume()
            print("finished")
        }
    }
    func putJSONPost ( description: String, image: String,completion: @escaping (Int)-> ()) {
        
     // prepare json data
        
        let json: [String: Any] = [//"id": 4,
                                   "type" : "POST",
                                   "imageUrl" : image, //"",
                                   "description": description as String,//"first post",
                                   "dateTime": "2012-04-21T18:25:43-05:00",
                                  // "user": "",
                                   "comments":[]]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://localhost:8083/post")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"

        // insert json data to the request
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                
            }
        }

        task.resume()
    }
    func getJSONPosts (completion: @escaping([Post]) -> Void){
              let url = "http://localhost:8083/posts"
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
                         print("nothing")
                          
                          let json = try JSONDecoder().decode(Message<[Post]>.self, from: data!)
                          
                            print(json.model?.count as Any)
                         // print(json.model as Horse)
                        //  print(json.self.model)
                        //  print(json.model)
                        
                          print(json.model as Any)
                          print("something")
                          
                        let results = json.model!
                        print("Results: \(results.count)")
                        DispatchQueue.main.async {
                            completion(results)
                        }
                         
                        } catch {
                            print("JSON error: \(error)")
                          print("erroooorrrrrr")
                        }
                    }

                    task.resume()
              print("finished")
          }
      }
    
    
    func deleteJSONPost () { //completion: @escaping (Message<Horse>)->()
            let url = "http://localhost:8083/post/12"
            
            guard let connUrl = URL(string:url) else {
                print("Error creating URL")
                return
            }
           
            var request = URLRequest(url: connUrl)
            request.httpMethod = "DELETE"

            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
    //        let config = URLSessionConfiguration.default
    //        let session = URLSession(configuration: config)
            
             let task = URLSession.shared.dataTask(with: request) { data, response, error in
                       guard let data = data, error == nil else {
                           print(error ?? "No data")
                           return
                       }
                       let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                       if let responseJSON = responseJSON as? [String: Any] {
                           print(responseJSON)
                           
                       }
                       
                   }
            
            task.resume()
        }
    
    //USERS
    func getJSONUsers(completion: @escaping([User]) -> Void){ //Message<[Horse]>
                 let url = "http://localhost:8083/users"
           
          // let returnedResults = [User]()
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
                            print("nothing")
                             
                             let json = try JSONDecoder().decode(Message<[User]>.self, from: data!)
                            let results = json.model!
                            print("Results: \(results.count)")
                              DispatchQueue.main.async {
                                        completion(results)
                                    }
                               print(json.model?.count as Any)
                            // print(json.model as Horse)
                           //  print(json.self.model)
                           //  print(json.model)
                           
                             print(json.model as Any)
                             print("something")
                           //completion(json.model!)
                            //completion(returnedResults)
                            
                           } catch {
                               print("JSON error: \(error)")
                             print("erroooorrrrrr")
                           }
                       }

                       task.resume()
                 print("finished")
               
             }
         }
       
    func postJSONUser ( description: String, image: String,completion: @escaping (Int)-> ()) {
        
     // prepare json data
        
        let json: [String: Any] = ["id": 4,
                                   "firstName" : "John",
                                   "middleName" : "Marko", //"",
                                   "lastName": "Meroo" as String,//"first post",
                                    "email": "kaaskop@mail.com",
                                    "role" : "ADMIN",
                                    "gender" : "MALE",
                                   "birthDate": "2012-04-21T18:25:43-05:00"]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://localhost:8083/user")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // insert json data to the request
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                
            }
        }

        task.resume()
    }
    
    func getJSONUser (query:String,completion: @escaping (User)->()) {
            let url = "http://localhost:8083/user/\(query)"
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
                       print("nothing")
                        
                        let json = try JSONDecoder().decode(Message<User>.self, from: data!)
                        
                        print(json.model?.firstName as Any)
                       // print(json.model as Horse)
                      //  print(json.self.model)
                      //  print(json.model)
                      
                        print(json.model as Any)
                        print("something")
                        let user  = json.model!
                        completion(user)
                       
                       
                      } catch {
                          print("JSON error: \(error)")
                        print("erroooorrrrrr")
                      }
                  }

                  task.resume()
            print("finished")
        }
    }
    func putJSONUser ( description: String, image: String,completion: @escaping (Int)-> ()) {
        
     // prepare json data
        
        let json: [String: Any] = ["id": 12,
                                   "firstName" : "Mero",
                                   "middleName" : "Tero", //"",
                                    "lastName": "Dero" as String,//"first post",
                                    "email": "persko@mail.com",
                                    "role" : "ADMIN",
                                    "gender" : "FEMALE",
                                    "birthDate": "2012-04-21T18:25:43-05:00"]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://localhost:8083/user")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"

        // insert json data to the request
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                
            }
        }

        task.resume()
    }
    
    func deleteJSONUser (query: String,completion: @escaping (Error?)->()) { //completion: @escaping (Message<Horse>)->()
            let url = "http://localhost:8083/user/\(query)"
            guard let connUrl = URL(string:url) else {
                print("Error creating URL")
                return
            }
           
            var request = URLRequest(url: connUrl)
            request.httpMethod = "DELETE"

            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            
             let task = URLSession.shared.dataTask(with: request) { data, response, error in
                       guard let data = data, error == nil else {
                           print(error ?? "No data")
                           return
                       }
                       let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                       if let responseJSON = responseJSON as? [String: Any] {
                           print(responseJSON)
                           
                       }
                       
                   }
            
            task.resume()
        }
    
    //STALL
    
    func postJSONStall ( horse: Horse,completion: @escaping (Message<Stall>)-> ()) {
        
      
        let json: [String: Any] = ["id": 1,
                                   "horse" : horse,
                                   "available" : "true"]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://localhost:8083/stall")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // insert json data to the request
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                
            }
        }

        task.resume()
    }
    
    func getJSONStall (completion: @escaping (Message<Stall>)->()) {
            let url = "http://localhost:8083/stall/1"
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
                       print("nothing")
                        
                        let json = try JSONDecoder().decode(Message<Stall>.self, from: data!)
                        
                        print(json.model?.available as Any)
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
    func putJSONStall ( horse: Horse,completion: @escaping (Message<Stall>)-> ()) {
        
     // prepare json data
        
        let json: [String: Any] = ["id": 2,
                                   "horse" : horse,
                                   "available" : "false"]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://localhost:8083/stall")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"

        // insert json data to the request
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                
            }
        }

        task.resume()
    }
    func getJSONStalls (completion: @escaping (Message<Stall>)->()) {
              let url = "http://localhost:8083/stalls"
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
                         print("nothing")
                          
                          let json = try JSONDecoder().decode(Message<Stall>.self, from: data!)
                          
                            print(json.model?.id as Any)
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
    
    func deleteJSONStall () { //completion: @escaping (Message<Horse>)->()
            let url = "http://localhost:8083/stall/0"
            
            guard let connUrl = URL(string:url) else {
                print("Error creating URL")
                return
            }
           
            var request = URLRequest(url: connUrl)
            request.httpMethod = "DELETE"

            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            
             let task = URLSession.shared.dataTask(with: request) { data, response, error in
                       guard let data = data, error == nil else {
                           print(error ?? "No data")
                           return
                       }
                       let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                       if let responseJSON = responseJSON as? [String: Any] {
                           print(responseJSON)
                           
                       }
                       
                   }
            
            task.resume()
        }
    
    
    //FACILITIES
    func getJSONFacilities (completion: @escaping (Message<Facility>)->()) {
              let url = "http://localhost:8083/facilities"
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
                         print("nothing")
                          
                          let json = try JSONDecoder().decode(Message<Facility>.self, from: data!)
                          
                            print(json.model?.name as Any)
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
    
    func postJSONFacility ( horse: Horse,completion: @escaping (Message<Facility>)-> ()) {
        
      
        let json: [String: Any] = ["id": 1,
                                   "name": "",
                                   "reservable": false,
                                   "reservations": [],
                                   "unavailableTimeSlots": []]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://localhost:8083/facility")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // insert json data to the request
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                
            }
        }

        task.resume()
    }
    
    func getJSONFacility (completion: @escaping (Message<Facility>)->()) {
           
        let url = "http://localhost:8083/facility/1"
        
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
                       print("nothing")
                        
                        let json = try JSONDecoder().decode(Message<Facility>.self, from: data!)
                        
                        print(json.model?.name as Any)
                    
                        
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
    func putJSONFacility ( horse: Horse,completion: @escaping (Message<Facility>)-> ()) {
        
        
        let json: [String: Any] = ["id": 1,
                                   "name": "",
                                   "reservable": false,
                                   "reservations": [],
                                   "unavailableTimeSlots": []]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://localhost:8083/facility")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // insert json data to the request
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                
            }
        }

        task.resume()
    }
    func putJSONFacilityRemoveReservation ( horse: Horse,completion: @escaping (Message<Facility>)-> ()) {
        
        //this should be a body of object Reservation
        let json: [String: Any] = ["id": 1,
                                   "name": "",
                                   "reservable": false,
                                   "reservations": [],
                                   "unavailableTimeSlots": []]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://localhost:8083/facility/removeReservation/1")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"

        // insert json data to the request
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                
            }
        }

        task.resume()
    }
    func putJSONFacilityAddReservation ( horse: Horse,completion: @escaping (Int)-> ()) {
        
        //this should be a body of object Reservation
        let json: [String: Any] = ["id": 1,
                                   "name": "",
                                   "reservable": false,
                                   "reservations": [],
                                   "unavailableTimeSlots": []]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://localhost:8083/facility/addReservation/1")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"

        // insert json data to the request
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                
            }
        }

        task.resume()
    }
    
    func deleteJSONFacility () { //completion: @escaping (Message<Facility>)->()
            let url = "http://localhost:8083/facility/0"
            
            guard let connUrl = URL(string:url) else {
                print("Error creating URL")
                return
            }
           
            var request = URLRequest(url: connUrl)
            request.httpMethod = "DELETE"

            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            
             let task = URLSession.shared.dataTask(with: request) { data, response, error in
                       guard let data = data, error == nil else {
                           print(error ?? "No data")
                           return
                       }
                       let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                       if let responseJSON = responseJSON as? [String: Any] {
                           print(responseJSON)
                           
                       }
                       
                   }
            
            task.resume()
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
