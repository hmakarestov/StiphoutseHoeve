//
//  DashboardViewController.swift
//  HorseStable
//
//  Created by Student on 13/12/2019.
//  Copyright © 2019 smartmobile. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITextViewDelegate {
    let url = URL(string: "http://localhost:8083/horse/1")!

    
    let transiton = HamburgerMenu()
    var topView: UIView?
    
    @IBOutlet weak var btnPush: UIButton!
    @IBOutlet weak var textViewNotification: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var backendHelper = BackendHelper(url: url)
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        
        textViewNotification.delegate = self
        textViewNotification.text = "Leave a notification for all users."
        textViewNotification.textColor = UIColor.lightGray
        pushButtonUpdate()
        // Do any additional setup after loading the view.
            
        
      
    }
    
    func pushButtonUpdate() {
        btnPush.layer.cornerRadius = 13
        btnPush.clipsToBounds = true    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textViewNotification.textColor == UIColor.lightGray {
            textViewNotification.text = nil
            textViewNotification.textColor = UIColor.black
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

        @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
            
            guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "HamburgerMenuViewController") as? HamburgerMenuViewController else { return }
            menuViewController.didTapMenuType = { menuType in
                self.transitionToNew(menuType)
            }
            menuViewController.modalPresentationStyle = .overCurrentContext
            menuViewController.transitioningDelegate = self
            present(menuViewController, animated: true)
        }

        func transitionToNew(_ menuType: MenuType) {
          //  let title = String(describing: menuType).capitalized
         //   self.title = title

            topView?.removeFromSuperview()
            switch menuType {
            case .profile:
                 performSegue(withIdentifier: "ProfileID", sender: nil)
             //   let view = UIView()
              //  view.backgroundColor = .yellow
               // view.frame = self.view.bounds
             //   self.view.addSubview(view)
             //   self.topView = view
            case .users:
                performSegue(withIdentifier: "UserID", sender: nil)
            case .horses:
                performSegue(withIdentifier: "HorseID", sender: nil)
            case .notifications:
                performSegue(withIdentifier: "NotificationsID", sender: nil)
            case .logout:
                let alertController = UIAlertController(title: "Log out", message:
                       "Are you sure you want to log out?", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Yes", style: .default,  handler: { action in
                    self.performSegue(withIdentifier: "LogoutID", sender: nil)
                }))
                
                 alertController.addAction(UIAlertAction(title: "No", style: .default))

                self.present(alertController, animated: true, completion: nil)
                
               
            default:
                break
            }
        }

    }

extension DashboardViewController: UIViewControllerTransitioningDelegate {
      func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
          transiton.isPresenting = true
          return transiton
      }

      func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
          transiton.isPresenting = false
          return transiton
      }
  }

