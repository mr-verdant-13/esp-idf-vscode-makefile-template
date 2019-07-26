rm main/main.cpp
echo "extern \"C\"" > main/main.cpp
echo "{" >> main/main.cpp
echo "#include \"test/${testFile}\"" >> main/main.cpp
echo "void app_main();" >> main/main.cpp
echo "}" >> main/main.cpp
rm -r "build/main"
clear
if [[ "$coresNumber" =~ ^[0-9]+$ ]]; then
    make -j$coresNumber all
else
    echo "Incorrect value. Ejecutando \"make all\"."
    echo "Valor incorrecto. Executing \"make all\"."
    make all
fi
