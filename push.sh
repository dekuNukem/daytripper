if [[ $# -eq 0 ]] ; then
    echo 'error: please enter a commit comment'
    exit 1
fi

find . -type f -name "*.b#*" -exec rm -f {} \;
find . -type f -name "*.s#*" -exec rm -f {} \;
find . -type f -name "*.l#*" -exec rm -f {} \;
find . -type f -name "*.csv#*" -exec rm -f {} \;
find . -type f -name "*.DS_Store*" -exec rm -f {} \;
find . -name "__pycache__" -exec rm -rf {} \;
find ./pc_software -name "build" -exec rm -rf {} \;
find ./pc_software -name "dist" -exec rm -rf {} \;
find ./pc_software -name "*.zip" -exec rm -rf {} \;
find ./pc_software -type f -name "*.spec*" -exec rm -f {} \;
python update_firmware_ref.py

git add --all
git commit -m "$@"
git push origin master