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


gsafe() {
   git branch -D deploy-staging
   git branch -D deploy-prod
   gcpull deploy-staging
}

#push local to remote

grempush() {
    git push --set-upstream origin "$1"
}

gnuke() {
    for branch in $(git branch | cut -c 3-); do
	git branch -D $branch
    done
}

gkout() {
    branch_name="$1"
    git checkout -b $branch_name
}

docbash() {
 cont_name="$1"
 docker container exec -it $cont_name bash
}

doctest() {
    docker-compose run -e PYTHONPATH=. pytest -v "$1"
}

docnuke() {
    docker system prune -af --volumes
}
