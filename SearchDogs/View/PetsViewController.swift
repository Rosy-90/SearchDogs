//
//  ViewController.swift
//  SearchDogs
//
//  Created by Rosy Patel on 28/04/2022.
//

import UIKit

protocol PetsViewControllerProtocol: class {
    func updateUI()
    func showError()
}

class PetsViewController: UIViewController, Storyboarded {
    
    weak var coordinator: Coordinator? //Coordinator

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

