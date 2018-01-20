#checkout and instantly pull from a branch

gcpull() {
    git checkout "$1"
    git pull
}

#add everything and commit

gcm() {
  git add .
  git commit -m "$1"
}

#checkout to a branch and merge squash your previous branch

gmer() {
  git checkout "$1"
  git merge --squash -
}

gsafe() {
   git branch -D deploy-staging
   git branch -D deploy-prod
   gcpull deploy-staging
}

pycharm() {
    current_file="$1"
    current_dir=$(pwd)
    executable=$current_dir$current_file
    /Applications/Pycharm.app/Contents/MacOS/pycharm $current_dir/$current_file
}