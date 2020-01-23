
import UIKit

struct CellDataUsersDemo{
    let userAvatar : String
    let userName : String
    let postImage : String
    let postDescription : String
}

class ViewControllerUserProfile: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableViewUser: UITableView!    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    var backendHelper = BackendHelper ()
    var posts = [Post] ()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New Post", style: .plain, target: self, action: #selector(didTapAddItemButton))
        print("POST is being posted")
        backendHelper.getJSONPost( query:"1", completion: { (result) in
            print("miracle")
            print(result.count as Any )
                  // self.title = result.model?.chipNumber
            for p in result{
                self.posts.append(p)
            }
           // self.posts.append(result)
            print("Post is posted")
               })
        print("Posts : \(posts.count)")
    }
    
    @objc func didTapAddItemButton(_ sender: UIBarButtonItem)
    {
        navigationItem.title = nil
        self.performSegue(withIdentifier: "newPostSegue", sender: "self")
    }
    
//    var userPosts = [
//        CellDataPostsDemo(userAvatar: "profile", userName: "Bork Bork", postImage: "horseImg", postDescription: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
//        CellDataPostsDemo(userAvatar: "profile", userName: "Bork Bork", postImage: "horseImg", postDescription: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
//        CellDataPostsDemo(userAvatar: "profile", userName: "Bork Bork", postImage: "horseImg", postDescription: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
//        ]
//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return userPosts.count
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellUserProfiles", for: indexPath) as! CustomCellUser

       let post = posts[indexPath.row]// userPosts[indexPath.row]
        cell.textLabel?.text = String(self.posts[indexPath.row].id!)
        cell.detailTextLabel!.text = self.posts[indexPath.row].description
    
        cell.imageView?.image = UIImage(named: self.posts[indexPath.row].imageUrl!)//UIImage(named: "horse")
        userName?.text = post.user?.firstName
     //   userImage?.image = UIImage(named: "profile")
      //  cell.postImage?.image = UIImage(named: post.imageUrl!)
      //  cell.postDescription?.text = post.description

        return cell
    }
}

class CustomCellUser : UITableViewCell{
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postDescription: UITextView!
    
        
}

