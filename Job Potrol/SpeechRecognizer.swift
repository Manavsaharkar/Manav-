//
//  SpeechRecognizer.swift
//  Job Potrol
//
//  Created by Manav on 17/04/25.
//

//import Foundation
//import Speech
//
//class SpeechRecognizer: ObservableObject {
//    private var speechRecognizer = SFSpeechRecognizer()
//    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
//    private var recognitionTask: SFSpeechRecognitionTask?
//    private let audioEngine = AVAudioEngine()
//    
//    @Published var recognizedText = ""
//
//    func startRecording() {
//        recognizedText = ""
//        
//        let audioSession = AVAudioSession.sharedInstance()
//        try? audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
//        try? audioSession.setActive(true, options: .notifyOthersOnDeactivation)
//        
//        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
//        
//        guard let inputNode = audioEngine.inputNode else {
//            return
//        }
//        
//        guard let recognitionRequest = recognitionRequest else {
//            return
//        }
//        
//        recognitionRequest.shouldReportPartialResults = true
//        
//        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
//            if let result = result {
//                DispatchQueue.main.async {
//                    self.recognizedText = result.bestTranscription.formattedString
//                }
//            }
//            if error != nil {
//                self.stopRecording()
//            }
//        }
//        
//        let recordingFormat = inputNode.outputFormat(forBus: 0)
//        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
//            recognitionRequest.append(buffer)
//        }
//        
//        audioEngine.prepare()
//        try? audioEngine.start()
//    }
//
//    func stopRecording() {
//        audioEngine.stop()
//        audioEngine.inputNode.removeTap(onBus: 0)
//        recognitionRequest?.endAudio()
//    }
//}

import Foundation
import Speech
import AVFoundation

class SpeechRecognizer: ObservableObject {
    private var speechRecognizer = SFSpeechRecognizer()
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    @Published var recognizedText = ""

    func startRecording() {
        recognizedText = ""
        
        // Setting up the audio session
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Audio session setup failed with error: \(error.localizedDescription)")
            return
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        // Ensuring we have an input node available
        let inputNode = audioEngine.inputNode
        
        // Ensure the recognition request is not nil
        guard let recognitionRequest = recognitionRequest else {
            return
        }
        
        recognitionRequest.shouldReportPartialResults = true
        
        // Starting the speech recognition task
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
            if let result = result {
                DispatchQueue.main.async {
                    self.recognizedText = result.bestTranscription.formattedString
                }
            }
            if let error = error {
                self.stopRecording()
                print("Recognition error: \(error.localizedDescription)")
            }
        }
        
        // Setting up the audio format and buffer
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
            recognitionRequest.append(buffer)
        }
        
        // Preparing and starting the audio engine
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            print("Audio engine start failed with error: \(error.localizedDescription)")
            return
        }
    }

    func stopRecording() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        recognitionRequest?.endAudio()
    }
}
