//
//  ViewController.swift
//  score
//
//  Created by s20151104681 on 17/5/8.
//  Copyright © 2017年 s20151104681. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var dlg=0
    var flagA=0
    var flagB=0
    var a:Int = 0
    var b:Int = 0
    var c:Int = 1
    var d:Int = 0
    var e:Int = 0
    var array1 : [Int] = [0,0,0]
    var array2 : [Int] = [0,0,0]
    @IBOutlet weak var temp: UITextField!
    @IBOutlet weak var temp1: UITextField!
    @IBOutlet weak var temp2: UITextField!
    @IBOutlet weak var temp3: UITextField!
    @IBOutlet weak var Bimage: UIImageView!
    @IBOutlet weak var Aimage: UIImageView!
    @IBAction func photo1(_ sender: Any) {
        if dlg==0{
            flagA=1
            flagB=0
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                //初始化图片控制器
                let picker = UIImagePickerController()
                //设置代理
                picker.delegate = self
                //指定图片控制器类型
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                //弹出控制器，显示界面
                self.present(picker, animated: true, completion: {
                    () -> Void in
                })
            }else{
                print("读取相册错误")
            }
        }
    }
   
   
    
    @IBAction func photo2(_ sender: Any) {
        if dlg==0{
            flagB=1
            flagA=0
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                //初始化图片控制器
                let picker = UIImagePickerController()
                //设置代理
                picker.delegate = self
                //指定图片控制器类型
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                //弹出控制器，显示界面
                self.present(picker, animated: true, completion: {
                    () -> Void in
                })
            }else{
                print("读取相册错误")
            }
        }
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看info对象
        print(info)
        //显示的图片
        let image:UIImage!
        //获取选择的原图
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        if(flagA==1){Aimage.image = image}
        else if(flagB==1){Bimage.image = image}
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    @IBAction func adda(_ sender: Any) {
        a=a+1
        if( b<21 && a==22 || b>=21 && a-b==2 )
        {
            temp1.text="\("第" + String(c) + "局a胜" + String(a) + ":" + String(b))"
            array1[c-1] = a
            array2[c-1] = b
            c=c+1
            a=0
            b=0
            d=d+1
            temp.text="\(d)"
            if (c == 4)
            {
                temp3.text="\("比赛结束" + String(d) + ":" + String(e))"
                temp1.text="\( "a赢  " )"
                c=1;
                d=0;
                e=0;
                temp2.text = "\(e)"
                temp.text="\(d)"
                
            }
        }else
        {
            temp1.text="\( String(a) + ":" + String(b) )"
            temp3.text="\("第" + String(c) + "局")"
        }
    }
    
    @IBAction func addb(_ sender: Any) {
        b=b+1
        if( a<21 && b==22 || a>=21 && b-a==2)
        {
            temp1.text="\("第" + String(c) + "局b胜" + String(a) + ":" + String(b))"
            array1[c-1] = a
            array2[c-1] = b
            c=c+1
            a=0
            b=0
            e=e+1
            temp2.text = "\(e)"
            if (c == 4)
            {
                temp3.text="\("比赛结束" + String(d) + ":" + String(e))"
                temp1.text="\( "b赢  " )"
                c=1;
                d=0;
                e=0;
                temp2.text = "\(e)"
                temp.text="\(d)"
            }
        }else
        {
            temp1.text="\( String(a) + ":" + String(b) )"
            temp3.text="\("第" + String(c) + "局")"
        }
    }
    
    @IBAction func acca(_ sender: Any) {
        if(a>0)
        {
            a=a-1
            if( a<21 && b==22 || a>=21 && b-a==2)
            {
                temp1.text="\("第" + String(c) + "局b胜" + String(a) + ":" + String(b))"
                array1[c-1] = a
                array2[c-1] = b
                c=c+1
                a=0
                b=0
                e=e+1
                temp2.text = "\(e)"
                if (c == 4)
                {
                    temp3.text="\("比赛结束" + String(d) + ":" + String(e))"
                    temp1.text="\( "b赢  " )"
                    c=1;
                    d=0;
                    e=0;
                    temp2.text = "\(e)"
                    temp.text="\(d)"
                }
            }else
            {
                temp1.text="\( String(a) + ":" + String(b) )"
            }
            
        }
        else if(a==0)
        {
            if(( c>=1 && d>=1))
            {
                a=array1[c-2]-1
                b=array2[c-2]
                c=c-1
                d=d-1
                temp3.text="\("第" + String(c) + "局")"
                temp.text="\(d)"
                temp1.text="\( String(a) + ":" + String(b) )"
            }
            
            
        }
    }
    
    @IBAction func accb(_ sender: Any) {
        if(b>0)
        {
            b=b-1
             temp1.text="\( String(a) + ":" + String(b) )"
            if( b<21 && a==22 || b>=21 && a-b==2 )
            {
                temp1.text="\("第" + String(c) + "局a胜" + String(a) + ":" + String(b))"
                array1[c-1] = a
                array2[c-1] = b
                c=c+1
                a=0
                b=0
                d=d+1
                temp.text="\(d)"
                if (c == 4)
                {
                    temp3.text="\("比赛结束" + String(d) + ":" + String(e))"
                    temp1.text="\( "a赢  " )"
                    c=1;
                    d=0;
                    e=0;
                    temp2.text = "\(e)"
                    temp.text="\(d)"
                }
                else
                {
                    temp1.text="\( String(a) + ":" + String(b) )"
                }
            }
            
        }
        else if(b==0)
        {
            if(( c>=1 && e>=1))
            {
                a=array1[c-2]
                b=array2[c-2]-1
                c=c-1
                e=e-1
                temp3.text="\("第" + String(c) + "局")"
                temp2.text="\(e)"
                temp1.text="\( String(a) + ":" + String(b) )"
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

