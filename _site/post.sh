# create a new post and fill the template
alias create="sh ~/.postname"

# the contents of ~/.postname:
#!/bin/zsh

################
# Get our info #
################
yearmonth=$(date "+%Y/%m")
postdate=$(date "+%Y-%m-%d")
jekylldate=$(date "+%Y-%m-%d %H:%M:%S %z")
read -p "Enter the post name: " post_variable;
read -p "Enter the post category: " post_category;

touch ~/Brandon-Lu737.github.io/_posts/$postdate-$post_variable.markdown &&
cat <<EOF > ~/Brandon-Lu737.github.io/_posts/$postdate-$post_variable.markdown
---
layout: post
title:  "$post_variable"
date:   $jekylldate
categories: $post_category
---

Write your post content here.
EOF

# mate ~/Brandon-Lu737.github.io/_posts/$yearmonth/$postdate-$post_variable.markdown
exit 0

## start up Jekyll for local preview of blog
# alias preview="cd /Users/TJ/Desktop/foobar.com && jekyll --server --auto"

## delete the existing built site and rebuild
# alias build="cd /Users/TJ/Desktop/foobar.com && rm -rf _site/ && jekyll"

## use rsync to push the weblog to my (ve)
# alias deploy="echo 'Deploying to remote host...' &&
# cd /Users/TJ/Desktop/foobar.com && rsync -rtz --delete _site/ deploy@foobar.com:/var/www/_site &&
echo 'Done!'"