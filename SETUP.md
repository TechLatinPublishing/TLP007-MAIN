# SETUP of system


# STEPS
Ultimately, I want to startthis from a GITHUB template.
but for now:

## STEP 0100


- STEP 010
```
hugo new site TLP-CSMAIN005
cd TLP-CSMAIN005
```

- STEP 012
remove several directories.  
These will be replaced with MODULES hosted on GITHUB
```
rm -r ./archetypes
rm -r ./content
rm -r ./data
rm -r ./i/18n
rm -r ./layouts
rm -r ./static
# ./themes
```
Keep ./themes - It is where Imports are automatically mounted.


- STEP 014 - HUGO.TOML
```
mkdir ./config
mkdir ./config/_default
mkdir ./config/development
mkdir ./config/staging
mkdir ./config/production
```

- STEP 015 - hugo.toml

```
mv ./hugo.toml  ./config/_default/hugo.toml 
```


- step 019 - test for running
```
% hugo serve

                   | EN  
-------------------+-----
  Pages            |  3  
  Paginator pages  |  0  
  Non-page files   |  0  
  Static files     |  0  
  Processed images |  0  
  Aliases          |  0  
  Sitemaps         |  1  
  Cleaned          |  0  

```
- STEP 020 - GIT
Add to GH REPO



```
# echo "# TLP-MAIN005" >> README.md

# create .git
git init


git add .

git commit -m "STEPS 100 - first commit"

git branch -M main



git remote add origin https://github.com/TechLatinPublishing/TLP-MAIN005.git

git push -u origin main
```

### OBSERVE
This will create
- ./.git/config
  - observe where the "origin" is located
- No ./modules/themes/<theme>
- ./.hugo_build.lock

There is still no theme or content




## STEP 0200
Modularise Deployment

- STEP 210 Make site a module

```
go mod init github.com/TechLatinPublishing/TLP-CSMAIN005


go mod init github.com/TechLatinPublishing/TLP-CSMAIN005

go: creating new go.mod: module github.com/TechLatinPublishing/TLP-CSMAIN005
go: to add module requirements and sums:
        go mod tidy
```

### OBSERVE:
- creates a go.mod file.
- NO go.sum file yet.


### TEST
```
hugo serve



                   | EN  
-------------------+-----
  Pages            |  3  
  Paginator pages  |  0  
  Non-page files   |  0  
  Static files     |  0  
  Processed images |  0  
  Aliases          |  0  
  Sitemaps         |  1  
  Cleaned          |  0  

Built in 8 ms
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1) 
```

Observe system builds but nothing renders because no content or theme.  But we see site uses development config, which we will test latter.




- STEP 220 PUSH

This is the ceremony that will be used often going forward.  At the moment, nothing is configured, so not much to show.
```
hugo mod get -u ./...

# Update module in /Users/vincentyoumans/HUGO/CSTest/TLP-CSMAIN005/TLP-CSMAIN005

git status

git submodule status

git add .
```

## STEP 0300 - Add theme
In this case, I am adding a forked and modified hugo theme for BeutifulHugo.  

The Theme I am using is:  

```
git submodule add -b Dev001 -f https://github.com/TechLatinPublishing/HTheme-beautifulhugo themes/HTheme-beautifulhugo
```

### OBSERVE

1. ./git/config
```
...
[submodule "themes/HTheme-beautifulhugo"]
	url = https://github.com/TechLatinPublishing/HTheme-beautifulhugo
	active = true
```

2. TLP-CSMAIN005/.git/modules/themes/HTheme-beautifulhugo
includes the Theme

3. ./gitmodules
```
[submodule "themes/HTheme-beautifulhugo"]
	path = themes/HTheme-beautifulhugo
	url = https://github.com/TechLatinPublishing/HTheme-beautifulhugo
	branch = Dev001
```

### TEST and OBSERVE
1. HUGO SERVE

assorted ways of starting server
```
% hugo serve -p 2020

Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:2020/ (bind address 127.0.0.1) 


% hugo serve -e production -p 2020

Built in 2 ms
Environment: "production"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:2020/ (bind address 127.0.0.1) 



% hugo serve -e staging -p 2020
Built in 3 ms
Environment: "staging"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:2020/ (bind address 127.0.0.1) 



% hugo serve -e development -p 2020
Built in 2 ms
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:2020/ (bind address 127.0.0.1) 
```
In each of these hugo serve commands, observe the Environment and Port.  Will be used in cicd pipeline.



git submodule status

 34a0de6da31fddae70e11ea01a9f5a39614b20ec themes/HTheme-beautifulhugo (heads/Dev001)



2. Add Theme

in config/_default/hugo.toml files
```
...
title = 'TLP-CSMAIN005 - _default'
theme = 'HTheme-beautifulhugo'
```


3. Copy _default/hugo.toml to other config directories
and Edit the title depending on the configurations

Run server excersizes in step 1

- confirm that system renders.
- No content as of yet.
- No configuration as of yet.
- No MENU as of yet.
All of the above is to be done in next stages.



## STEP 400 - ADDING MENU
In STEP,  Adding 
```
config/_default/menus/menu.en.toml
config/development/menus/menu.en.toml
config/staging/menus/menu.en.toml
config/production/menus/menu.en.toml
```

Also, changed the language in Hugo.toml 
From:
```
languageCode = 'en-us'
```
To:
```
languageCode = 'en'
```

## OBSERVE:

- i18n menus can be configured at this location.
- Custom menu can be made depending on environment.
  - for example, instructions site can be expluded in production but included in development
  - A Custom Advertising portal can be added depending on menu
  - On protected sites, there can be specialized menus.

## Confirm all the Environments are working and PUSH
Also merge with main

# STEP 0500
In this step, updating hugo.toml files further

This includes credentials for google adwords and others.
You do not want to be using production credentials in dev and prod, as this will get you banned.


- Step 0510
Added config to each hugo.toml file
added hero images to production.
- confirm that Hero display in production but not development

## Notes:
The HUGO Mount points are not attached yet, but the graphics are working.  Reason is because the Theme default graphics are being used.  In the next section, as modules are mounted, these features will be overwritten.



------------------------------------------------

# STEP 0600
All of the mounts will be Modularized.
Question:  Why Modularize?  Why not just include the HUGO mount piints directly in this repo?
Answer:  
1. Simplifies Template generation.  This main template can be cloned and used easily on other sites.

2. Same Content can be used on other sites.

3. Theme is cloned and Branched.  So that modifications can be made to a standard theme, and not have to worry about updated.

## In this section, we will be... 

1. Creating MODULES for 
- CONTENT
- THEME
- SITE DETAILS

## STEP 610
Create THEME MODULE
- FORKED BeutifulHugo Theme.
- Created Dev001 Branch
- Modify Dev001 Branch to taste.
  - I worked on Main.css specifically to change menu colors.
  - Will also modify column


*** ./git/config ***
```
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
	ignorecase = true
	precomposeunicode = true
[remote "origin"]
	url = https://github.com/TechLatinPublishing/HTheme-beautifulhugo.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[remote "upstream"]
	url = https://github.com/halogenica/beautifulhugo.git
	fetch = +refs/heads/*:refs/remotes/upstream/*
[branch "master"]
	remote = origin
	merge = refs/heads/master
[branch "Dev001"]
	remote = origin
	merge = refs/heads/Dev001
	github-pr-owner-number = "halogenica#beautifulhugo#486"
```

NOTE:  For future themes


--------------------------------------------------
# Step0700 
Adding configuration modules

https://gohugo.io/hugo-modules/configuration/


This step imports all modules from
    path = 'github.com/TechLatinPublishing/zzcodeSaus003-content'

    path = 'github.com/TechLatinPublishing/HUGO_MOD_CSBeautifulHugo-Static'


## Added Makefile clean-submodule
The theme was not updating because it was preserved as an artifact.
```
make clean-submodule
```
will reset the theme.  Will probably have to do this with the other modules as well.


# STEP 0800
Added Modifications to make
Added CICD Pipeline
All working.


# STEP 0900
Adding CICD for 
- GH Pages

1. manually add a Branch gh-pages
2. add cicd code

read:
https://gohugo.io/hosting-and-deployment/hosting-on-github/








--------------------------------------------------
# NOTES


## REMOVING SUBMODULES

Run git rm <path-to-submodule>, and commit.
This removes the filetree at <path-to-submodule>, and the submodule's entry in the .gitmodules file. I.e. all traces of the submodule in your repository proper are removed.

As the docs note however, the .git dir of the submodule is kept around (in the modules/ directory of the main project's .git dir), "to make it possible to checkout past commits without requiring fetching from another repository".
If you nonetheless want to remove this info, manually delete the submodule's directory in .git/modules/, and remove the submodule's entry in the file .git/config. These steps can be automated using the commands

rm -rf .git/modules/<path-to-submodule>, and
git config --remove-section submodule.<path-to-submodule>.





# ver0200
will add deployment to gh-pages


1. add gh-pages to repo

