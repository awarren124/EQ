//
//  JoinIfGameViewController.swift
//  EQ
//
//  Created by Alexander Warren on 3/17/18.
//  Copyright © 2018 Alexander Warren. All rights reserved.
//

import UIKit

class JoinIfGameViewController: UIViewController {

//    @IBOutlet weak var joinIfGameButton
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func joinIfGameButtonPressed(_ sender: UIButton) {
//        print("here")
//        RequestHandler.postRequestToURL(url: "\(Constants.serverURL)/joingame", info: "Alexander Warren", withHandler: { (json) in
//            print("here2")
//            var questions = [Question]()
//            for i in 1...json.count {
//                let question = Question(json: json["q\(i)"] as! [String : Any])
//                questions.append(question)
//            }
//            let sb = UIStoryboard(name: "Main", bundle: nil)
//            let vc = sb.instantiateViewController(withIdentifier: "StudentStreamViewController") as! StudentStreamViewController
//            vc.questions = questions
//            self.present(vc, animated: true, completion: nil)
//            
//        })
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
