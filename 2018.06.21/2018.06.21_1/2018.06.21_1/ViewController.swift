//
//  ViewController.swift
//  2018.06.21_1
//
//  Created by admin on 2018/6/21.
//  Copyright © 2018年 Simon Chang. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var speakOutlet: UIButton!
    @IBOutlet weak var checkOutlet: UIButton!
    let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "zh_Hant_TW"))!
    let tmpURL = URL(fileURLWithPath: NSTemporaryDirectory() + "sudio.m4a")
    var audioRecorder: AVAudioRecorder?
    var ledURL = "http://192.168.211.146/cgi-bin/led.cgi?pin=12&ison="
    
    @IBAction func startSpeaking(_ sender: UIButton) {
        if let audioRecorder = audioRecorder {
            let session = AVAudioSession.sharedInstance()
            do {
                try session.setCategory(AVAudioSessionCategoryRecord)
                try session.setMode(AVAudioSessionModeMeasurement)  //最小化所需資源
                try session.setActive(true, with: .notifyOthersOnDeactivation)
                
            }catch {
                let alert = UIAlertController(title: "Error", message: "message wrong", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(onAction)
                self.present(alert,animated: true,completion: nil)
                print("SessionError : \(error)")
                
            }
            
            audioRecorder.record()
            speakOutlet.isEnabled = false
            checkOutlet.isEnabled = true
        }
    }
    @IBAction func startCheck(_ sender: Any) {
        if let audioRecorder = audioRecorder {
            audioRecorder.stop()
            let request = SFSpeechURLRecognitionRequest(url: tmpURL)    //需要連網  上傳到apple伺服器辨識
            recognizer.recognitionTask(with: request) { (result, error) in
                self.speakOutlet.isEnabled = true
                self.checkOutlet.isEnabled = false
                if let result = result {
                    if result.isFinal {
                        let text = result.bestTranscription.formattedString
                        self.textView.text = text
                        
                        if text.contains("開"), text.contains("燈"), !text.contains("不") {
                            self.ctrlLED(isOn: true)
                        }
                        if text.contains("燈"), text.contains("關"), !text.contains("不") {
                            self.ctrlLED(isOn: false)
                        }
                        
                    }
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        checkOutlet.isEnabled = false
        speakOutlet.isEnabled = false
        SFSpeechRecognizer.requestAuthorization { (status) in
            DispatchQueue.main.async {
                switch status {
                case .authorized:
                    self.speakOutlet.isEnabled = true
                default:
                    self.speakOutlet.isEnabled = false
                }
            }
        }
        
        let settings = [
            AVFormatIDKey:NSNumber(value: kAudioFormatMPEG4AAC)
        ]
        audioRecorder = try? AVAudioRecorder(url: tmpURL, settings: settings)
        
        
    }
    
    func ctrlLED(isOn: Bool) {
        
        var url: URL? = nil
        if isOn {
            url = URL(string: ledURL + "1")
        }else {
            url = URL(string: ledURL + "0")
        }
        DispatchQueue.main.async {
            let _ = try! String(contentsOf: url!)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

