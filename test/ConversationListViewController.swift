//
//  ConversationListViewController.swift
//  test
//
//  Created by jean on 15/8/31.
//  Copyright © 2015年 峂峂. All rights reserved.
//

import UIKit
import KxMenu

class ConversationListViewController: RCConversationListViewController {

    @IBAction func showMenu(sender: UIBarButtonItem) {
        var frame = sender.valueForKey("view")?.frame
        frame?.origin.y = (frame?.origin.y)! + 30
        
        KxMenu.showMenuInView(self.view, fromRect: frame!, menuItems: [
            
            KxMenuItem("客服", image:UIImage(named: "serve"), target:self, action: "ClickMenu1"),
            KxMenuItem("关于", image:UIImage(named: "about"), target:self, action: "ClickMenu1"),
            
            
            ])
        
    }
    
    func ClickMenu1() {
        print("点击1")
    }
    
    
    let conVC = RCConversationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        appDelegate?.connectServer({ () -> Void in
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue
                
                ])
            self.refreshConversationTableViewIfNeeded()
        })
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destVC = segue.destinationViewController as? RCConversationViewController
        
        destVC?.targetId = self.conVC.targetId
        destVC?.userName = self.conVC.userName
        destVC?.conversationType = self.conVC.conversationType
        destVC?.title = self.conVC.title 
        
        
        
        
        self.tabBarController?.tabBar.hidden = true
    }
    
    
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        //代码跳转到会话界面
//        let conVC = RCConversationViewController()
//        
//        conVC.targetId = model.targetId
//        conVC.userName = model.conversationTitle
//        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
//        conVC.title = model.conversationTitle
//        
//        self.navigationController?.pushViewController(conVC, animated: true)
//        self.tabBarController?.tabBar.hidden = true
        
        
        
                conVC.targetId = model.targetId
                conVC.userName = model.conversationTitle
                conVC.conversationType = RCConversationType.ConversationType_PRIVATE
                conVC.title = model.conversationTitle
        
        self.performSegueWithIdentifier("tapOnCell", sender: self)
        
    }

}
