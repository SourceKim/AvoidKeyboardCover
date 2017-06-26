//
//  TempViewController.swift
//  AvoidKeyBoardCover
//
//  Created by kim on 2017/6/25.
//  Copyright © 2017年 kim. All rights reserved.
//

import UIKit

class TempViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tbView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let w = self.view.frame.width
        let h = self.view.frame.height
        let theFrame = CGRect(x: 0, y: 100, width: w, height: h - 100)
        
        // 创建tableView
        tbView = UITableView(frame: theFrame, style: .plain)
        tbView.delegate = self
        tbView.dataSource = self
        tbView.register(TestTableViewCell.self, forCellReuseIdentifier: "id")
        self.view.addSubview(tbView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(noti:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(noti:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
//  tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        
//        cell.textLabel?.text = "aa + \(indexPath.item)"
        
        return cell
    }
    
//  keyboard
    
    func keyboardWillShow(noti:NSNotification){
        
        let uf = noti.userInfo!
        let keyBoardSize = (uf[UIKeyboardFrameBeginUserInfoKey]) as! CGRect
        
        var contentInsets : UIEdgeInsets
        
        let orient = UIApplication.shared.statusBarOrientation
        
        print(keyBoardSize.height)
        
        if UIInterfaceOrientationIsPortrait(orient){
            contentInsets = UIEdgeInsetsMake(0, 0, keyBoardSize.height, 0)
        }else{
            contentInsets = UIEdgeInsetsMake(0, 0, keyBoardSize.width, 0)
        }
        
        self.tbView.contentInset = contentInsets
        self.tbView.scrollIndicatorInsets = contentInsets
        
    }
    
    func keyboardWillHide(noti:NSNotification){
        
        let contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.tbView.contentInset = contentInset
        self.tbView.scrollIndicatorInsets = contentInset
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
