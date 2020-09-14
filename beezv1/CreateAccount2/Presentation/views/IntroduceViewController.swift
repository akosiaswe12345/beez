//
//  IntroduceViewController.swift
//  beez
//
//  Created by Taison Digital on 14/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit
import AVFoundation

class IntroduceViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var viewLayer: UIView!
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var btnRecord: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         initView()
        
        recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    } else {
                        // failed to record!
                    }
                }
            }
        } catch {
            // failed to record!
        }
    }
    
    func loadRecordingUI() {
    //    btnRecord = UIButton(frame: CGRect(x: 64, y: 64, width: 128, height: 64))
        btnRecord.setTitle("Tap to Record", for: .normal)
        btnRecord.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        btnRecord.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        view.addSubview(btnRecord)
    }
    
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.mp4")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()

            btnRecord.setTitle("Tap to Stop", for: .normal)
        } catch {
            finishRecording(success: false)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil

        if success {
            btnRecord.setTitle("Tap to Re-record", for: .normal)
        } else {
            btnRecord.setTitle("Tap to Record", for: .normal)
            // recording failed :(
        }
    }
    
    @objc func recordTapped() {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    func initView(){
        btnGradient()
        progressView()
    }
    
    @IBAction func btnBack(_ sender: Any) {
           dismiss(animated: false, completion: nil)
       }
    
    private func btnGradient(){
        let colors = [hexStringToUIColor(hex: "#FFED86"), hexStringToUIColor(hex: "#FFB439")]
        btnContinue.setGradientBackgroundColors(colors, direction: .toBottomLeft, for: .normal)
        btnContinue.layer.cornerRadius = 5
        btnContinue.clipsToBounds = true
    }
    
    func progressView(){
        let colors = [hexStringToUIColor(hex: "#FFB439").cgColor, hexStringToUIColor(hex: "#FFED86").cgColor]
             
        viewLayer.layer.masksToBounds = true
        viewLayer.layerGradient(startPoint: .centerRight, endPoint: .centerLeft, colorArray: colors, type: .axial)
    }

}
