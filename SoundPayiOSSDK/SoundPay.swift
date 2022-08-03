//
//  SoundPayiOSSDK.swift
//  SoundPayiOSSDK
//
//  Created by Naeem Hussain on 03/08/2022.
//

import Foundation
import AVFoundation
import UIKit
import AudioToolbox


protocol SoundPayiOSSDKDelegate
{
    func messageDidReceive(_ string :String)
    func messageDidSend()
}

@objc public class SoundPay: NSObject {
    
    @objc static var shared = SoundPay()
    
    private var soundPayObj : SoundPaySDK!
    var delegate : SoundPayiOSSDKDelegate?
    
    private override init() {
        super.init()
        
        print("Initializer called .... ")
        soundPayObj = SoundPaySDK()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.notificationReceived(notification:)), name: Notification.Name("SoundPaySdkNotificationObserver"), object: nil)
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("SoundPaySdkNotificationObserver"), object: nil)
    }
    
    @objc func notificationReceived(notification: Notification) {
        
        print("Notification have received")
        
        if let userInfo = notification.userInfo as? [String: Any] {
            let infoType = userInfo["sdk_title"] as! String
            if let sdkMessage = userInfo["string_message"] as? String
            {
                self.delegate?.messageDidReceive(sdkMessage)
            }
            else {
                delegate?.messageDidSend()
            }
        }
    }
    
    func broadCastText(_ string: String)
    {
        if string.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
            
            self.soundPayObj.startPlayback(string.trimmingCharacters(in: .whitespacesAndNewlines))
        }
    }
    
    func receiveBroadcastText()
    {
        self.soundPayObj.startCapture()
    }
    
    func stopBroadCast()
    {
        self.soundPayObj.stopPlayback()
    }
    
    func stopReceiving()
    {
        self.soundPayObj.stopCapturing()
    }
    
}
