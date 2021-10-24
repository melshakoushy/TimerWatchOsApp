//
//  NotificationIC.swift
//  TimerWatchOsApp WatchKit Extension
//
//  Created by Mahmoud Elshakoushy on 24/10/2021.
//

import WatchKit
import Foundation
import UserNotifications

class NotificationIC: WKUserNotificationInterfaceController {
    
    //MARK: - Outlets
    @IBOutlet weak var titleLbl: WKInterfaceLabel!
    @IBOutlet weak var bodyLbl: WKInterfaceLabel!
    
    
    // MARK: - View LifeCycle
    override init() {
       super.init()
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
    
    override func didReceive(_ notification: UNNotification) {
        self.titleLbl.setText("Dynamic Notif!")
        self.bodyLbl.setText("This is a dynamic notification!")
    }
}
