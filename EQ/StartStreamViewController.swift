//
//  StartStreamViewController.swift
//  EQ
//
//  Created by Alexander Warren on 3/17/18.
//  Copyright © 2018 Alexander Warren. All rights reserved.
//

import UIKit

class StartStreamViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var questions = [Question]()
    
    let subjects = [
        "Math",
        "Physics",
        "English",
        "History"
    ]
    
    var currentSubject = "Math"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return subjects.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return subjects[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentSubject = subjects[row]
    }
    
    @IBOutlet weak var subjectPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        subjectPickerView.delegate = self
        RequestHandler.makeRequestToURL(url: "\(Constants.serverURL)/joingame", withHandler: { (json) in
            var questions = [Question]()
            for i in 1...json.count {
                let question = Question(json: json["q\(i)"] as! [String : Any])
                questions.append(question)
            }
            self.questions = questions
            
        })    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TeacherStreamViewController{
            vc.currentSubject = currentSubject
            vc.questions = questions
        }
    }
    

}
