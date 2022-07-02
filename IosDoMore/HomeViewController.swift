//
//  HomeViewController.swift
//  IosDoMore
//
//  Created by Mirzabek on 02/07/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
 

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let numberOfCloumns: CGFloat = 2
    var items : Array<Item> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initview()
    }
    
    // MARK: - Method
    func initview(){
        advantageview()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil),forCellWithReuseIdentifier: "myCell")
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidth = screenSize.width / numberOfCloumns - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        items.append(Item(title: "BestCoding", image: "macbook"))
        items.append(Item(title: "ios Developer", image: "ios"))
        items.append(Item(title: "BestCoding", image: "macbook"))
        items.append(Item(title: "ios Developer", image: "ios"))
        items.append(Item(title: "BestCoding", image: "macbook"))
        items.append(Item(title: "ios Developer", image: "ios"))
        items.append(Item(title: "BestCoding", image: "macbook"))
        items.append(Item(title: "ios Developer", image: "ios"))


    }
    func advantageview(){
        let page = UIImage(systemName: "text.bubble.fill")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: page, style: .plain, target: self, action: #selector(scrollTapped))
        title = "Colletion View"
    }
  
    func callDetailsController1(){
                 let vc = scrollViewController(nibName: "scrollViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
             }

    
    // MARK: - Actions
    @objc func scrollTapped(){
        callDetailsController1()
    }
    
    
    // MARK: - collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let items = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
      
       cell.nameLabel.text = items.title
       cell.imageView.image = UIImage(named: items.image)

        return cell
        
    }
    

}
