//
//  TestTableViewCell.swift
//  AvoidKeyBoardCover
//
//  Created by kim on 2017/6/25.
//  Copyright © 2017年 kim. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    var tfLabel : UILabel!
    var theTextField : UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        tfLabel = UILabel(frame: CGRect.null)
        tfLabel.textColor = UIColor.black
        tfLabel.font = UIFont.systemFont(ofSize: 16)
        tfLabel.text = "textField : "
        self.addSubview(tfLabel)
        
        theTextField = UITextField(frame: CGRect.null)
        theTextField.textColor = UIColor.black
        theTextField.backgroundColor = UIColor.lightGray
        theTextField.font = UIFont.systemFont(ofSize: 16)
        theTextField.delegate = self
        theTextField.contentVerticalAlignment = .center
        self.addSubview(theTextField)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tfLabel.frame = CGRect(x: 15, y: 0, width: 200, height: self.bounds.size.height / 2)
        tfLabel.sizeToFit()
        theTextField.frame = CGRect(x: tfLabel.frame.maxX + 10, y: 0, width: self.bounds.size.width - (tfLabel.frame.maxX + 10),height: self.bounds.size.height / 2)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.theTextField.resignFirstResponder()
        return false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
