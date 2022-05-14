//
//  ViewController.swift
//  Task
//
//  Created by Osama Walid on 14/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
   
    
    @IBOutlet weak var tabsCollectionView: UICollectionView!
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var listSwitcher: UIButton!
    @IBOutlet weak var gridSwitcher: UIButton!
    @IBOutlet weak var serachTextField: UITextField!
    var photos:[Photo] = []
    var layoutType = 2
    var currentPage = 1
    var totalOfPages = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
       // tabsCollectionView.dataSource = self
      //  tabsCollectionView.delegate = self
        
        serachTextField.layer.cornerRadius = 10
        serachTextField.addPadding(padding: .equalSpacing(8))
        serachTextField.currencyLeftVeiw(image: UIImage(named: "ic_serach")!)
        // Do any additional setup after loading the view.
    }

    @IBAction func switchLayout(_ sender: UIButton) {
        if sender == gridSwitcher {
            layoutType = 2
        }else {
            layoutType = 1
        }
        photosCollectionView.reloadData()
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == photosCollectionView {
            let width = collectionView.frame.width / CGFloat(layoutType)
            return CGSize(width: width, height: width * 1.5)
        }else {
            return CGSize(width: 120.0, height: collectionView.frame.height)
        }
     
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == photosCollectionView {
            return photos.count
        }else {
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == photosCollectionView {
          
        }else {
        }
        return UICollectionViewCell()
    }
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == photosCollectionView {
         
        }else {
        }
    }
}
