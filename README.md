# TLP007 System




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





