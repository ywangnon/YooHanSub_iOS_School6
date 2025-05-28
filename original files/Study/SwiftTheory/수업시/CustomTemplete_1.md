hansubyoo@~

\>> cd `xcode-select -p`

> xcode의 안에는 여러가지 버전이 있는데 특정 버전으로 지정하는 것이다. (좀 더 자세히 알아볼 것)

hansubyoo@/Applications/Xcode.app/Contents/Developer

\>>

> `hansubyoo@~` 에서 `hansubyoo@/Applications/Xcode.app/Contents/Developer` 로 이동함

hansubyoo@/Applications/Xcode.app/Contents/Developer

\>> cd Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File\ Templates/

hansubyoo@/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates

\>> pwd

/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates

> pwd: 현재 작업중인 폴더의 위치를 확인할때 사용하는 명령어

hansubyoo@/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates

\>> ls
Apple Watch	Playground	Resource	Source	User Interface

> ls: 명령어는 파일이다 디렉토리의 목록과 정보를 출력할때 사용하는 명령어 

hansubyoo@/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates

\>> clear

> clear: 터미널 내용 지우기

hansubyoo@/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates

\>> open .

hansubyoo@/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates

\>> mkdir -p $HOME”/Library/Developer/Xcode/Templates/File Templates/Custom/[TemplateName].xctemplate/” && \

\> cd /Users/hansubyoo/Downloads/XcodeTemplateHelper-master 
mkdir: ??/Library/Developer/Xcode/Templates/File: Permission denied
mkdir: Templates/Custom/[TemplateName].xctemplate/”: Permission denied

hansubyoo@/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates

\>> cd /Users/hansubyoo/Downloads/XcodeTemplateHelper-master

hansubyoo@~/Downloads/XcodeTemplateHelper-master

\>> ls

BaseFileTemplate.xctemplate	ReactorKit.xctemplate
BaseProjectTemplate.xctemplate	TestApplication.xctemplate
LICENSE				ViperModule.xctemplate
MVP.xctemplate			assets
MVVM.xctemplate			install_template.swift
README.md			remove_template.swift

hansubyoo@~/Downloads/XcodeTemplateHelper-master

\>> git clone https://github.com/giftbott/XcodeTemplateHelper.git

Cloning into 'XcodeTemplateHelper'...
remote: Counting objects: 214, done.
remote: Total 214 (delta 0), reused 0 (delta 0), pack-reused 214
Receiving objects: 100% (214/214), 3.49 MiB | 631.00 KiB/s, done.
Resolving deltas: 100% (124/124), done.

hansubyoo@~/Downloads/XcodeTemplateHelper-master
>> open .

hansubyoo@~/Downloads/XcodeTemplateHelper-master
>> ls
BaseFileTemplate.xctemplate	TestApplication.xctemplate
BaseProjectTemplate.xctemplate	ViperModule.xctemplate
LICENSE				XcodeTemplateHelper
MVP.xctemplate			assets
MVVM.xctemplate			install_template.swift
README.md			remove_template.swift
ReactorKit.xctemplate

hansubyoo@~/Downloads/XcodeTemplateHelper-master
>> swift install_template.swift
Select Template
##############################
1: ReactorKit.xctemplate
2: TestApplication.xctemplate
3: MVVM.xctemplate
4: BaseFileTemplate.xctemplate
5: BaseProjectTemplate.xctemplate
6: MVP.xctemplate
7: ViperModule.xctemplate
##############################

Select template number (q: quit) : 4 
>>>> BaseFileTemplate.xctemplate is selected

Select Path to Install Template
########################################
1: Custom File Template
2: Custom Project Template
3: Xcode File Template (admin only)
4: Xcode Project Template (admin only)
########################################

Input Target Number (q: quit) :1
>>>> Template will be installed at /Users/hansubyoo/Library/Developer/Xcode/Templates/File Templates/Custom/
>>>> .....
>>>> Template installed successfully.


hansubyoo@~/Downloads/XcodeTemplateHelper-master
>> cd BaseFileTemplate.xctemplate/

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> ls
TemplateIcon.png		TemplateIcon@2x.png		TemplateInfo.plist		___FILEBASENAME___.swift

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> open .

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> l
-bash: l: command not found

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> ls
TemplateIcon.png		TemplateIcon@2x.png		TemplateInfo.plist		___FILEBASENAME___.swift

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> vi 

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> 

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> 

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> vi _

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> ls
TemplateIcon.png		TemplateIcon@2x.png		TemplateInfo.plist		___FILEBASENAME___.swift

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> vi ___FILEBASENAME___.swift 

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> 

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> 

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> swift install_templete.swift
<unknown>:0: error: no such file or directory: 'install_templete.swift'

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> swift install_template.swift
<unknown>:0: error: no such file or directory: 'install_template.swift'

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> swift install_templete.swift
<unknown>:0: error: no such file or directory: 'install_templete.swift'

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> swift install_templete.swift
<unknown>:0: error: no such file or directory: 'install_templete.swift'

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> ls
TemplateIcon.png		TemplateIcon@2x.png		TemplateInfo.plist		___FILEBASENAME___.swift

hansubyoo@~/Downloads/XcodeTemplateHelper-master/BaseFileTemplate.xctemplate
>> cd ..

hansubyoo@~/Downloads/XcodeTemplateHelper-master
>> ls
BaseFileTemplate.xctemplate	MVVM.xctemplate			ViperModule.xctemplate		remove_template.swift
BaseProjectTemplate.xctemplate	README.md			XcodeTemplateHelper
LICENSE				ReactorKit.xctemplate		assets
MVP.xctemplate			TestApplication.xctemplate	install_template.swift

hansubyoo@~/Downloads/XcodeTemplateHelper-master
>> swift install_template.swift 
Select Template
##############################
1: ReactorKit.xctemplate
2: TestApplication.xctemplate
3: MVVM.xctemplate
4: BaseFileTemplate.xctemplate
5: BaseProjectTemplate.xctemplate
6: MVP.xctemplate
7: ViperModule.xctemplate
##############################

Select template number (q: quit) : 4
>>>> BaseFileTemplate.xctemplate is selected

Select Path to Install Template
########################################
1: Custom File Template
2: Custom Project Template
3: Xcode File Template (admin only)
4: Xcode Project Template (admin only)
########################################

Input Target Number (q: quit) :1
>>>> Template will be installed at /Users/hansubyoo/Library/Developer/Xcode/Templates/File Templates/Custom/
>>>> .....
>>>> Template has been replaced successfully.


hansubyoo@~/Downloads/XcodeTemplateHelper-master
>> 

hansubyoo@~/Downloads/XcodeTemplateHelper-master
>> 

hansubyoo@~/Downloads/XcodeTemplateHelper-master
>> cd Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File\ Templates/
-bash: cd: Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/: No such file or directory

hansubyoo@~/Downloads/XcodeTemplateHelper-master
>> cd Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File\ Templates/
-bash: cd: Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/: No such file or directory

hansubyoo@~/Downloads/XcodeTemplateHelper-master
>> cd ..

hansubyoo@~/Downloads
>> cd Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File\ Templates/
-bash: cd: Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/: No such file or directory

hansubyoo@~/Downloads
>> cd Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File\ Templates/
-bash: cd: Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/: No such file or directory

hansubyoo@~/Downloads
>> cd ~Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File\ Templates/
-bash: cd: ~Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/: No such file or directory

hansubyoo@~/Downloads
>> cd ~/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File\ Templates/
-bash: cd: /Users/hansubyoo/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/: No such file or directory

hansubyoo@~/Downloads
>> pwd
/Users/hansubyoo/Downloads

hansubyoo@~/Downloads
>> cd ~

hansubyoo@~
>> ls
Desktop				Library				Pictures			iOS 수업자료
Documents			Movies				Public
Downloads			Music				YooHanSub_iOS_School6

hansubyoo@~
>> cd Library/

hansubyoo@~/Library
>> ls
Accounts		ColorPickers		Favorites		Keyboard Layouts	Passes			Services
Application Scripts	Colors			FileProvider		KeyboardServices	Personas		Sharing
Application Support	Compositions		FontCollections		Keychains		PreferencePanes		Sounds
Assistant		Containers		Fonts			LanguageModeling	Preferences		Spelling
Assistants		Cookies			GameKit			Logs			Printers		Suggestions
Audio			CoreData		Group Containers	Mail			PubSub			SyncedPreferences
Autosave Information	CoreFollowUp		IdentityServices	Maps			Safari			Voices
Caches			Developer		Input Methods		Messages		SafariSafeBrowsing	WebKit
Calendars		Dictionaries		Internet Plug-Ins	Metadata		Saved Application State	com.apple.internal.ck
CallServices		Family			Keyboard		Mobile Documents	Screen Savers		iMovie

hansubyoo@~/Library
>> cd Developer/

hansubyoo@~/Library/Developer
>> ls
CoreSimulator	XCPGDevices	Xcode

hansubyoo@~/Library/Developer
>> cd Xcode/

hansubyoo@~/Library/Developer/Xcode
>> ls
DerivedData			GPUToolsAgent.sock		UserData			무제 폴더
DocumentationCache		Templates			iOS Device Logs

hansubyoo@~/Library/Developer/Xcode
>> cd ..

hansubyoo@~/Library/Developer
>> ls
CoreSimulator	XCPGDevices	Xcode

hansubyoo@~/Library/Developer
>> cd ..

hansubyoo@~/Library
>> ls
Accounts		ColorPickers		Favorites		Keyboard Layouts	Passes			Services
Application Scripts	Colors			FileProvider		KeyboardServices	Personas		Sharing
Application Support	Compositions		FontCollections		Keychains		PreferencePanes		Sounds
Assistant		Containers		Fonts			LanguageModeling	Preferences		Spelling
Assistants		Cookies			GameKit			Logs			Printers		Suggestions
Audio			CoreData		Group Containers	Mail			PubSub			SyncedPreferences
Autosave Information	CoreFollowUp		IdentityServices	Maps			Safari			Voices
Caches			Developer		Input Methods		Messages		SafariSafeBrowsing	WebKit
Calendars		Dictionaries		Internet Plug-Ins	Metadata		Saved Application State	com.apple.internal.ck
CallServices		Family			Keyboard		Mobile Documents	Screen Savers		iMovie

hansubyoo@~/Library
>> cd ~/Library/Developer/

hansubyoo@~/Library/Developer
>> cd Xcode/

hansubyoo@~/Library/Developer/Xcode
>> ls
DerivedData			GPUToolsAgent.sock		UserData			무제 폴더
DocumentationCache		Templates			iOS Device Logs

hansubyoo@~/Library/Developer/Xcode
>> cd Templates/

hansubyoo@~/Library/Developer/Xcode/Templates
>> ls
File Templates

hansubyoo@~/Library/Developer/Xcode/Templates
>> cd File\ Templates/

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates
>> ls
Custom

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates
>> cd Custom/

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates/Custom
>> 

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates/Custom
>> ls
BaseFileTemplate.xctemplate

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates/Custom
>> mv BaseFileTemplate.xctemplate/ CustomName.xctemplate

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates/Custom
>> ls
CustomName.xctemplate

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates/Custom
>> ls
CustomName.xctemplate

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates/Custom
>> cd ..

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates
>> pw
-bash: pw: command not found

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates
>> pwd
/Users/hansubyoo/Library/Developer/Xcode/Templates/File Templates

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates
>> ls
Custom

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates
>> cd Custom/

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates/Custom
>> ls
CustomName.xctemplate

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates/Custom
>> mv CustomName.xctemplate/ MyCustomTemplate.xctemplate

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates/Custom
>> ls
MyCustomTemplate.xctemplate

hansubyoo@~/Library/Developer/Xcode/Templates/File Templates/Custom
>> cd `xcode-select -p`

hansubyoo@/Applications/Xcode.app/Contents/Developer
>> open .

hansubyoo@/Applications/Xcode.app/Contents/Developer
>> cd Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File\ Templates/

hansubyoo@/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates
>> open .

hansubyoo@/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates
>> 

hansubyoo@/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates
>> cd /Library/Developer/Xcode/Templates/File Templates/Custom/[TemplateName].xctemplate/
-bash: cd: /Library/Developer/Xcode/Templates/File: No such file or directory

hansubyoo@/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates
>> cd `xcode-select -p`

hansubyoo@/Applications/Xcode.app/Contents/Developer
>> cd /Library/Developer/Xcode/Templates/File Templates/Custom/[TemplateName].xctemplate/
-bash: cd: /Library/Developer/Xcode/Templates/File: No such file or directory

hansubyoo@/Applications/Xcode.app/Contents/Developer
>> open .

hansubyoo@/Applications/Xcode.app/Contents/Developer
>> 
  [복원됨 2018. 3. 9. 오후 5:39:18]
Last login: Fri Mar  9 17:39:10 on console

hansubyoo@/Applications/Xcode.app/Contents/Developer
>> 
  [복원됨 2018. 3. 10. 오전 9:39:22]
Last login: Sat Mar 10 09:39:19 on console
Restored session: 2018년 3월  9일 금요일 17시 41분 30초 KST

hansubyoo@/Applications/Xcode.app/Contents/Developer
>> 
  [복원됨 2018. 3. 11. 오후 1:27:33]
Last login: Sun Mar 11 13:27:28 on console

hansubyoo@/Applications/Xcode.app/Contents/Developer
>> 
