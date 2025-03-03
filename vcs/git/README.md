
#installing : 
[root@host ~]# apt install git
[user@host ~]$ git --version
------
#Config : 
[root@host ~]# git config --global user.name “Arash Foroughi”
[root@host ~]# git config --global user.email “arash@localhost”
[user@host ~]$ cat ~/.gitconfig
-----
[root@host ~]# git config --system system.name “Git Repo Server 1”
[root@host ~]# git config --system user.name “Arash Foroughi”
[root@host ~]# git config --global system.name “My Git Repo Server 1”
[root@host ~]# git config --global core.editor vim
[root@host ~]# git config --global core.pager ‘less’
[root@host ~]# git config --list
[root@host ~]# cat ~/.gitconfig

#Create Our First Local Git Repository
---
Step-1: Use git init command to initialize a location as git repository
----

[user@host ~]$ mkdir gittest
[user@host gittest]$ cd gittest
[user@host gittest]$ git init

-----
Step-2: Create files in repo needed to be tracked by git and then use git add
-----

[user@host gittest]$ git status
   On branch master
   No commits yet
   nothing to commit (create/copy files and use "git add" to track)
[user@host gittest]$ echo “This is my first file” > test.txt
[user@host gittest]$ git add test.txt  or git add *  or  git add -A
[user@host gittest]$ git status
   On branch master
   No commits yet
   Changes to be committed:
     (use "git rm --cached <file>..." to unstage)
           new file:   test.txt

---
Step-3: Use git commit to finalize your changes as the last version
---

[user@host gittest]$ git commit –m “This is my first git file”
   [master (root-commit) e74c7da] This is my first git file
    1 file changed, 1 insertion(+)
    create mode 100644 test.txt
[user@host gittest]$ git status
   On branch master
   nothing to commit, working tree clean

   ------
#Retrieve an entire copy of repository from a remote repository.
[root@host ~]# ssh-keygen
[root@host ~]# ssh-copy-id navid@192.168.1.2
[root@host ~]# git clone navid@192.168.1.2:/home/navid/gittest gittest_local
[root@host ~]# cd gittest_local; vi new_file : “new file added”
[root@host ~]# git add new_file
[root@host ~]# git commit -m “New File Added”
navid@server1:~/gittest$ git pull root@192.168.1.3:/home/navid/gittest_local
   * branch            HEAD       -> FETCH_HEAD
   Fast-forward
   new_file | 1 +
   1 file changed, 1 insertion(+)
   create mode 100644 new_file

   -------
#Tags (It’s like a Snapshot!)
A tag is created to point to a very specific commit and doesn’t change never.

They are not really snapshots, but they are as good as a snapshot-based database.

It is just a pointer to a specific commit or a place in a time.

There are two flavors of tags    --->    Annotated & Non-Annotated

Annotated Tag has a message that can be displayed with git show.

Non-Annotated Tag is just a named pointer to a commit without any message.


#Creating a Non-Annotated Tag
[root@host ~]# git tag tag1
[root@host ~]# git tag
   tag1
[root@host ~]# vi file1.txt; git add -A; git commit -m “Tag Added”
[root@host ~]# git show tag1
   commit 8344e3d4dba1f214545fe6afce12034c04a63891 (tag: tag1)
   Author: Navid Sheibani <navid@localhost.localdomain>
   Date:   Thu Aug 14 15:10:32 2021 +0330
   diff --git a/new_file b/new_file
   new file mode 100644
   index 0000000..dfc8289
   --- /dev/null
   +++ b/new_file
   @@ -0,0 +1 @@
   +new added
[root@host ~]# git describe --tags
   tag1-1-g4ff7c1b


#Creating an Annotated Tag
[root@host ~]# git tag -a V1 -m “Version 1.0 Released”
[root@host ~]# git tag
   V1
   tag1
[root@host ~]# vi file_tag1.txt; git add -A; git commit -m “Tag1 Added”
[root@host ~]# git show V1
   tag V1
   Tagger: “Navid" <"navid@localhost”>
   Version 1.0 Released
   commit 4ff7c1b2422d8166d4fb376bb48e1279f08bc999 (tag: V1)
   Author: “navid <“navid@localhost”>
      Tag1 Added
   diff --git a/file1.txt b/file1.txt
   index 0000000..cd08755
   --- /dev/null
   +++ b/file1.txt
   @@ -0,0 +1 @@

----------

#Creating & Switching to a New Branch

   [root@host ~]# git branch -a
[root@host ~]# git checkout -b development
# git branch development
# git checkout development
[root@host ~]# vi development.txt : “test of development branch”
[root@host ~]# git add development.txt
[root@host ~]# git commit -m “development test commit”
[root@host ~]# git status
On branch development
nothing to commit, working tree clean
[root@host ~]# git checkout master

----------

#Merging Two Branches Together

#First, switch to Master Branch:
[root@host ~]# git checkout master
Switched to branch 'master'
#Then, merge Development branch in Master branch:
[root@host ~]# git merge development --no-ff
Updating 3c1599c..5292e50
Fast-forward
development.txt | 1 +
1 file changed, 1 insertion(+)
create mode 100644 development.txt
