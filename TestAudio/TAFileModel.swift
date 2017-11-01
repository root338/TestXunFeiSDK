//
//  TAFileModel.swift
//  TestAudio
//
//  Created by DY on 2017/11/1.
//  Copyright © 2017年 DY. All rights reserved.
//

import UIKit

enum TAFileType {
    case unknown
    case audio
}

class TAFile : NSObject {
    
    /// 文件类型
    let fileType : TAFileType
    
    /// 文件扩展名
    let fileExtension : String
    
    /// 文件原始链接
    let fileOriginURL : URL
    
    var isDidSaveLocal: Bool {
        return isDidSaveLocalMark
    }
    
    /// 是否已经保存本地
    fileprivate var isDidSaveLocalMark : Bool = false
    
    init(fileType: TAFileType, fileExtension: String, fileOriginURL: URL) {
        
        self.fileType       = fileType
        self.fileExtension  = fileExtension
        self.fileOriginURL  = fileOriginURL
        super.init()
    }
}

extension TAFile {
    
    func getFileData() -> Data? {
        
        let fileData = try? Data.init(contentsOf: self.fileOriginURL)
        
        return fileData
    }
    
    func getFileDataList(index: Int) -> Array<Data> {
        
        var fileDataList = [Data]()
        if let fileData = self.getFileData() {
            
            var startIndex      = fileData.startIndex
            let endIndex        = fileData.endIndex
            var currentEndIndex = min(startIndex.advanced(by: index), endIndex)
            
            while startIndex <= currentEndIndex {
                
                let subData = fileData.subdata(in: startIndex..<currentEndIndex)
                fileDataList.append(subData)
                
                if currentEndIndex == endIndex {
                    
                    break
                }else {
                    
                    startIndex = currentEndIndex
                    currentEndIndex = min(startIndex.advanced(by: index), endIndex)
                }
            }
        }
        
        return fileDataList
    }
    
    func getFileDataList() -> Array<Data> {
        
        return getFileDataList(index: 1024 * 1024)
    }
}

