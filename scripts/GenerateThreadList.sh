tempFile="tempFile.json"

sed '/"threadsNumber"/q' "$PWD/.vscode/tasks.json" > "$tempFile"

echo -e '\t\t\t"options": [' >> "$tempFile"

threadNumber=$(nproc)
while [ $threadNumber -gt 0 ]; do
    echo -e "\t\t\t\t\"$threadNumber\"," >> "$tempFile"
    threadNumber=`expr $threadNumber - 1`
done

sed -i '$ s/.$//' $tempFile

echo "$(sed -e '1,/"threadsNumber"/d' "$PWD/.vscode/tasks.json" | sed -n -e '/]/,$p')" >> $tempFile

cat $tempFile > "$PWD/.vscode/tasks.json"

rm $tempFile