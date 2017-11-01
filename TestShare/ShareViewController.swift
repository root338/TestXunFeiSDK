//
//  ShareViewController.swift
//  TestShare
//
//  Created by DY on 2017/10/25.
//  Copyright © 2017年 DY. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
        
        for inputItem in self.extensionContext!.inputItems {
            
            let itemAttachments = (inputItem as? NSExtensionItem)?.attachments;
            
            if itemAttachments != nil {
                
                for paramItemAttachment in itemAttachments! {
                    
                    let publicURL = "public.url"
                    if let itemAttachment = paramItemAttachment as? NSItemProvider {
                        
                        if itemAttachment.hasItemConformingToTypeIdentifier(publicURL) {
                            
                            itemAttachment.loadItem(forTypeIdentifier: publicURL, options: nil, completionHandler: { (item : NSSecureCoding?, err : Error!) in
                                
                                if let urlObj = item as? NSURL {
                                    print("分享的链接地址: \(urlObj.absoluteString ?? "空")")
                                }
                            })
                        }
                        
                    }
                }
            }
        }
        
        
        
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
//        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
