# Git
## What is Git?
- 소스 코드 관리를 위한 분산 버전 관리 시스템
- 변경 사항을 추적하여 코드의 히스토리 관리

## Git의 구조
### 1. Work Space
- 실제 작업 공간

### 2. index
- Work Space와 내부 저장소의 중간 단계 공간
- 일종의 준비 구역
- staging area

### 3. 내부저장소
- git이 설치된 컴퓨터 폴더
- Local Repository

### 4. 외부저장소
- 서버에 존재
- 외부에 저장하는 곳

### *Github는 Git 서비스 중 하나일 뿐이다.

## Git 명령어
![Git 명령어](./img/GitCommand.png)

## Git ignore
- 원하지 않는 파일을 Git에서 제외시킬수 있는 설정 File
- 최상위 Directory에 존재 해야함
- git ignore 는 등록 순서에 따라 적용
 - ex) 원치않는 파일 -> ignore 등록 -> 원치않는 파일 남아있음

### Git ignore 적용
```
# no .a files .a 확장자를 가진 파일은 제외.
*.a
 
# but do track lib.a, even though you're ignoring .a files above
# lib.a 파일은 추적한다. 이 설정 전에 *.a 같은 전체를 제외시키는 와일드카드가 사용되어 있는 경우에 사용
!lib.a
 
# only ignore the TODO file in the current directory, not subdir/TODO
# 현재 디렉토리에서 TODO 파일 제외.
/TODO
 
# ignore all files in the build/ directory
# build 폴더 아래의 모든 파일 제외
build/
 
# ignore doc/notes.txt, but not doc/server/arch.txt
# doc 폴더안의 txt 확장자를 가진 파일 모두 제외
doc/*.txt
 
# ignore all .pdf files in the doc/ directory
# doc 폴더 아래의 모든 하위 폴더에서 pdf 확장자를 가진 파일 제외
doc/**/*.pdf
 
# *_sample.* 파일이름의 마지막에 _sample 이 들어가는 모든 파일 제외
*_sample.*
```
### 주의
- 문법 띄어쓰기, 줄간격 주의
- 링크 루트 띄어쓰기, 한글 인식 불가
- Save후 적용

## 참고 사이트
###[간편 안내서](http://rogerdudler.github.io/git-guide/index.ko.html)  
###[GUI로 branch만들어 보기](http://learnbranch.urigit.com/)  
###[Pro Git 번역](http://git-scm.com/book/ko/v2)
