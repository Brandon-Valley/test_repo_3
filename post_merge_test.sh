#!/bin/sh

echo "start" >> out.txt


TEMP_SUBMODULE_LIST_FILE_PATH="tempppppppppppppppppppppppp.txt"

# echo $TEMP_SUBMODULE_LIST_FILE_PATH >> out.txt

# cmd = "git config --file .gitmodules --get-regexp path | awk '{ print $2 }' > $TEMP_SUBMODULE_LIST_FILE_PATH"
# eval $cmd

# cmd="echo $TEMP_SUBMODULE_LIST_FILE_PATH >> out.txt"
# eval $cmd





# git config --file .gitmodules --get-regexp path | awk '{ print $2 }' > $TEMP_SUBMODULE_LIST_FILE_PATH



# # write the path (relative to the directory that contains the .git file) to a temp file (that will be deleted later
git config --file .gitmodules --get-regexp path | awk '{ print $2 }' > $TEMP_SUBMODULE_LIST_FILE_PATH


# # read the contents of the temp file into an array
readarray -t submodule_relative_paths_array < $TEMP_SUBMODULE_LIST_FILE_PATH




for i in "${submodule_relative_paths_array[@]}"
do
   echo $i >> out.txt
   git config -f .gitmodules submodule.$i.update rebase # not tested in global yet#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
done




# readarray -t submodule_a < cmd_out.txt

# for i in "${submodule_a[@]}"
# do
	# echo $i >> out.txt
# done








echo "end" >> out.txt






















