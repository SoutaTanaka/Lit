//
//  SecondViewController.swift
//  Lit
//
//  Created by 田中颯太 on 2016/06/01.
//  Copyright © 2016年 田中颯太. All rights reserved.
//　http://anthrgrnwrld.hatenablog.com/entry/2015/10/27/221856
//　https://akira-watson.com/iphone/collectionview.html

import UIKit
import AssetsLibrary
class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var photo:[Data] = []
    @IBOutlet var collection: UICollectionView!
    let data: UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        if data.array(forKey: "photos") != nil{
            photo = data.array(forKey: "photos") as! [Data]
        }
        
        super.viewDidLoad()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let testCell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let imageView = testCell.contentView.viewWithTag(1) as! UIImageView
        let cellImage = photo[(indexPath as NSIndexPath).row]
        imageView.image = UIImage(data: cellImage)
        return testCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize:CGFloat = self.view.frame.size.width/2 - 10
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo.count
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func dele(_ sender: AnyObject) {
        
        if (photo.count != 0){
            if data.array(forKey: "photos") != nil {
                photo = data.array(forKey: "photos") as! [Data]
                photo.removeLast()
                collection.reloadData()
                data.set(photo, forKey: "photos")
            }
        }
        else if photo.isEmpty{
            // tesutoko-do
            
            let alert: UIAlertController = UIAlertController(title: "写真がありません", message: "写真を追加してください", preferredStyle:  UIAlertControllerStyle.alert)
            
            //
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            
            alert.addAction(defaultAction)
            
            
            present(alert, animated: true, completion: nil)
            
            
            //おわり
            
            
        }
        
    }
    @IBAction func pictur(_ sender: AnyObject) {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)){
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if  let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            let nsdata: Data = UIImagePNGRepresentation(editedImage)!
            photo.append (nsdata)
            collection.reloadData()
            data.set(photo, forKey: "photos")
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
}


