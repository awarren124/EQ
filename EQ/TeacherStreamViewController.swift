//
//  ViewController.swift
//  EQ
//
//  Created by Alexander Warren on 3/17/18.
//  Copyright © 2018 Alexander Warren. All rights reserved.
//

import UIKit
import LFLiveKit


class TeacherStreamViewController: UIViewController, LFLiveSessionDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var currentQuestion = Question()
    var currentSubject = ""
    
    
    
    
    
    var session: LFLiveSession = {
        let audioConfiguration = LFLiveAudioConfiguration.defaultConfiguration(for: LFLiveAudioQuality.high)
        let videoConfiguration = LFLiveVideoConfiguration.defaultConfiguration(for: LFLiveVideoQuality.low3)
        let session = LFLiveSession(audioConfiguration: audioConfiguration, videoConfiguration: videoConfiguration)
        return session!
    }()
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var answersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        session.delegate = self
        session.preView = containerView
        
        answersTableView.delegate = self
        answersTableView.dataSource = self
        answersTableView.layer.cornerRadius = 15
        answersTableView.layer.borderColor = UIColor.lightGray.cgColor
        answersTableView.layer.borderWidth = 7

        requestAccessForVideo()
        requestAccessForAudio()
        
        let stream = LFLiveStreamInfo()
        let ip = "54.91.20.135"
        stream.url = "rtmp://\(ip)/live/stream"//"rtmp://ec2-54-84-157-89.compute-1.amazonaws.com/live/stream"//"rtmp://100.104.26.68/live/test"
        session.startLive(stream)
        
        RequestHandler.makeRequestToURL(url: "\(Constants.serverURL)/startgame")
        
    }
    
    override func viewDidLayoutSubviews() {
//        answersTableView.isScrollEnabled = false

        answersTableView.frame.size = answersTableView.contentSize
    }
    
    func requestAccessForVideo(){
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video);
        switch status  {
        case AVAuthorizationStatus.notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted) in
                if(granted){
                    DispatchQueue.main.async {
                        self.session.running = true
                    }
                }
            })
            break;
        case AVAuthorizationStatus.authorized:
            session.running = true;
            break;
        case AVAuthorizationStatus.denied: break
        case AVAuthorizationStatus.restricted:break;
        }
        
    }
    
    func requestAccessForAudio() -> Void {
        let status = AVCaptureDevice.authorizationStatus(for:AVMediaType.audio)
        switch status  {
        case AVAuthorizationStatus.notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.audio, completionHandler: { (granted) in
                
            })
            break;
        case AVAuthorizationStatus.authorized:
            break;
        case AVAuthorizationStatus.denied: break
        case AVAuthorizationStatus.restricted:break;
        }
    }
    
    func liveSession(_ session: LFLiveSession?, debugInfo: LFLiveDebug?) {
        print("debugInfo: \(debugInfo?.currentBandwidth)")
    }
    
    func liveSession(_ session: LFLiveSession?, errorCode: LFLiveSocketErrorCode) {
        print("errorCode: \(errorCode.rawValue)")
    }
    
    func liveSession(_ session: LFLiveSession?, liveStateDidChange state: LFLiveState) {
        print("liveStateDidChange: \(state.rawValue)")
        switch state {
        case LFLiveState.ready:
            print("ready")
            break;
        case LFLiveState.pending:
            print("pending")
            break;
        case LFLiveState.start:
            print("start")
            break;
        case LFLiveState.error:
            print("error")
            break;
        case LFLiveState.stop:
            print("stop")
            break;
        //        case LFLiveState.
        default:
            break;
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Answer Cell Identifier")
        cell.textLabel?.text = currentQuestion.answers[indexPath.row]
        cell.detailTextLabel?.text = String(arc4random_uniform(10))
        if indexPath.row == currentQuestion.correctAnswerIndex {
            cell.backgroundColor = UIColor(red:0.48, green:0.96, blue:0.58, alpha:1.0)
        }else{
            cell.backgroundColor = UIColor(red:1.00, green:0.62, blue:0.62, alpha:1.0)
        }
        return cell
    }
    
    @IBAction func newQuestionButtonPressed(_ sender: UIButton) {
        currentQuestion = QuestionBank.newQuestionForSubject(subject: currentSubject)
        let url = URL(string: Constants.serverURL)!
//        var request = URLRequest(url: url)
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//        let postString = "newQuestion"
//        request.httpBody = postString.data(using: .utf8)
//URLSession.shared.dataTask(with: <#T##URL#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            if let array = json as? [Any] {
                for item in array{
                    if let item = item as? [String:Any] {
                        
                    }
                    
                }
            }
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? StudentsTableViewController {
            //TODO: get the names of the students from the server
            vc.students = ["Alexander Warren", "Aidan Dunlap"]
        }
    }
    
    
}


