tempFile="tempFile.json"

sed '/"serialPort"/q' "$PWD/.vscode/tasks.json" > "$tempFile"

echo -e '\t\t\t"options": [' >> "$tempFile"

line=$(cmd.exe /c mode)
for comLine in $line ; do
    if [[ $comLine == *"COM"* ]]; then
        echo -e "\t\t\t\t\"${comLine%:*}\"," >> "$tempFile"
    fi
done

sed -i '$s/\,//' $tempFile

echo "$(sed -e '1,/"serialPort"/d' "$PWD/.vscode/tasks.json" | sed -n -e '/]/,$p')" >> $tempFile

cat $tempFile > "$PWD/.vscode/tasks.json"

rm $tempFile