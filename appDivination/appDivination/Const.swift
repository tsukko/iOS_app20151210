// �萔
// TODO arrays.plist�Amain.strings�̒�`�������ōs���A�폜����
import Foundation
struct Const{
    // resultDivinationClass�Œ�`�ς݁B�B
    // Pattern 01: ��{.
    static let free_divination_result_message_pattern_01= ["��ʓI�ȏ펯�̌^�ɂ͂܂�Ə�肭�����܂���B", "��{�I�Ȏ��������ɐg�ɕt����\�͂������Ă��܂��B", "���i�⃉�C�Z���X�Ȃǂ��擾������A�}�j���A���Ȃǂ𗝉�����\�͂��ƂĂ������ł��B"]
    static let free_divination_result_charas_pattern_01 = ["�A","�J","�q","��"]
    // Pattern 02: �w��.
    static let free_divination_result_message_pattern_02 = ["�w�͂�����Â炢�̂ŁA�����̍D���Ȃ��Ƃ����Ă��������������ʂ��ł܂��B", "�w�͂�ςݏd�˂邱�Ƃŉ^�C���オ���Ă����܂��B", "�R�c�R�c�Ɠw�͂�ςݏd�˂邱�Ƃő傫�Ȑ����ɓ�����܂��B"]
    static let free_divination_result_charas_pattern_02 = ["�N", "�t", "��"]
    // Pattern 03: �g�ɕt����.
    static let free_divination_result_message_pattern_03 = ["�����̋Z�p��m�����K������̂ɋ�J����^�C�v�ł��B", "�m����Z�p���K�����邱�Ƃ����ł��B", "�{�C�ɂȂ�����g�ɂ����Ȃ����Ƃ͂قƂ�ǂȂ��ł��傤�B"]
    static let free_divination_result_charas_pattern_03 = ["�E", "�`", "�~", "��"]
    // Pattern 04: �`����.
    static let free_divination_result_message_pattern_04 = ["���͂ɏ���ӌ������ɓ`����̂����ŁA���Ⴂ����₷���ł��B", "���͂ɉ�����`���Ă������Ƃ����ł��B", "�`����������ӌ����A�L��������R�̐l�X�ɓ`���邱�Ƃ��ł��܂��B"]
    static let free_divination_result_charas_pattern_04 = ["�w", "��", "��", "��"]
    // Pattern 05: ���ɏo��.
    static let free_divination_result_message_pattern_05 = ["���Ȃ��̎��˔\��ӌ��͂Ȃ��Ȃ����ɔF�߂��܂���B", "�����𐢂̒��ɐ��ݏo���\�͂������Ă��܂��B", "�v���f���[�T�[�����ŁA�l�╨�𐢂ɔy�o����˔\�ɂ����Ă��܂��B"]
    static let free_divination_result_charas_pattern_05 = ["�C", "�V", "�\", "��"]
    // Pattern 06: �҂���.
    static let free_divination_result_message_pattern_06 = ["���Ԃ�Ƒ������߂Ă��Ă��A�C�t���΂�����l�₵�����܂��B", "�F�B��肪���ŁA�Ƒ��Ƃ̃g���u�������Ȃ��ł��傤�B", "��R�̒��ԂɌb�܂�A��R�̎q��Ɍb�܂ꂽ���Ƒ��ɂȂ�܂��B"]
    static let free_divination_result_charas_pattern_06 = ["�I", "��"]
    // Pattern 07: ����������.
    static let free_divination_result_message_pattern_07 = ["�D�_�s�f�ŁA�Ȃɂ��ƃ^�C�~���O���������Ƃ������ł��B", "������B����������΁A�������[������܂Œǋ�����Ό��ʂɌ��т��ł��傤�B", "�����O�̃h�����łƂ��Ƃ�˂��i�߂΁A�ǂ�Ȃ��Ƃł����������鎖���ł��܂��B"]
    static let free_divination_result_charas_pattern_07 = ["�i", "�j"]
    // Pattern 08: �d�グ��.
    static let free_divination_result_message_pattern_08 = ["�v���`�������ʂ��łȂ����Ƃ΂���ł��B", "�C���[�W�ʂ�̏�Ԃɐ����Ďd�グ�Ă����\�͂������Ă��܂��B", "�L�^����������܂��������A������B������\�͂��ƂĂ������ł��B"]
    static let free_divination_result_charas_pattern_08 = ["�k", "�X", "��"]

    // TODO ��ʔԍ�
    struct ViewNumber {
        static let ViewConNum = 1
        static let A2ViewConNum = 2
        static let A3ViewConNum = 3
        static let A4ViewConNum = 4
        static let A5ViewConNum = 5
        static let A6ViewConNum = 6
    }

    // �ꖇ�G��ʂ̐����y�[�W�i��ł悳�����j
    struct ViewInfoNumber {
        static let ViewConNum = 1 // �g���Ȃ�
        static let A2ViewConNum = 2 // �g���Ȃ�
        static let A3ViewConNum = 3
        static let A4ViewConNum = 4
        static let A5ViewConNum = 5
        static let A6ViewConNum = 6
        static let A6ViewConNum = 6
        static let A6ViewConNum = 6
    }

    // �{�^��
    static let btnOK = "OK"
    static let btnNG = "NG"

    // ���O�̍폜
    static let delNameTitle = "�폜"
    static let delNameMsg = "���O���폜���܂���."

    // ���̓G���[
    static let "errorTitle" = "���̓G���["
    static let "errorMsgNameEmpty" = "���O�����󗓂ł�."
    static let "errorMsgNameKana" = "�����O�͂Ђ炪�Ȃœ��͂��Ă�������."
    static let "errorMsgDate" = "�a���������󗓂ł�."
    static let "errorMsgSex" = "���ʂ��I������Ă��܂���."

    // NSUserDefaults.standardUserDefaults() �Ŏg�p����L�[�ꗗ
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

