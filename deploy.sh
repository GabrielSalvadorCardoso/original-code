DEPLOY_DATE=$(date '+%Y%m%d_%H%M%S')

rm -rf deploy

mkdir deploy
# mkdir deploy/automated-deploy
# cp original-code/* deploy/automated-deploy

# git init deploy/automated-deploy/
# git -C deploy/automated-deploy/.git remote add origin https://github.com/GabrielSalvadorCardoso/automated-deploy.git

git clone https://github.com/GabrielSalvadorCardoso/automated-deploy.git
mv automated-deploy deploy/automated-deploy
ls deploy/automated-deploy/ | grep -v "README.md|LICENSE" | xargs rm -rf

cp -r original-code/deploy.sh original-code/index.js deploy/automated-deploy

git --git-dir=deploy/automated-deploy/.git --work-tree=deploy/automated-deploy add .
git --git-dir=deploy/automated-deploy/.git --work-tree=deploy/automated-deploy commit -m "Deploy $DEPLOY_DATE"
git --git-dir=deploy/automated-deploy/.git --work-tree=deploy/automated-deploy push -u origin --all