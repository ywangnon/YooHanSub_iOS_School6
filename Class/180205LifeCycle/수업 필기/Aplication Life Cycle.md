# Aplication Life Cycle
ios
mvc패턴으로 생성
1. 처음 시작시 UI application이 생성
2. UI Applicationd에서 EventLoop 받음
3. ios 에서 아는건 uiapplication
4. uiapplication에서 관리
				           - delegate
UI Application - main() - Storyboard - initial 설정한 View - ViewdidLoad

eventqueue
순서를 보장하기 위해 큐 선택

Event
Touch를 해결하는건 해당 뷰

## Execution State for App
- Not Running
- Inactive
- Active
- Background
- Suspend

## 

> 모든 상태는 UI Application에 보내짐

- Delegate에서 모든 상태 관리

//런치완료
launch End
resin did become

//홈버튼 클릭
resign Active
enter bg

//다시 실행
enter forge
resign did become

//제거
Message from debugger: Terminated due to signal 9

스토리보드의 initial과 프로그램의 시작은 다르다
스토리보드의 initial은 스토리 보드를 보일때의 시작

자동으로 생성되고 코드로 생성된 것이 나온다. 고로 덮어 씌어져서 살아남는것은 코드로 된것
ex) a = 3
	a = 5
	결과 a = 5
    
    ## The Structure of an App
    
    - application을 시작하는 동안 UIAdplicationmain 기능은 몇개의 주요 개체를 설정하고 application 활동을 시작합니다.
    -  모든 iOS앱의 중심에는 UIApplication개체가 있습니다.

