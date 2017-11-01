//
//  TAAppDelegateExtension.swift
//  TestAudio
//
//  Created by DY on 2017/11/1.
//  Copyright © 2017年 DY. All rights reserved.
//

import UIKit

extension UIApplication {
    
    func handleURL(_ url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> TAFile {
        
        let urlStr = url.absoluteString
        let pathExtension = (urlStr as NSString).pathExtension
        
        var fileType = TAFileType.unknown
        switch pathExtension {
        case "m4a":
            fileType = .audio
        default: break
            
        }
        
        let fileObj = TAFile.init(fileType: fileType, fileExtension: pathExtension, fileOriginURL: url)
        
        return fileObj
    }
    
    func pushTargetViewController(fileObj: TAFile) -> Bool {
        
        if let rootViewController = self.keyWindow?.rootViewController {
            
            let detailVC = TADetailViewController.init(fileData: fileObj)
            
            (rootViewController as? UINavigationController)?.pushViewController(detailVC, animated: true)
        }
        
        return true
    }
}
