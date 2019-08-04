tempFile="tempFile.json"

sed '/"testFile"/q' "$PWD/.vscode/tasks.json" > "$tempFile"

echo -e '\t\t\t"options": [' >> "$tempFile"

for testPath in $PWD/main/test/* ; do
  testFileName=${testPath##*/}
  if [[ $testFileName == *".c" ]] || [[ $testFileName == *".cpp" ]] ; then
    echo -e "\t\t\t\t\"${testFileName}\"," >> "$tempFile"
  fi
done

sed -i '$s/\,//' $tempFile

echo "$(sed -e '1,/"testFile"/d' "$PWD/.vscode/tasks.json" | sed -n -e '/]/,$p')" >> $tempFile

cat $tempFile > "$PWD/.vscode/tasks.json"

rm $tempFile