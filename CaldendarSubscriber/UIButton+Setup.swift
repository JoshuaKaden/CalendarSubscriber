//
//  UIButton+Setup.swift
//  ThreeOneOne
//
//  Created by Kaden, Joshua on 10/26/15.
//  Copyright © 2015 NYC DoITT. All rights reserved.
//

import UIKit

extension UIButton {
    
    /** Convenience property for the UIControlState.Normal title of this UIButton. */
    var title: String? {
        get { return self.titleForState(.Normal) }
        set { self.setTitle(newValue, forState: .Normal) }
    }
    
    /** Convenience property for the titleLabel.font of this button. */
    var titleFont: UIFont? {
        get { return self.titleLabel?.font }
        set { self.titleLabel?.font = newValue }
    }
    
    /** Convenience property for the UIControlState.Normal color of this button. */
    var titleColor: UIColor? {
        get { return self.titleColorForState(.Normal) }
        set { self.setTitleColor(newValue, forState: .Normal) }
    }
    
}
