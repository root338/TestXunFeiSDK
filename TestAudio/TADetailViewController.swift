//
//  TADetailViewController.swift
//  TestAudio
//
//  Created by DY on 2017/11/1.
//  Copyright © 2017年 DY. All rights reserved.
//

import UIKit

class TADetailViewController: UIViewController, IFlySpeechRecognizerDelegate {

    var fileData : TAFile
    
    let speechRecognizer = IFlySpeechRecognizer.sharedInstance()!
    
    var resultList = String()
    
    init(fileData: TAFile) {
        
        self.fileData   = fileData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        speechRecognizer.delegate   = self
        // Do any additional setup after loading the view.
        
        self.handleAudio()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleAudio() {
        
        //设置音频源为音频流（-1）
        speechRecognizer.setParameter("-1", forKey: "audio_source")
        
        let result = speechRecognizer.startListening()
        
        if result {
            
            let dataList = fileData.getFileDataList()
            for subdata in dataList {
                speechRecognizer.writeAudio(subdata)
            }
            
            speechRecognizer.stopListening()
        }
    }

    //MARK:- IFlySpeechRecognizerDelegate
    func onError(_ errorCode: IFlySpeechError!) {
        
    }
    
    func onResults(_ results: [Any]!, isLast: Bool) {
        
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
