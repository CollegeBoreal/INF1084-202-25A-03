
    Directory: C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        11/28/2025   2:23 AM                300152260


PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects> cd 300152260
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> notpad utilisateurs1.ps1
notpad : The term 'notpad' is not recognized as the name of a cmdlet, function, script file, or operable program.
Check the spelling of the name, or if a path was included, verify that the path is correct and try again.
At line:1 char:1
+ notpad utilisateurs1.ps1
+ ~~~~~~
    + CategoryInfo          : ObjectNotFound: (notpad:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException

PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> notepad .\utilisateurs1.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git add utilisateurs1.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260>
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git commit -m "1"
>>
[detached HEAD cbcd3302] 1
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 47 insertions(+)
 create mode 100644 6.Objects/300152260/utilisateurs1.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git push
fatal: You are not currently on a branch.
To push the history leading to the current (detached HEAD)
state now, use

    git push origin HEAD:<name-of-remote-branch>

PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git checkout -b main
>>
fatal: a branch named 'main' already exists
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git status
>>
interactive rebase in progress; onto 6a28b2fc
Last command done (1 command done):
   pick 89c14d2d # Suppression du dossier 300152260 dans 4.OUs
No commands remaining.
You are currently editing a commit while rebasing branch 'main' on '6a28b2fc'.
  (use "git commit --amend" to amend the current commit)
  (use "git rebase --continue" once you are satisfied with your changes)

nothing to commit, working tree clean
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git rebase --continue
>>
Successfully rebased and updated refs/heads/main.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git rebase --abort
>>
fatal: no rebase in progress
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git checkout main
>>
Already on 'main'
Your branch is ahead of 'origin/main' by 2 commits.
  (use "git push" to publish your local commits)
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git push -u origin main
>>
Enumerating objects: 11, done.
Counting objects: 100% (11/11), done.
Delta compression using up to 4 threads
Compressing objects: 100% (7/7), done.
Writing objects: 100% (8/8), 1.45 KiB | 211.00 KiB/s, done.
Total 8 (delta 4), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (4/4), completed with 3 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   6a28b2fc..cbcd3302  main -> main
branch 'main' set up to track 'origin/main'.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> notepad .\utilisateurs2.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git add utilisateurs2.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git commit -m "2"
>>
[main 8345f4fc] 2
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 54 insertions(+)
 create mode 100644 6.Objects/300152260/utilisateurs2.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git push
fatal: unable to access 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git/': Could not resolve host: github.com
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git push -u origin main
>>
fatal: unable to access 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git/': Could not resolve host: github.com
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git rebase --continue
>>
fatal: no rebase in progress
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git rebase --abort
>>
fatal: no rebase in progress
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git checkout main
>>
Already on 'main'
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git push -u origin main
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git checkout main
>>
Already on 'main'
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git pull origin main --rebase
>>
remote: Enumerating objects: 54, done.
remote: Counting objects: 100% (54/54), done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 32 (delta 27), reused 29 (delta 25), pack-reused 0 (from 0)
Unpacking objects: 100% (32/32), 5.47 KiB | 21.00 KiB/s, done.
From https://github.com/CollegeBoreal/INF1084-202-25A-03
 * branch              main       -> FETCH_HEAD
   cbcd3302..eb591b21  main       -> origin/main
Successfully rebased and updated refs/heads/main.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git push
>>
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 1.21 KiB | 248.00 KiB/s, done.
Total 5 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   eb591b21..5ab3801c  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> notepad .\utilisateurs3.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git add utilisateurs3.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git commit -m "3"
>>
[main 75ced601] 3
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 44 insertions(+)
 create mode 100644 6.Objects/300152260/utilisateurs3.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git pull origin main --rebase
>>
remote: Enumerating objects: 51, done.
remote: Counting objects: 100% (51/51), done.
remote: Compressing objects: 100% (5/5), done.
remote: Total 30 (delta 26), reused 28 (delta 25), pack-reused 0 (from 0)
Unpacking objects: 100% (30/30), 5.24 KiB | 18.00 KiB/s, done.
From https://github.com/CollegeBoreal/INF1084-202-25A-03
 * branch              main       -> FETCH_HEAD
   5ab3801c..d1cf989d  main       -> origin/main
Successfully rebased and updated refs/heads/main.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> git push
>>
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 1.17 KiB | 299.00 KiB/s, done.
Total 5 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   d1cf989d..3ec00c61  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260> notepad .\README.md
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\6.Objects\300152260>