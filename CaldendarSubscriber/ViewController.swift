//
//  ViewController.swift
//  CaldendarSubscriber
//
//  Created by Kaden, Joshua on 11/19/15.
//  Copyright © 2015 Kaden, Joshua. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController {

    private let eventStore = EKEventStore()
    
    override func loadView() {
        self.view = CalendarView()
    }
    
    private func calendarView() -> CalendarView {
        return self.view as! CalendarView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.eventStoreChanged()
        eventStore.requestAccessToEntityType(.Event) { (granted, error) -> Void in
            self.eventStoreChanged()
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "eventStoreChanged", name: EKEventStoreChangedNotification, object: eventStore)
        
        let calendarView = self.calendarView()
        calendarView.buttonTapAction = { [weak calendarView] in
            guard let urlString = calendarView?.subscribeToText else { return }
            guard let url = NSURL(string: urlString) else { return }
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func eventStoreChanged() {
        let calendars: [EKCalendar] = eventStore.calendarsForEntityType(.Event)
        self.calendarView().listLabelText = calendars.map{$0.title}.reduce("", combine: { $0 + "\n" + $1 })
    }

}
