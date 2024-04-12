
. scripts/version-patcher.sh
cversion=$(cat setup.py |grep ver|tr '"' " " |awk '/version/ {print $2}')
git commit . -m "v$cversion";git tag "$cversion" && git push --tags && git push 

make dist && twine upload dist/* #&& sleep 32 &&  . pypi-conda-gaia-env.sh
echo "pip install -U astabc==$cversion"
