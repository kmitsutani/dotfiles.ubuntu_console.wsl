set -eu
cdir=$(pwd)
files=($(ls ${cdir}))

echo ${cdir}
for file in ${files[@]}; do
  [ ${file} = "link.sh" ] && continue
  deploy_name=".${file//%/\/}"
  ln -sfv ${cdir}/${file} ${HOME}/${deploy_name}
done
