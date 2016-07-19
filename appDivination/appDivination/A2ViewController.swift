//
//  A2ViewController.swift
//  appDivination
//
//  Created by Norizou on 2015/12/22.
//  Copyright © 2015年 Nori. All rights reserved.
//

import UIKit
import MessageUI

/*
 * 一枚絵画面
 * 遷移先
 * 　池田先生に相談する
 * 　戻る（略）
 * 遷移元
 * 　トップ画面　　　　　　　　　　　→　鑑定士プロフィール
 * 　トップ画面　　　　　　　　　　　→　音霊鑑定術とは？
 * 　無料言霊鑑定入力・結果　　　　　→　池田先生の説明を聞く(説明ページ＿音霊鑑定)
 * 　今日のつぶやき入力・結果　　　　→　池田先生の説明を聞く(説明ページ＿今日のつぶやき)
 * 　相性診断入力・結果　　　　　　　→　池田先生の説明を聞く(説明ページ＿相性診断)
 * 　命名術入力・結果　　　　　　　　→　池田先生の説明を聞く(説明ページ＿命名術)
 * 　一枚絵ページ全部（相談する以外）→　池田先生に相談する
 */
 // TODO バックキーでの戻りを何とかする
class A2ViewController : UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var image_back: UIImageView!
    @IBOutlet weak var btnConsultation: UIButton!
    @IBOutlet weak var btnReceiveMail: UIButton!
    @IBOutlet weak var naviBar: UINavigationBar!
    
    // 画面番号、遷移元を知るために使用
    let viewNumber = Const.ViewNumber.A2ViewConNum
    // 画面遷移時に遷移元が渡す遷移先の値
    var _param:Int = -1
    // 画面遷移時に遷移元が渡す遷移元の値
    var _paramOriginal:Int = -1
    // 画面遷移時に遷移先が受け取る遷移先の値
    var _second:Int = 0

    /**
     インスタンス化された直後（初回に一度のみ）
     viewDiDLoad
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        print("A2ViewController viewDidLoad _param : \(_param) _second: \(_second)")
        
        naviBar.setBackgroundImage(UIImage(named: "component_01_header2"), forBarPosition: .TopAttached, barMetrics: .Default)

        if _second == Const.ViewNumber.ViewConNum {
            if _param == Const.ViewNumber.A2ViewProfile  {
                // 鑑定士プロフィールを押した時
                image_back.image = UIImage(named: "説明ページ＿先生プロフ")
                btnReceiveMail.hidden = true
                btnConsultation.hidden = false
            } else if _param == Const.ViewNumber.A2ViewKatakamuna {
                // 音霊鑑定術とは？を押した時
                image_back.image = UIImage(named: "説明ページ＿カタカムナとは？")
                btnReceiveMail.hidden = true
                btnConsultation.hidden = false
            }
        } else if _second == Const.ViewNumber.A3ViewConNum  {
            // 池田先生の説明を聞く(説明ページ＿音霊鑑定)
            image_back.image = UIImage(named: "説明ページ＿音霊鑑定")
            btnReceiveMail.hidden = true
            btnConsultation.hidden = false
        } else if _second == Const.ViewNumber.A4ViewConNum  {
            // 池田先生の説明を聞く(説明ページ＿今日のつぶやき)を押した時
            image_back.image = UIImage(named: "説明ページ＿今日のつぶやき")
            btnReceiveMail.hidden = true
            btnConsultation.hidden = false
        } else if _second == Const.ViewNumber.A5ViewConNum  {
            // 池田先生の説明を聞く(説明ページ＿相性診断)を押した時
            image_back.image = UIImage(named: "説明ページ＿相性診断")
            btnReceiveMail.hidden = true
            btnConsultation.hidden = false
        } else if _second == Const.ViewNumber.A6ViewConNum  {
            // 池田先生の説明を聞く(説明ページ＿命名術)を押した時
            image_back.image = UIImage(named: "説明ページ＿命名術")
            btnReceiveMail.hidden = true
            btnConsultation.hidden = false
        } else if _second == Const.ViewNumber.A2ViewRequest  {
            // 池田先生に相談するを押した時
            image_back.image = UIImage(named: "ページ_鑑定依頼")
            btnReceiveMail.hidden = false
            btnConsultation.hidden = true
        }  else {
            // その他　ここはこない
        }
    }

    // 戻るボタンを押した時
    // もし、今表示しているページが相談するページ（_second = 6）なら、_paramのページに戻って
    // それ以外の場合は、遷移先ページ（_paramOriginal）に戻る
    @IBAction func touchDownBtnBack(sender: AnyObject) {
        // 遷移するViewを定義して、遷移してきた画面に移動する
        // 鑑定依頼ページから戻る場合は、同じA2ViewControllerに戻る
        if _second == Const.ViewNumber.A2ViewRequest  {
            let mySecondViewController:A2ViewController = self.storyboard!.instantiateViewControllerWithIdentifier( "A2View" ) as! A2ViewController
            mySecondViewController._second = _paramOriginal
            mySecondViewController._param = _param
            mySecondViewController._paramOriginal = _paramOriginal
            self.presentViewController(mySecondViewController, animated: true, completion: nil)
        }
        // 鑑定依頼ページ以外の一枚画像ページの場合は、遷移元ページに戻る
        if _paramOriginal == Const.ViewNumber.ViewConNum {
            let mySecondViewController = self.storyboard!.instantiateViewControllerWithIdentifier( "A1View" )
            self.presentViewController(mySecondViewController, animated: true, completion: nil)
        } else if _paramOriginal == Const.ViewNumber.A3ViewConNum {
            let mySecondViewController = self.storyboard!.instantiateViewControllerWithIdentifier( "A3View" ) 
            self.presentViewController(mySecondViewController, animated: true, completion: nil)
        } else if _paramOriginal == Const.ViewNumber.A4ViewConNum {
            let mySecondViewController = self.storyboard!.instantiateViewControllerWithIdentifier( "A4View" ) 
            self.presentViewController(mySecondViewController, animated: true, completion: nil)
        } else if _paramOriginal == Const.ViewNumber.A5ViewConNum {
            let mySecondViewController = self.storyboard!.instantiateViewControllerWithIdentifier( "A5View" )
            self.presentViewController(mySecondViewController, animated: true, completion: nil)
        } else if _paramOriginal == Const.ViewNumber.A6ViewConNum {
            let mySecondViewController = self.storyboard!.instantiateViewControllerWithIdentifier( "A6View" )
            self.presentViewController(mySecondViewController, animated: true, completion: nil)
        }
    }

    // 相談ボタンを押した時
    @IBAction func touchDownBtnConsultation(sender: AnyObject) {
    //    _param = 6
        performSegueWithIdentifier("segue",sender: nil)
    }
    
    // Segueはビューが遷移するタイミングで呼ばれるもの
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        print("prepareForSegue : \(segue.identifier), _param : \(_param)")
        if segue.identifier == "segue" {
            // ここでは、一枚絵ページから、同じViewである相談する一枚絵ページ（_second = 6）に遷移するための処理
            let secondViewController:A2ViewController = segue.destinationViewController as! A2ViewController
            secondViewController._second = Const.ViewNumber.A2ViewRequest
            secondViewController._param = _param
            secondViewController._paramOriginal = _paramOriginal
        }
    }

    // メーラー起動（相談する一枚絵ページのみに表示）
    @IBAction func touchDownSendMailBtn(sender: AnyObject) {
        //メールを送信できるかチェック
        if MFMailComposeViewController.canSendMail()==false {
            print("Email Send Failed")
            return
        }

        let mailViewController = MFMailComposeViewController()
        let toRecipients = [Const.MailFrom]

        mailViewController.mailComposeDelegate = self
        // メール件名
        mailViewController.setSubject(Const.MailSubject)
        // Toアドレスの表示
        mailViewController.setToRecipients(toRecipients)
        // メール本文
        mailViewController.setMessageBody(Const.MailBody, isHTML: false)
        
        self.presentViewController(mailViewController, animated: true, completion: nil)
    }

    // メールキャンセル
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            print("Email Send Cancelled")
            break
        case MFMailComposeResultSaved.rawValue:
            print("Email Saved as a Draft")
            break
        case MFMailComposeResultSent.rawValue:
            print("Email Sent Successfully")
            break
        case MFMailComposeResultFailed.rawValue:
            print("Email Send Failed")
            break
        default:
            break
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /**
     memoryWarnig
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
