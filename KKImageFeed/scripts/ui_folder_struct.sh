if [ $# -ne 1 ]; then
echo $0: required name of flow. Example sh ui_folder_struct.sh ExampleFlow
exit 1
fi

cd ..
mkdir -p UI/$1/Cntrl
mkdir -p UI/$1/View
mkdir -p UI/$1/Cell
mkdir -p UI/$1/Other
mkdir -p UI/$1/Storyboard
