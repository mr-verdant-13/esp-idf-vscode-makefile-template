# **ESP-IDF project template for VSCode (Makefile)**

[Versión en español](https://github.com/mr-verdant-13/esp-idf-vscode-makefile-template/blob/v1.0.0/LEAME.md)

## **Windows**

### **Features**

- Allows the execution of `make` commands within the VSC integrated terminal.

- Allows the use of the following `make` commands by the execution of VSC tasks:

    - `Menuconfig` task:\
        The `make menuconfig` command is executed and the configuration menu is shown in a new window.

    - `Defconfig` task:\
        The `make defconfig` command is executed.

    - `Build test` task:\
        1.- The user is prompted to choose the test to be compiled.\
        2.- The user is prompted to choose the quantity of threads to be used for the selected test compilation.\
        3.- The `make all` command is executed considering the specified number of threads (`-j` option).
    
    - `Flash` task:\
        1.- The user is prompted to select the COM port to be used for flashing.\
        2.- The `make flash` command is executed considering the specified COM port (`ESPPORT` option).

    - `Monitor` task:\
        1.- The user is prompted to select the COM port to be used for monitoring.\
        2.- The `make monitor` command is executed considering the specified COM port (`ESPPORT` option).

    - `Flash & Monitor` task:\
        1.- The user is prompted to select the COM port to be used for flashing and monitoring.\
        2.- The `make flash monitor` command is executed considering the specified COM port (`ESPPORT` option).

    - `Clean` task:\
        The `make clean` command is executed.

- Defines additional useful tasks:

    - `Create new component` task:\
        A new component directory is created. This new directory might be used as a container for source code, header, and other component files.

    - `Remove auto-generated files` task:\
        All auto-generated files (`sdkconfig`, `sdkconfig.old`, `main/main.cpp`) and directories (`build`) are removed.

    - `Generate test list` task:\
        All C/C++ files inside the `test` directory are added as input options for the `Build test` task to use.

    - `Generate thread list` task:\
        All the available threads quantities are added as input option for the `Build test` task to use.

    - `Generate COM list` task:\
        All the available COM ports are added as input option for the flashing and monitoring tasks.

- Specifies the include directories that might be used by the IntelliSense engine.

- Facilitates the testing process by using the `Build test` task.

- Provides an `sdkconfig.defaults` file that defines the following default configuration values:
    1. Sets the FreeRTOS tick period to 1ms (1000 ticks/second).
    2. Enables C++ exceptions.

### **Considerations**

- To use this template, the ESP-IDF must be installed as described in [this tutorial](https://github.com/mr-verdant-13/esp-idf-instructions/blob/master/README.md).

- To start using this template, it is necessary to execute the `VscSetup4Win.bat` file.

## **Simple example (test0000)**

1. Execute the `Defconfig` task.

2. In this example, the `test0000.cpp` source code will be used.\
   Execute the `Build test` task, choose the `test0000.cpp` test to be compiled and select the number of threads you would like to use for building.

3. Once the test has been built, execute the `Flash & Monitor` task and select the COM port to be used for flashing and monitoring.

    As a result, the terminal should show the `TEST_0000: Loop` message periodically.
