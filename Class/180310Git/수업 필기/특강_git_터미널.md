Last login: Sat Mar 10 11:55:01 on ttys003

hansubyoo@~/YooHanSub_iOS_School6
>> cd ~

hansubyoo@~
>> pwd
/Users/hansubyoo

hansubyoo@~
>> git clone https://github.com/ywangnon/iOSTechMento.git
Cloning into 'iOSTechMento'...
remote: Counting objects: 171, done.
remote: Total 171 (delta 0), reused 0 (delta 0), pack-reused 171
Receiving objects: 100% (171/171), 25.96 MiB | 716.00 KiB/s, done.
Resolving deltas: 100% (26/26), done.

hansubyoo@~
>> ls
Desktop				Library				Pictures			iOS 수업자료
Documents			Movies				Public				iOSTechMento
Downloads			Music				YooHanSub_iOS_School6

hansubyoo@~
>> cd iOSTechMento/

hansubyoo@~/iOSTechMento
>> ls
5기		6기 		README.md

hansubyoo@~/iOSTechMento
>> cd 6기\ /

hansubyoo@~/iOSTechMento/6기 
>> ls
techMento_6기_first.pdf		test.txt

hansubyoo@~/iOSTechMento/6기 
>> open test.txt 

hansubyoo@~/iOSTechMento/6기 
>> git add .

hansubyoo@~/iOSTechMento/6기 
>> git commit -m "6기수정"
[master 60cf1a3] 6기수정
 1 file changed, 1 insertion(+)

hansubyoo@~/iOSTechMento/6기 
>> git push
Username for 'https://github.com': ywangnon123@gmail.com
Password for 'https://ywangnon123@gmail.com@github.com': 
Counting objects: 4, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (4/4), 482 bytes | 482.00 KiB/s, done.
Total 4 (delta 0), reused 0 (delta 0)
To https://github.com/ywangnon/iOSTechMento.git
   d791075..60cf1a3  master -> master

hansubyoo@~/iOSTechMento/6기 
>> open .

hansubyoo@~/iOSTechMento/6기 
>> cd ..

hansubyoo@~/iOSTechMento
>> git remote -v
origin	https://github.com/ywangnon/iOSTechMento.git (fetch)
origin	https://github.com/ywangnon/iOSTechMento.git (push)

hansubyoo@~/iOSTechMento
>> git remote add https://github.com/isjang98/iOSTechMento
usage: git remote add [<options>] <name> <url>

    -f, --fetch           fetch the remote branches
    --tags                import all tags and associated objects when fetching
                          or do not fetch any tag at all (--no-tags)
    -t, --track <branch>  branch(es) to track
    -m, --master <branch>
                          master branch
    --mirror[=<push|fetch>]
                          set up remote as a mirror to push to or fetch from


hansubyoo@~/iOSTechMento
>> git remote add https://github.com/isjang98/iOSTechMento aaa
fatal: 'https://github.com/isjang98/iOSTechMento' is not a valid remote name

hansubyoo@~/iOSTechMento
>> git remote add origin https://github.com/isjang98/iOSTechMento aaa
usage: git remote add [<options>] <name> <url>

    -f, --fetch           fetch the remote branches
    --tags                import all tags and associated objects when fetching
                          or do not fetch any tag at all (--no-tags)
    -t, --track <branch>  branch(es) to track
    -m, --master <branch>
                          master branch
    --mirror[=<push|fetch>]
                          set up remote as a mirror to push to or fetch from


hansubyoo@~/iOSTechMento
>> git remote add ori https://github.com/isjang98/iOSTechMento aaa
usage: git remote add [<options>] <name> <url>

    -f, --fetch           fetch the remote branches
    --tags                import all tags and associated objects when fetching
                          or do not fetch any tag at all (--no-tags)
    -t, --track <branch>  branch(es) to track
    -m, --master <branch>
                          master branch
    --mirror[=<push|fetch>]
                          set up remote as a mirror to push to or fetch from


hansubyoo@~/iOSTechMento
>> git remote add testName https://github.com/isjang98/iOSTechMento.git

hansubyoo@~/iOSTechMento
>> ls
5기		6기 		README.md

hansubyoo@~/iOSTechMento
>> git pull testName merge
remote: Counting objects: 11, done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 11 (delta 3), reused 10 (delta 3), pack-reused 0
Unpacking objects: 100% (11/11), done.
From https://github.com/isjang98/iOSTechMento
 * branch            merge      -> FETCH_HEAD
 * [new branch]      merge      -> testName/merge
error: The following untracked working tree files would be overwritten by merge:
	6기 /techMento_6기_first.pdf
	6기 /test.txt
Please move or remove them before you merge.
Aborting

hansubyoo@~/iOSTechMento
>> ls
5기		6기 		README.md

hansubyoo@~/iOSTechMento
>> ls
5기		6기 		README.md

hansubyoo@~/iOSTechMento
>> git pull testName master
remote: Counting objects: 2, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 2 (delta 0), reused 1 (delta 0), pack-reused 0
Unpacking objects: 100% (2/2), done.
From https://github.com/isjang98/iOSTechMento
 * branch            master     -> FETCH_HEAD
 * [new branch]      master     -> testName/master
error: The following untracked working tree files would be overwritten by merge:
	6기 /techMento_6기_first.pdf
	6기 /test.txt
Please move or remove them before you merge.
Aborting

hansubyoo@~/iOSTechMento
>> ls
5기		6기 		README.md

hansubyoo@~/iOSTechMento
>> git pull aaa aaa
fatal: 'aaa' does not appear to be a git repository
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.

hansubyoo@~/iOSTechMento
>> git pull testName adada
fatal: Couldn't find remote ref adada

hansubyoo@~/iOSTechMento
>> ls
5기		6기 		README.md

hansubyoo@~/iOSTechMento
>> cd 6기\ /

hansubyoo@~/iOSTechMento/6기 
>> ls
techMento_6기_first.pdf		test.txt

hansubyoo@~/iOSTechMento/6기 
>> vi te

hansubyoo@~/iOSTechMento/6기 
>> ls
techMento_6기_first.pdf		test.txt

hansubyoo@~/iOSTechMento/6기 
>> 

hansubyoo@~/iOSTechMento/6기 
>> cd ..

hansubyoo@~/iOSTechMento
>> git branch -a
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/master
  remotes/testName/master
  remotes/testName/merge

hansubyoo@~/iOSTechMento
>> git push
Username for 'https://github.com': ywangnon123@gmail.com
Password for 'https://ywangnon123@gmail.com@github.com': 
Everything up-to-date

hansubyoo@~/iOSTechMento
>> ls
5기		6기 		README.md

hansubyoo@~/iOSTechMento
>> git -a
Unknown option: -a
usage: git [--version] [--help] [-C <path>] [-c name=value]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           <command> [<args>]

hansubyoo@~/iOSTechMento
>> git remote -v
origin	https://github.com/ywangnon/iOSTechMento.git (fetch)
origin	https://github.com/ywangnon/iOSTechMento.git (push)
testName	https://github.com/isjang98/iOSTechMento.git (fetch)
testName	https://github.com/isjang98/iOSTechMento.git (push)

hansubyoo@~/iOSTechMento
>> 
  [복원됨 2018. 3. 11. 오후 1:27:34]
Last login: Sun Mar 11 13:27:33 on ttys001
Restored session: 2018년 3월 10일 토요일 13시 25분 44초 KST

hansubyoo@~/iOSTechMento
>> 
