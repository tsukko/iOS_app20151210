// 定数
// TODO arrays.plist、main.stringsの定義をここで行い、削除する
import Foundation
struct Const{
    // resultDivinationClassで定義済み。。
    // Pattern 01: 基本.
    static let free_divination_result_message_pattern_01= ["一般的な常識の型にはまると上手くいきません。", "基本的な事をすぐに身に付ける能力を持っています。", "資格やライセンスなどを取得したり、マニュアルなどを理解する能力がとても高いです。"]
    static let free_divination_result_charas_pattern_01 = ["ア","カ","ヒ","レ"]
    // Pattern 02: 努力.
    static let free_divination_result_message_pattern_02 = ["努力が実りづらいので、自分の好きなことをしていた方がいい結果がでます。", "努力を積み重ねることで運気が上がっていきます。", "コツコツと努力を積み重ねることで大きな成功に導かれます。"]
    static let free_divination_result_charas_pattern_02 = ["ク", "フ", "ヱ"]
    // Pattern 03: 身に付ける.
    static let free_divination_result_message_pattern_03 = ["何かの技術や知識を習得するのに苦労するタイプです。", "知識や技術を習得することが上手です。", "本気になったら身につけられないことはほとんどないでしょう。"]
    static let free_divination_result_charas_pattern_03 = ["ウ", "チ", "ミ", "ラ"]
    // Pattern 04: 伝える.
    static let free_divination_result_message_pattern_04 = ["周囲に情報や意見を上手に伝えるのが苦手で、勘違いされやすいです。", "周囲に何かを伝えていくことが上手です。", "伝えたい情報や意見を、広く遠く沢山の人々に伝えることができます。"]
    static let free_divination_result_charas_pattern_04 = ["ヘ", "ユ", "ヨ", "ヲ"]
    // Pattern 05: 世に出す.
    static let free_divination_result_message_pattern_05 = ["あなたの持つ才能や意見はなかなか世に認められません。", "何かを世の中に生み出す能力を持っています。", "プロデューサー向きで、人や物を世に輩出する才能にたけています。"]
    static let free_divination_result_charas_pattern_05 = ["イ", "シ", "ソ", "ン"]
    // Pattern 06: 淋しい.
    static let free_divination_result_message_pattern_06 = ["仲間や家族を求めていても、気付けばいつも一人寂しくいます。", "友達作りが上手で、家族とのトラブルも少ないでしょう。", "沢山の仲間に恵まれ、沢山の子宝に恵まれたり大家族になります。"]
    static let free_divination_result_charas_pattern_06 = ["オ", "ム"]
    // Pattern 07: 成し遂げる.
    static let free_divination_result_message_pattern_07 = ["優柔不断で、なにかとタイミングが悪いことが多いです。", "何かを達成したければ、自分が納得するまで追求すれば結果に結びつくでしょう。", "持ち前のド根性でとことん突き進めば、どんなことでも成し遂げる事ができます。"]
    static let free_divination_result_charas_pattern_07 = ["ナ", "ニ"]
    // Pattern 08: 仕上げる.
    static let free_divination_result_message_pattern_08 = ["思い描いた結果がでないことばかりです。", "イメージ通りの状態に整えて仕上げていく能力をもっています。", "記録をつくったり賞を取ったり、何かを達成する能力がとても高いです。"]
    static let free_divination_result_charas_pattern_08 = ["ヌ", "ス", "ヤ"]

    // TODO 画面番号
    struct ViewNumber {
        static let ViewConNum = 1
        static let A2ViewConNum = 2
        static let A3ViewConNum = 3
        static let A4ViewConNum = 4
        static let A5ViewConNum = 5
        static let A6ViewConNum = 6
    }

    // 一枚絵画面の説明ページ（上でよさそう）
    struct ViewInfoNumber {
        static let ViewConNum = 1 // 使われない
        static let A2ViewConNum = 2 // 使われない
        static let A3ViewConNum = 3
        static let A4ViewConNum = 4
        static let A5ViewConNum = 5
        static let A6ViewConNum = 6
        static let A6ViewConNum = 6
        static let A6ViewConNum = 6
    }

    // ボタン
    static let btnOK = "OK"
    static let btnNG = "NG"

    // 名前の削除
    static let delNameTitle = "削除"
    static let delNameMsg = "名前を削除しました."

    // 入力エラー
    static let "errorTitle" = "入力エラー"
    static let "errorMsgNameEmpty" = "名前欄が空欄です."
    static let "errorMsgNameKana" = "お名前はひらがなで入力してください."
    static let "errorMsgDate" = "誕生日欄が空欄です."
    static let "errorMsgSex" = "性別が選択されていません."

    // NSUserDefaults.standardUserDefaults() で使用するキー一覧
    static let userName = "userName"
    static let birthday = "birthday"
    static let sex = "sex"
    static let LukcyWord = "LukcyWord"
    static let saveTime = "saveTime"
    static let UserList = "UserList"
    static let firstUserName = "firstUserName"
    static let firstBirthday = "firstBirthday"
    static let firstSex = "firstSex"
    static let secondUserName = "secondUserName"
    static let secondBirthday = "secondBirthday"
    static let secondSex = "secondSex"

}

