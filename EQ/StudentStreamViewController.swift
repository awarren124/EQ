//
//  StudentStreamViewController.swift
//  EQ
//
//  Created by Alexander Warren on 3/17/18.
//  Copyright © 2018 Alexander Warren. All rights reserved.
//

import UIKit
//import MobileVLCKit
//import Pl
//import
import AVKit
class StudentStreamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var currentQuestionLabel: UILabel!
    var questions = [Question]()
    var currentQuestion: Question!
    var questionIndex = 0
    var revealAnswer = false
    var requestTimer = Timer()
    @IBOutlet weak var answersTableView: UITableView!
    @IBOutlet weak var streamView: UIView!
    override func viewDidLoad() {
        currentQuestion = questions[0]
//        print()
        super.viewDidLoad()
        answersTableView.delegate = self
        answersTableView.dataSource = self
        answersTableView.layer.cornerRadius = 15
        answersTableView.layer.borderColor = UIColor.lightGray.cgColor
        answersTableView.layer.borderWidth = 7
        currentQuestion = questions[0]
        currentQuestionLabel.text = currentQuestion.question
        requestTimer = Timer.scheduledTimer(timeInterval: 5, target: self,   selector: (#selector(StudentStreamViewController.updateQuestion)), userInfo: nil, repeats: true)

        let url = URL(string: "http://54.91.20.135:8080/hls/stream.m3u8")
        let player = AVPlayer(url: url!)
        let playerController = AVPlayerViewController()
        
        playerController.player = player
//        self.addChildViewController(playerController)
        self.streamView.addSubview(playerController.view)
        playerController.view.frame = self.streamView.frame
        playerController.view.layer.zPosition = -10
        player.play()

        self.view.bringSubview(toFront: answersTableView)
        

    }
    
    override func viewDidLayoutSubviews() {
//        answersTableView.frame.size = answersTableView.contentSize
        answersTableView.isScrollEnabled = false
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Answer Cell Identifier")
        cell.textLabel?.text = currentQuestion.answers[indexPath.row]
        cell.detailTextLabel?.text = String(arc4random_uniform(10))
        if revealAnswer {
            if indexPath.row == currentQuestion.correctAnswerIndex {
                cell.backgroundColor = UIColor(red:0.48, green:0.96, blue:0.58, alpha:1.0)
            }else{
                cell.backgroundColor = UIColor(red:1.00, green:0.62, blue:0.62, alpha:1.0)
            }
        }else{
            cell.backgroundColor = UIColor.white
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = UIColor(red:0.69, green:1.00, blue:1.00, alpha:1.0)
        tableView.deselectRow(at: indexPath, animated: true)
        //send answer to server
    }
    
    @objc func updateQuestion(){
        currentQuestion = questions[questionIndex + 1]
        questionIndex += 1
        currentQuestionLabel.text = currentQuestion.question
        answersTableView.reloadData()
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
