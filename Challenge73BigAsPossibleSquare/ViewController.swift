//
//  ViewController.swift
//  Challenge73BigAsPossibleSquare
//
//  Created by Herve Desrosiers on 2020-03-10.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //my solution: ok but doesn't use inequality and optional constraints
//    private func setupView() {
//        view.addSubview(greenSquare)
//        let size = view.bounds.width > view.bounds.height ? view.bounds.height : view.bounds.width
//        NSLayoutConstraint.activate([
//            greenSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            greenSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            greenSquare.widthAnchor.constraint(equalToConstant: size),
//            greenSquare.heightAnchor.constraint(equalTo: greenSquare.widthAnchor)
//        ])
//    }
    
    //book's solution using inequality and optional constraints
    private func setupView() {
        view.addSubview(greenSquare)
        // optional constraint
        let optionalWidth = greenSquare.widthAnchor.constraint(equalTo: view.widthAnchor)
        optionalWidth.priority = .defaultHigh
        NSLayoutConstraint.activate([
            greenSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greenSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenSquare.heightAnchor.constraint(equalTo: greenSquare.widthAnchor),
            
            // width and height can grow up to the size of the root view
            greenSquare.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
            greenSquare.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor),
            
            // Pull the width as close as possible to the width
            // of the root view (without violating other required constraints)
            optionalWidth
        ])
    }



    private let greenSquare: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
}

