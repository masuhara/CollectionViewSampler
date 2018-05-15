//
//  ViewController.swift
//  CollectionViewSampler
//
//  Created by Masuhara on 2018/05/15.
//  Copyright © 2018年 Ylab, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // どこに色付ける？ 例: (3, 5)に黄色
    
    let space: CGFloat = 1.0
    let numberOfRow = 8
    let numberOfLine = 8
    
    @IBOutlet var sampleCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sampleCollectionView.dataSource = self
        sampleCollectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfRow * numberOfLine
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        // (8 * (y-1)) + (x-1) → N番目
        // 例: (3, 5)に置きたい場合
        let x = 7
        let y = 4
        let N = (numberOfRow * (y - 1)) + (x - 1)
        
        if indexPath.row == N {
            cell.backgroundColor = UIColor.yellow
        } else {
            cell.backgroundColor = UIColor.red
        }
        
        return cell
    }
    
    
    // MARK: - DelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (self.view.frame.width / CGFloat(numberOfLine)) - CGFloat(space)
        let height: CGFloat = width
        print(height)
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // 横スペース
        return space
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // 縦スペース
        return space
    }
    
}

