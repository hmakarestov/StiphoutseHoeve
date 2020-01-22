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
    
    
    
    init() {
        // Do any additional setup after loading the view.
               

               let task = session.dataTask(with: url) { data, response, error in

                   if error != nil || data == nil {
                       print("Client error!")
                       return
                   }

                    print("rotrrrr")
                   do {
                    let decoder = JSONDecoder()
                    
                     let json = try decoder.decode(Message<Horse>.self, from: data!)
                    print(json.type ?? "Is nil")
                    print(json.model?.name as Any)
                    print("cacaoooooo")
                    
                   } catch {
                       print("JSON error: \(error)")
                   }
               }

               task.resume()
         print("finished first connection")
    }
    
    //AUTHENTICATION
    
    
    func authenticate (username: String, passowrd: String, completion: @escaping (Message<String>)->()) {
           
            //this should be different
           let json: [String: Any] = ["id": 4,
                                      "username" : username,
                                      "password" : passowrd]

           let jsonData = try? JSONSerialization.data(withJSONObject: json)
           let yourAuthorizationToken = "JWTSECRET"
           // create post request
           let url = URL(string: "http://localhost:8083/authenticate")!
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
       
       func verifyToken (completion: @escaping (Message<Int>)->()) {
           
       // this should be different
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
           let url = URL(string: "http://localhost:8083/verifyToken")!
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
       
    
    //HORSES
    
    func postJSON (completion: @escaping (Message<Horse>)->()) {
        
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
    func putJSONAddHorseToUser (completion: @escaping (Message<Horse>)->()) {
           
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
           let url = URL(string: "http://localhost:8083/horse/addHorseToUser/2")!
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
    func getJSONAssignedHorseToUser (completion: @escaping (Message<Horse>)->()) {
            let url = "http://localhost:8083/horse/getAssignedToUser/3"
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
    
    func postJSONPost ( description: String, image: String,completion: @escaping (Int)-> ()) {
        
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
    
    func getJSONPost (completion: @escaping (Message<Post>)->()) {
            let url = "http://localhost:8083/post/12"
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
                        
                        let json = try JSONDecoder().decode(Message<Post>.self, from: data!)
                        
                        print(json.model?.description)
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
    
    func getJSONUser (completion: @escaping (Message<User>)->()) {
            let url = "http://localhost:8083/user/1"
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
    
    func deleteJSONUser () { //completion: @escaping (Message<Horse>)->()
            let url = "http://localhost:8083/post/0"
            
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
