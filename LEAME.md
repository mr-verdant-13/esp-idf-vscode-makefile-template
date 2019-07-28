# **Plantilla de proyecto ESP-IDF para VSCode (Makefile)**

[English version](https://github.com/mr-verdant-13/esp-idf-vscode-makefile-template/blob/v1.0.0/README.md)

## **Windows**

### **Características**

- Permite la ejecución de comandos `make` en el terminal integrado de VSC.

- Permite el uso de los siguientes comandos `make` a partir de la ejecución de tareas de VSC:

    - Tarea `Menuconfig`:\
        El comando `make menuconfig` es ejecutado y el menú de configuración es mostrado en una nueva ventana.

    - Tarea `Defconfig`:\
        El comando `make defconfig` es ejecutado.

    - Tarea `Build test`:\
        1.- Se solicita al usuario que seleccione el test que se desea compilar.\
        2.- Se solicita al usuario que seleccione la cantidad de hilos  a ser utilizados para la compilación del test seleccionada.\
        3.- El comando `make all` es ejecutado considerando el número de hilos especificado(opción `-j`).
    
    - Tarea `Flash`:\
        1.- Se solicita al usuario que seleccione el puerto COM para la descarga de la aplicación compilada.\
        2.- El comando `make flash` es ejecutado considerando el puerto COM especificado (opción `ESPPORT`).

    - Tarea `Monitor`:\
        1.- Se solicita al usuario que seleccione el puerto COM para su monitorización en un terminal.\
        2.- El comando `make monitor` es ejecutado considerando el puerto serial especificado (opción `ESPPORT`).

    - Tarea `Flash & Monitor`:\
        1.- Se solicita al usuario que seleccione el puerto COM para la descarga de la aplicación compilada y su monitarización en un terminal.\
        2.- El comando `make flash monitor` es ejecutado considerando el puerto serial especificado (opción `ESPPORT`).

    - Tarea `Clean`:\
        El comando `make clean`es ejecutado.

- Define tareas adicionales de utilidad:

    - Tarea `Create new component`:\
        Una nueva carpeta de componente es creada. Este nuevo folder puede ser usado como contenedor para código de fuente, cabeceras, y otros archivos de componente.

    - Tarea `Remove auto-generated files`:\
        Todo archivo (`sdkconfig`, `sdkconfig.old`, `main/main.cpp`) y folder (`build`) autogenerado es eliminado.

    - Tarea `Generate test list`:\
        Todo archivo C/C++ al interior de la carpeta `test` es añadido como opción de selección para el uso de la tarea `Build test`.

    - Tarea `Generate thread list`:\
        Toda cantidad de hilos disponibles es añadida como opción de selección para el uso de la tarea `Build test`.

    - Tarea `Generate COM list`:\
        Toda puerto COM disponible es añadido como opción de selección para el uso de las tareas de descarga de aplicación compilada y de monitoreo en terminal.

- Especifica los directorios de inclusión que podrían ser utilizados por el motor de IntelliSense.

- Facilita el proceso de testing con el uso de la tarea `Build test`.

- Provee un archivo `sdkconfig.defaults` que define los siguientes valores por defecto para configuración:
    1. Establece el periodo de un tick de FreeRTOS como 1ms (1000 ticks/segundo).
    2. Habilita excepciones C++.

### **Consideraciones**

- Para utilizar esta plantilla, el ESP-IDF debe ser instalado como se describe en [este tutorial](https://github.com/mr-verdant-13/esp-idf-instructions/blob/master/LEAME.md).

- Para empezar a usar esta plantilla, es necesario que se ejecute el archivo `VscSetup4Win.bat`.

## **Ejemplo simple (test0000)**

1. Ejecutar la tarea `Defconfig`.

2. En este ejemplo, se utilizará el código de fuente `test0000.cpp`.\
   Ejecutar la tarea `Build test`, seleccionar el test `test0000.cpp` para ser compilado y seleccionar el número de hilos que se desea usar para compilar la aplicación.

3. Una vez que el test ha sido compilado, ejecutar la tarea `Flash & Monitor` e introducir el puerto COM a ser usado para descargar la aplicación compilada y monitorizarlo en un terminal.

    Como resultado, el terminal debe mostrar el mensaje `TEST_0000: Loop` de forma periódica.
