Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows

PS C:\Users\Administrator> cd INF1084-202-25A-03\5.Services
>>
cd : Cannot find path 'C:\Users\Administrator\INF1084-202-25A-03\5.Services' because it does not exist.
At line:1 char:1
+ cd INF1084-202-25A-03\5.Services
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (C:\Users\Admini...A-03\5.Services:String) [Set-Location], ItemNotFoundE
   xception
    + FullyQualifiedErrorId : PathNotFound,Microsoft.PowerShell.Commands.SetLocationCommand

PS C:\Users\Administrator> cd C:\Users\Administrator\Developer
PS C:\Users\Administrator\Developer> cd INF1084-202-25A-03\5.Services
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services> cd 300152260
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> notepad services2.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git add services2.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git commit -m "TP Services - Logs NTDS & Netlogon"
>>
[main dab4cde6] TP Services - Logs NTDS & Netlogon
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git push
>>
Enumerating objects: 14, done.
Counting objects: 100% (13/13), done.
Delta compression using up to 4 threads
Compressing objects: 100% (8/8), done.
Writing objects: 100% (8/8), 1.01 KiB | 128.00 KiB/s, done.
Total 8 (delta 4), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (4/4), completed with 4 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   f6e73967..dab4cde6  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> notepad .\services3.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git add services3.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> mkdir C:\Logs
>>


    Directory: C:\


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        11/28/2025   1:13 AM                Logs


PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> .\services3.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git add services3.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git commit -m "TP Services - Export logs AD en CSV"
>>
[main cfdb8105] TP Services - Export logs AD en CSV
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 1 insertion(+)
 create mode 100644 5.Services/300152260/services3.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> .\services3.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git add services3.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git commit -m "TP Services - Export logs AD en CSV"
>>
On branch main
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        ADLogs.csv

nothing added to commit but untracked files present (use "git add" to track)
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git add ADLogs.csv
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git commit -m "TP Services - Export logs AD en CSV"
>>
[main ae7afcf9] TP Services - Export logs AD en CSV
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 88 insertions(+)
 create mode 100644 5.Services/300152260/ADLogs.csv
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> .\services3.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> cd C:\Users\Administrator\Developer\INF1084-202-25A-03
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03> git pull --rebase
>>
remote: Enumerating objects: 54, done.
remote: Counting objects: 100% (54/54), done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 32 (delta 28), reused 30 (delta 26), pack-reused 0 (from 0)
Unpacking objects: 100% (32/32), 5.37 KiB | 17.00 KiB/s, done.
From https://github.com/CollegeBoreal/INF1084-202-25A-03
   dab4cde6..efd0f2e2  main       -> origin/main
Successfully rebased and updated refs/heads/main.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03> cd 5.Services\300152260
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git push
>>
Enumerating objects: 13, done.
Counting objects: 100% (13/13), done.
Delta compression using up to 4 threads
Compressing objects: 100% (10/10), done.
Writing objects: 100% (10/10), 2.73 KiB | 350.00 KiB/s, done.
Total 10 (delta 5), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (5/5), completed with 2 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   efd0f2e2..61741400  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> notepad services4.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260>
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git add services4.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git commit -m "TP Services - Stop/Start service DFSR"
>>
[main fc2852ea] TP Services - Stop/Start service DFSR
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 3 insertions(+)
 create mode 100644 5.Services/300152260/services4.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> cd C:\Users\Administrator\Developer\INF1084-202-25A-03
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03> git pull --rebase
>>
remote: Enumerating objects: 54, done.
remote: Counting objects: 100% (54/54), done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 32 (delta 27), reused 29 (delta 25), pack-reused 0 (from 0)
Unpacking objects: 100% (32/32), 5.46 KiB | 23.00 KiB/s, done.
From https://github.com/CollegeBoreal/INF1084-202-25A-03
   61741400..062f5ed5  main       -> origin/main
Successfully rebased and updated refs/heads/main.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03> cd 5.Services\300152260
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> git push
>>
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 493 bytes | 32.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   062f5ed5..06a30d44  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300152260> notepad README.md