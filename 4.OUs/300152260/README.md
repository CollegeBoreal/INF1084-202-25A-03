Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows

PS C:\Users\Administrator> cd C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> cd 300152260
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\utilisateurs8.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git add utilisateurs8.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git commit -m "8."
>>
[main 7a87c6ca] 8.
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 4 insertions(+)
 create mode 100644 4.OUs/300152260/utilisateurs8.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 485 bytes | 121.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   8ce9978b..7a87c6ca  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> cd C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> git rm utilisateurs8.ps1
>>
rm '4.OUs/utilisateurs8.ps1'
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> git commit -m "Suppression du fichier utilisateurs8.ps1"
>>
[main 1395390d] Suppression du fichier utilisateurs8.ps1
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 3 deletions(-)
 delete mode 100644 4.OUs/utilisateurs8.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> git push
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> git pull origin main --rebase
>>
fatal: unable to access 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git/': Could not resolve host: github.com
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> cd 300152260
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\utilisateurs9.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git add utilisateurs9.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git commit -m "9"
>>
[main 7cbf425c] 9
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 6 insertions(+)
 create mode 100644 4.OUs/300152260/utilisateurs9.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git pull origin main --rebase
>>
remote: Enumerating objects: 54, done.
remote: Counting objects: 100% (54/54), done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 32 (delta 27), reused 29 (delta 25), pack-reused 0 (from 0)
Unpacking objects: 100% (32/32), 5.65 KiB | 21.00 KiB/s, done.
From https://github.com/CollegeBoreal/INF1084-202-25A-03
 * branch              main       -> FETCH_HEAD
   7a87c6ca..77a1fdc8  main       -> origin/main
Successfully rebased and updated refs/heads/main.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
Enumerating objects: 11, done.
Counting objects: 100% (11/11), done.
Delta compression using up to 4 threads
Compressing objects: 100% (8/8), done.
Writing objects: 100% (8/8), 908 bytes | 41.00 KiB/s, done.
Total 8 (delta 5), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (5/5), completed with 3 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   77a1fdc8..5134267e  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\utilisateurs10.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git add utilisateurs10.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git commit -m "10"
>>
[main fe180d25] 10
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 11 insertions(+)
 create mode 100644 4.OUs/300152260/utilisateurs10.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git pull origin main --rebase
>>
remote: Enumerating objects: 54, done.
remote: Counting objects: 100% (54/54), done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 32 (delta 28), reused 30 (delta 26), pack-reused 0 (from 0)
Unpacking objects: 100% (32/32), 5.57 KiB | 20.00 KiB/s, done.
From https://github.com/CollegeBoreal/INF1084-202-25A-03
 * branch              main       -> FETCH_HEAD
   5134267e..ba82eeba  main       -> origin/main
Successfully rebased and updated refs/heads/main.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 648 bytes | 216.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   ba82eeba..ba634092  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\bootstrap.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git add bootstrap.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git commit -m "bootstrap"
>>
[main a750739b] bootstrap
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 15 insertions(+)
 create mode 100644 4.OUs/300152260/bootstrap.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git pull origin main --rebase
>>
remote: Enumerating objects: 54, done.
remote: Counting objects: 100% (54/54), done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 32 (delta 27), reused 29 (delta 25), pack-reused 0 (from 0)
Unpacking objects: 100% (32/32), 5.68 KiB | 20.00 KiB/s, done.
From https://github.com/CollegeBoreal/INF1084-202-25A-03
 * branch              main       -> FETCH_HEAD
   ba634092..2126959f  main       -> origin/main
Successfully rebased and updated refs/heads/main.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 691 bytes | 69.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   2126959f..ce5b2e9e  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\README.md
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260>






















Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows

PS C:\Users\Administrator> cd C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> cd 300152260
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\utilisateurs8.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git add utilisateurs8.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git commit -m "8."
>>
[main 7a87c6ca] 8.
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 4 insertions(+)
 create mode 100644 4.OUs/300152260/utilisateurs8.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 485 bytes | 121.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   8ce9978b..7a87c6ca  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> cd C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> git rm utilisateurs8.ps1
>>
rm '4.OUs/utilisateurs8.ps1'
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> git commit -m "Suppression du fichier utilisateurs8.ps1"
>>
[main 1395390d] Suppression du fichier utilisateurs8.ps1
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 3 deletions(-)
 delete mode 100644 4.OUs/utilisateurs8.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> git push
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> git pull origin main --rebase
>>
fatal: unable to access 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git/': Could not resolve host: github.com
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> cd 300152260
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\utilisateurs9.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git add utilisateurs9.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git commit -m "9"
>>
[main 7cbf425c] 9
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 6 insertions(+)
 create mode 100644 4.OUs/300152260/utilisateurs9.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git pull origin main --rebase
>>
remote: Enumerating objects: 54, done.
remote: Counting objects: 100% (54/54), done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 32 (delta 27), reused 29 (delta 25), pack-reused 0 (from 0)
Unpacking objects: 100% (32/32), 5.65 KiB | 21.00 KiB/s, done.
From https://github.com/CollegeBoreal/INF1084-202-25A-03
 * branch              main       -> FETCH_HEAD
   7a87c6ca..77a1fdc8  main       -> origin/main
Successfully rebased and updated refs/heads/main.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
Enumerating objects: 11, done.
Counting objects: 100% (11/11), done.
Delta compression using up to 4 threads
Compressing objects: 100% (8/8), done.
Writing objects: 100% (8/8), 908 bytes | 41.00 KiB/s, done.
Total 8 (delta 5), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (5/5), completed with 3 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   77a1fdc8..5134267e  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\utilisateurs10.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git add utilisateurs10.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git commit -m "10"
>>
[main fe180d25] 10
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 11 insertions(+)
 create mode 100644 4.OUs/300152260/utilisateurs10.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git pull origin main --rebase
>>
remote: Enumerating objects: 54, done.
remote: Counting objects: 100% (54/54), done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 32 (delta 28), reused 30 (delta 26), pack-reused 0 (from 0)
Unpacking objects: 100% (32/32), 5.57 KiB | 20.00 KiB/s, done.
From https://github.com/CollegeBoreal/INF1084-202-25A-03
 * branch              main       -> FETCH_HEAD
   5134267e..ba82eeba  main       -> origin/main
Successfully rebased and updated refs/heads/main.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 648 bytes | 216.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   ba82eeba..ba634092  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\bootstrap.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git add bootstrap.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git commit -m "bootstrap"
>>
[main a750739b] bootstrap
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 15 insertions(+)
 create mode 100644 4.OUs/300152260/bootstrap.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git pull origin main --rebase
>>
remote: Enumerating objects: 54, done.
remote: Counting objects: 100% (54/54), done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 32 (delta 27), reused 29 (delta 25), pack-reused 0 (from 0)
Unpacking objects: 100% (32/32), 5.68 KiB | 20.00 KiB/s, done.
From https://github.com/CollegeBoreal/INF1084-202-25A-03
 * branch              main       -> FETCH_HEAD
   ba634092..2126959f  main       -> origin/main
Successfully rebased and updated refs/heads/main.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 691 bytes | 69.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   2126959f..ce5b2e9e  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\README.md
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260>













Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows

PS C:\Users\Administrator> cd C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> cd 300152260
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\utilisateurs8.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git add utilisateurs8.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git commit -m "8."
>>
[main 7a87c6ca] 8.
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 4 insertions(+)
 create mode 100644 4.OUs/300152260/utilisateurs8.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 485 bytes | 121.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   8ce9978b..7a87c6ca  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> cd C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> git rm utilisateurs8.ps1
>>
rm '4.OUs/utilisateurs8.ps1'
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> git commit -m "Suppression du fichier utilisateurs8.ps1"
>>
[main 1395390d] Suppression du fichier utilisateurs8.ps1
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 3 deletions(-)
 delete mode 100644 4.OUs/utilisateurs8.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> git push
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> git pull origin main --rebase
>>
fatal: unable to access 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git/': Could not resolve host: github.com
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs> cd 300152260
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\utilisateurs9.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git add utilisateurs9.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git commit -m "9"
>>
[main 7cbf425c] 9
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 6 insertions(+)
 create mode 100644 4.OUs/300152260/utilisateurs9.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git pull origin main --rebase
>>
remote: Enumerating objects: 54, done.
remote: Counting objects: 100% (54/54), done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 32 (delta 27), reused 29 (delta 25), pack-reused 0 (from 0)
Unpacking objects: 100% (32/32), 5.65 KiB | 21.00 KiB/s, done.
From https://github.com/CollegeBoreal/INF1084-202-25A-03
 * branch              main       -> FETCH_HEAD
   7a87c6ca..77a1fdc8  main       -> origin/main
Successfully rebased and updated refs/heads/main.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
Enumerating objects: 11, done.
Counting objects: 100% (11/11), done.
Delta compression using up to 4 threads
Compressing objects: 100% (8/8), done.
Writing objects: 100% (8/8), 908 bytes | 41.00 KiB/s, done.
Total 8 (delta 5), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (5/5), completed with 3 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   77a1fdc8..5134267e  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\utilisateurs10.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git add utilisateurs10.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git commit -m "10"
>>
[main fe180d25] 10
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 11 insertions(+)
 create mode 100644 4.OUs/300152260/utilisateurs10.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git pull origin main --rebase
>>
remote: Enumerating objects: 54, done.
remote: Counting objects: 100% (54/54), done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 32 (delta 28), reused 30 (delta 26), pack-reused 0 (from 0)
Unpacking objects: 100% (32/32), 5.57 KiB | 20.00 KiB/s, done.
From https://github.com/CollegeBoreal/INF1084-202-25A-03
 * branch              main       -> FETCH_HEAD
   5134267e..ba82eeba  main       -> origin/main
Successfully rebased and updated refs/heads/main.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 648 bytes | 216.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   ba82eeba..ba634092  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\bootstrap.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git add bootstrap.ps1
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git commit -m "bootstrap"
>>
[main a750739b] bootstrap
 Committer: unknown <Administrator@DC300152260-00.LOCAL>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 15 insertions(+)
 create mode 100644 4.OUs/300152260/bootstrap.ps1
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
 ! [rejected]          main -> main (fetch first)
error: failed to push some refs to 'https://github.com/CollegeBoreal/INF1084-202-25A-03.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git pull origin main --rebase
>>
remote: Enumerating objects: 54, done.
remote: Counting objects: 100% (54/54), done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 32 (delta 27), reused 29 (delta 25), pack-reused 0 (from 0)
Unpacking objects: 100% (32/32), 5.68 KiB | 20.00 KiB/s, done.
From https://github.com/CollegeBoreal/INF1084-202-25A-03
 * branch              main       -> FETCH_HEAD
   ba634092..2126959f  main       -> origin/main
Successfully rebased and updated refs/heads/main.
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> git push
>>
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 691 bytes | 69.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To https://github.com/CollegeBoreal/INF1084-202-25A-03.git
   2126959f..ce5b2e9e  main -> main
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260> notepad .\README.md
>>
PS C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300152260>












































































