# TLP007 System

UPDATE 2


https://app.netlify.com/sites/reliable-zabaione-8c8d0d/configuration/identity#:~:text=reliable%2Dzabaione%2D8c8d0d.netlify.app


## Add submodule for theme

git submodule add -b Dev001 -f https://github.com/TechLatinPublishing/HTheme-beautifulhugo themes/HTheme-beautifulhugo


git submodule add -b Dev001 -f https://github.com/TechLatinPublishing/TH006-beautifulhugo themes/TH006-beautifulhugo

TH006-beautifulhugo




## Ceremony for reset




make rebuildSM                             


hugo mod get -u ./...   


hugo mod tidy    


hugo serve -e development
hugo serve -e staging  
hugo serve -e production


hugo serve -e development --printMemoryUsage


# Technique 1

Build and run HUGO CLI to create /public directory
Then Push to repo

Most of this work is done on the Laptop





