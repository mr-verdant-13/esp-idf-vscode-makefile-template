tempFile="tempFile.json"

# https://unix.stackexchange.com/questions/11305/show-all-the-file-up-to-the-match
sed '/"threadsNumber"/q' "$PWD/.vscode/tasks.json" > "$tempFile"

echo -e '\t\t\t"options": [' >> "$tempFile"

# https://stackoverflow.com/questions/9011233/for-files-in-directory-only-echo-filename-no-path
threadNumber=$(nproc)
while [ $threadNumber -gt 0 ]; do
    echo -e "\t\t\t\t\"$threadNumber\"," >> "$tempFile"
    threadNumber=`expr $threadNumber - 1`
done

# https://stackoverflow.com/questions/27305177/how-can-i-remove-the-last-character-of-a-file-in-unix
sed -i '$ s/.$//' $tempFile

# https://stackoverflow.com/questions/7103531/how-to-get-the-part-of-a-file-after-the-first-line-that-matches-a-regular-expres
echo "$(sed -e '1,/"threadsNumber"/d' "$PWD/.vscode/tasks.json" | sed -n -e '/]/,$p')" >> $tempFile

cat $tempFile > "$PWD/.vscode/tasks.json"

rm $tempFile