>> cd `xcode-select -p` 특정 xcode 버전을 고정시킨다
>> cd Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File\ Templates/
>> pwd
>> cd /Users/hansubyoo/Downloads/XcodeTemplateHelper-master
>> git clone https://github.com/giftbott/XcodeTemplateHelper.git
>> swift intall_template.swift
Select template number (q: quit) : 4 
Input Target Number (q: quit) :1
>> cd BaseFileTemplate.xctemplate/
>> vi ___FILEBASENAME___.swift 

Select Template
##############################
1: ReactorKit.xctemplate
2: TestApplication.xctemplate
3: MVVM.xctemplate
4: BaseFileTemplate.xctemplate // 파일
5: BaseProjectTemplate.xctemplate // 프로젝트
6: MVP.xctemplate
7: ViperModule.xctemplate
##############################

Select template number (q: quit) : 5
>>>> BaseProjectTemplate.xctemplate is selected

Select Path to Install Template
########################################
1: Custom File Template // 파일
2: Custom Project Template // 프로젝트
3: Xcode File Template (admin only)
4: Xcode Project Template (admin only)
########################################

Input Target Number (q: quit) :2