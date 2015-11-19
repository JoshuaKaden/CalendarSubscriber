//
//  CalendarView.swift
//  CaldendarSubscriber
//
//  Created by Kaden, Joshua on 11/19/15.
//  Copyright © 2015 Kaden, Joshua. All rights reserved.
//

import UIKit

class CalendarView: UIView {

    var buttonTapAction: TapAction? {
        get {
            return subscribeButton.tapAction
        }
        set {
            subscribeButton.tapAction = newValue
        }
    }
    
    var listLabelText: String? {
        get {
            return subscribedListLabel.text
        }
        set {
            subscribedListLabel.text = newValue
        }
    }
    
    var subscribeToText: String? {
        get {
            return subscribeToTextField.text
        }
        set {
            subscribeToTextField.text = newValue
        }
    }
    
    private let subscribeToTextField = UITextField()
    private let subscribeButton = TapButton()
    private let subscribedToLabel = UILabel()
    private let subscribedListLabel = UILabel()
    
    override func willMoveToWindow(newWindow: UIWindow?) {
        super.willMoveToWindow(newWindow)
        if newWindow == nil { return }
        self.configure()
        self.addSubviews()
    }
    
    private func configure() {
        self.backgroundColor = UIColor.lightGrayColor()
        
        subscribeToTextField.backgroundColor = UIColor.whiteColor()
        subscribeToTextField.placeholder = "Paste an iCal URL here"
        
        subscribeButton.title = "Subscribe"
        
        subscribedToLabel.text = "Subscribed to:"
        
        subscribedListLabel.numberOfLines = 0
        subscribedListLabel.lineBreakMode = .ByWordWrapping
    }
    
    private func addSubviews() {
        self.addSubview(subscribeToTextField)
        self.addSubview(subscribeButton)
        self.addSubview(subscribedToLabel)
        self.addSubview(subscribedListLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let elementSize = CGSize(width: self.width, height: CGFloat(48))
        
        subscribeToTextField.size = elementSize
        subscribeToTextField.y = elementSize.height
        
        subscribeButton.size = elementSize
        subscribeButton.y = subscribeToTextField.maxY
        
        subscribedToLabel.size = elementSize
        subscribedToLabel.y = subscribeButton.maxY
        
        subscribedListLabel.size = CGSize(width: elementSize.width, height: self.height - subscribedToLabel.maxY)
        subscribedListLabel.y = subscribedToLabel.maxY
    }
    
}
