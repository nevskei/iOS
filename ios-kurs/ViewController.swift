//
//  ViewController.swift
//  ios-kurs
//
//  Created by user on 21.07.2018.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBAction func TwitterButton(_ sender: Any) {
        
    }
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("user").child("1").observeSingleEvent(of: .value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary
            let username = value?["name"]
            let photo = value?["src"]
            self.name.text = username as? String;
            
            if let filePath = Bundle.main.path(forResource: photo as? String, ofType: "jpg"), let image = UIImage(contentsOfFile: filePath) {
                self.myImage.contentMode = .scaleAspectFit
                self.myImage.image = image
            }
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

