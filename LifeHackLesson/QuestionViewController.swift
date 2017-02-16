//
//  QuestionViewController.swift
//  LifeHackLesson
//
//  Created by Macbook on 07/02/2017.
//  Copyright © 2017 Chappy-App. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, Stateful {

     @IBOutlet weak var titleLabel: UILabel!
     @IBOutlet weak var bodyLabel: UILabel!
     @IBOutlet weak var scoreLabel: UILabel!
     @IBOutlet weak var askerImageView: UIImageView!
     @IBOutlet weak var askerNameButton: UIButton!
     
     var modelController: ModelController!


         override func viewDidLoad() {
          super.viewDidLoad()
          
          let question = modelController.topQuestion
          titleLabel.text = question.title
          bodyLabel.text = question.body
          updateScore(for: question)
          let asker = question.owner
          askerImageView.image = UIImage(named: asker.profilePictureName)
          askerNameButton.setTitle(asker.name, for: .normal)
          
     }
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if let userViewController = segue.destination as? UserViewController {
               passState(to: userViewController)
               userViewController.user = modelController.topQuestion.owner
          }
     }

     
     fileprivate func updateScore(for question: Question) {
          scoreLabel.text = "\(question.score)"
     }
     
     @IBAction func voteUp(_ sender: Any) {
          modelController.topQuestion.voteUp()
          updateScore(for: modelController.topQuestion)
     
     }
     
     @IBAction func voteDown(_ sender: Any) {
          modelController.topQuestion.voteDown()
          updateScore(for: modelController.topQuestion)
     
     }
}

