//
//  ViewControllerCommunityHub.swift
//  HorseStable
//
//  Created by Student on 08/01/2020.
//  Copyright © 2020 smartmobile. All rights reserved.
//

import UIKit

//struct CellDataPostsDemo{
//    let userAvatar : String
//    let userName : String
//    let postImage : String
//    let postDescription : String
//}

class ViewControllerCommunityHub: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableViewUserPosts: UITableView!
    var userPosts = [Post] ()
    var backEnd = BackendHelper()
    var token = MyVariables.token
    var username : String = ""
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New Post", style: .plain, target: self, action: #selector(didTapAddItemButton))
        tableViewUserPosts.delegate = self
        tableViewUserPosts.dataSource = self
        
               self.backEnd.verifyToken(to: self.token,completion: {
                        (expDate,sub) in
                        let currentDateTime = Date()
                        if (expDate!>currentDateTime) {
                            print("expired")
                        }
                        if (sub == nil || sub == "-1") {
                            print("Token not verified",sub as Any)
                            // redirect back to log in
                        }
                        else {
                            print("Success")
                            print(sub as Any)
                            
                            self.backEnd.getJSONUser(query: sub!, completion:{ (user) in
                               // print(user)
                                print(user.lastName! as Any)
                                self.username = user.username!
                                print("USERNAME IS:", self.username)
                            })
                            
            
                            
                        }
                        
                    })
                    print("Successful log in")
                    //how to get the TOKEN and store it? then verify it????
                    //return result.model!
                
        backEnd.getJSONPosts(completion:{ arrayPosts in
                print("Posts before assign: \(self.userPosts.count)")
                for p in arrayPosts{
                    if (p.type==PostType.POST) {
                        self.userPosts.append(p)
                    }
                }
                         //self.notifications = arrayPosts
                self.tableViewUserPosts.reloadData()
                print("arrayPosts: \(arrayPosts.count)")
                print("Notifications After Assign: \(self.userPosts.count)")
                for h in self.userPosts {
                    print(h.description as Any)
                         }
                })
                print("Posts Outside Assign: \(self.userPosts.count)")
    }
    
    @objc func didTapAddItemButton(_ sender: UIBarButtonItem)
    {
        navigationItem.title = nil
        self.performSegue(withIdentifier: "newPostSegue", sender: "self")
    }
    
//    var userPosts = [
//        CellDataPostsDemo(userAvatar: "profile", userName: "Bork", postImage: "horseImg", postDescription: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
//        CellDataPostsDemo(userAvatar: "profile", userName: "Bork", postImage: "horseImg", postDescription: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
//        CellDataPostsDemo(userAvatar: "profile", userName: "Bork", postImage: "horseImg", postDescription: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
//        ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCellPosts", for: indexPath) as! CustomCellUserPosts

        let post = userPosts[indexPath.row]
        
        cell.userName?.text = "NAME"//self.username// post.user?.username
        cell.userImg?.image = UIImage(named: "profile")//should be avatar of user
        cell.postImage?.image = UIImage(named: post.imageUrl!)
        cell.postDescription?.text = post.description

        return cell
    }
}

class CustomCellUserPosts : UITableViewCell{
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postDescription: UITextView!
    
    
}
