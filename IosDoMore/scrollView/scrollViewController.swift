//
//  scrollViewController.swift
//  IosDoMore
//
//  Created by Mirzabek on 02/07/22.
//

import UIKit

class scrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    // MARK: - Method
    func initView(){
        addvantageView()
    }

    func addvantageView(){
        let back = UIImage(systemName: "arrowshape.turn.up.backward")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(backTapped))
        title = "ScrollView"
    }
    @objc func backTapped(){
        navigationController?.popViewController(animated: true)
    }
}
