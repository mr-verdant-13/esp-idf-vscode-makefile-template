if (($testNumber < 10000)); then
    printf -v fileName "test%04d" $testNumber
    if test -f "main/test/${fileName}.cpp"; then
        printf -v fileName "%s.cpp" $fileName
    else if test -f "main/test/${fileName}.c"; then
        printf -v fileName "%s.c" $fileName
    else
        clear
        echo The test does not exist
        echo El test no existe
        exit 0
    fi fi
    rm main/main.cpp
    touch main/main.cpp
    echo "extern \"C\"" >> main/main.cpp
    echo "{" >> main/main.cpp
    echo "#include \"test/${fileName}\"" >> main/main.cpp
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
else
    echo "Incorrect value"
    echo "Valor incorrecto"
fi
