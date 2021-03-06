//
//  A4ViewController.swift
//  appDivination
//
//  Created by nt on 2015/12/22.
//  Copyright © 2015年 nt. All rights reserved.
//

import UIKit

/*
 * 今日のつぶやき入力画面
 * 遷移先
 * 　鑑定する（今日のつぶやきアニメーション画面）
 * 　池田先生の説明を聞く(説明ページ＿今日のつぶやき)
 * 　戻る（略）
 * 遷移元
 * 　トップ画面
 *  「運気を上げる今日のつぶやき」の出し方
 * その人の音の鏡を出す。
 * 丸が付かない場所を埋める言葉を探索する
 * a: 丸が付かない場所を埋める言葉を洗い出す
 * b: その中からランダムに一文字決め、名前にその文字を足し合わせる
 * c: 音の鏡を確認し、まだ丸が付いて居ない箇所があれば、aからやり直す
 * 全て埋まったら、埋め終えるまでに引用した全ての言葉をランダムに並び替える
 * 並び替えた言葉を「運気を上げる今日のつぶやき」として表示してあげる！
 *
 * 最初から全部埋まってる("はつねみく"など)場合は、
 * 一個もない人と同じ扱いにして、ゼロの状態から埋めていく
 */
class A4ViewController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var sgCtlSex: UISegmentedControl!
    @IBOutlet weak var btnAppraise: UIButton!
    @IBOutlet weak var naviBar: UINavigationBar!
    
    // 画面番号、遷移元を知るために使用
    let viewNumber = Const.ViewNumber.A4ViewConNum
    // 画面遷移時に遷移元が渡す遷移先の値
    var _param:Int = -1
    // 画面遷移時に遷移元が渡す遷移元の値
    var _paramOriginal:Int = -1
    // 画面遷移時に遷移先が受け取る遷移先の値
    var _second:Int = 0

    var datePicker1: UIDatePicker!
    
    /**
     インスタンス化された直後（初回に一度のみ）
     viewDiDLoad
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        print("A4ViewController viewDidLoad")

        naviBar.setBackgroundImage(UIImage(), for: .topAttached, barMetrics: .default)
        naviBar.shadowImage = UIImage()

        // テキストフィールドにDatePickerを表示する
        datePicker1 = UIDatePicker()
        datePicker1.addTarget(self, action: #selector(A4ViewController.changedDateEvent(_:)), for: UIControlEvents.valueChanged)
        // 日本の日付表示形式にする、年月日の表示にする
        datePicker1.datePickerMode = UIDatePickerMode.date
        //format(datePicker1.date,style: "yyyy/MM/dd")
        datePicker1.locale = Locale(identifier: "ja_JP")
        // 最小値、最大値、初期値を設定
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Const.DateSetFormat
        datePicker1.minimumDate = dateFormatter.date(from: Const.MinDateString)
        datePicker1.maximumDate = dateFormatter.date(from: Const.MaxDateString)
        datePicker1.date = dateFormatter.date(from: Const.DefDateString)!
        dateTextField.inputView = datePicker1
        
        // 保存していた情報の復元
        // TODO 無料音霊鑑定と共通？？？？
        let defaults = UserDefaults.standard
        nameTextField.text = defaults.string(forKey: Const.UserName)
        dateTextField.text = defaults.string(forKey: Const.Birthday)
        sgCtlSex.selectedSegmentIndex = defaults.integer(forKey: Const.Sex)
        
        // nameTextField の情報を受け取るための delegate を設定
        nameTextField.delegate = self
    }
    
    // 相談ボタンを押した時
    @IBAction func touchDownBtnConsultation(_ sender: AnyObject) {
        _param = viewNumber
        performSegue(withIdentifier: "segue",sender: nil)
    }
    
    // Segueはビューが遷移するタイミングで呼ばれるもの
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        print("prepareForSegue : \(segue.identifier), _param : \(_param)")
        if segue.identifier == "segue" {
            let secondViewController:A2ViewController = segue.destination as! A2ViewController
            secondViewController._second = _param
            secondViewController._paramOriginal = viewNumber
        } else if segue.identifier == "midstream" {
            let secondViewController:MidstreamViewController = segue.destination as! MidstreamViewController
            secondViewController._second = _param
            secondViewController._paramOriginal = viewNumber
        }
    }
    
    // 日付の変更イベント
    func changedDateEvent(_ sender:AnyObject?){
        //        var dateSelecter:UIDatePicker = sender as! UIDatePicker
        self.changeLabelDate(datePicker1.date)
    }
    // 日付の変更
    func changeLabelDate(_ date:Date) {
        dateTextField.text = format(datePicker1.date,style: Const.DateFormat)
    }
    
    // 名前の入力完了時に閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    // 鑑定するボタンを押したとき　　入力の確認
    @IBAction func touchDownbtnAppraise(_ sender: AnyObject) {
        // 名前欄のTextFieldの確認
        if (nameTextField.text!.isEmpty) {
            // null、空のとき
            print("nameTextField.text is enpty.")
            let alertController = UIAlertController(
                title: Const.ErrorTitle,
                message: Const.ErrorMsgNameEmpty,
                preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: Const.BtnOK, style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        } else {
            if !nameTextField.text!.ChackHiraganaOrKatakana() {
                // ひらがな、カタカナ、空白以外のとき
                print("nameTextField.text is not hiragana or katakana.")
                let alertController = UIAlertController(
                    title: Const.ErrorTitle,
                    message: Const.ErrorMsgNameKana,
                    preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: Const.BtnOK, style: .default, handler: nil)
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }
        }
        
        // 誕生日欄のTextFieldの確認
        if (dateTextField.text!.isEmpty) {
            // null、空のとき
            print("dateTextField.text is not hiragana.")
            let alertController = UIAlertController(
                title: Const.ErrorTitle,
                message: Const.ErrorMsgDate,
                preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: Const.BtnOK, style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
        
        // 性別選択の確認
        if (sgCtlSex.selectedSegmentIndex == -1) {
            // 未選択のとき
            print("sgCtlSex.selectedSegmentIndex == -1")
            let alertController = UIAlertController(
                title: Const.ErrorTitle,
                message: Const.ErrorMsgSex,
                preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: Const.BtnOK, style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }

        // この判定が終わったら、次の画面に遷移する
        
        // NSUserDefaultsオブジェクトを取得し、設定情報を保存する
        let defaults = UserDefaults.standard
        // 登録されている名前と入力されている名前が異なっている場合は、占い情報をリセット
        if nameTextField.text != defaults.string(forKey: Const.UserName) {
            defaults.set("", forKey: Const.LukcyWord)
            defaults.set("", forKey: Const.SaveTime)
        }
        defaults.set(nameTextField.text, forKey: Const.UserName)
        defaults.set(dateTextField.text, forKey: Const.Birthday)
        defaults.set(sgCtlSex.selectedSegmentIndex, forKey: Const.Sex)
        defaults.synchronize()
    }
    
    // 画面の適当なところをタッチした時、キーボードを隠す
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        print("close keyboard")
        nameTextField.resignFirstResponder()
        dateTextField.resignFirstResponder()
    }
    
    // 書式指定に従って日付を文字列に変換します
    // パラメータ
    //  date : 日付データ(NSDate型)を指定します
    //  style : 書式を指定します
    //          yyyy 西暦,MM 月,dd 日,HH 時,mm 分,ss 秒
    //
    func format(_ date : Date, style : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = style
        return  dateFormatter.string(from: date)
    }
    
    /**
     memoryWarnig
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

