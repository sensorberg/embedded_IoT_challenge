# Sensorberg Embedded IoT Engineer Interview Test

Welcome! This repository contains a technical challenge designed to evaluate your approach to working, thinking, and problem-solving in an embedded IoT context.


## Challenge Overview

As a challenge, you are required to develop an IoT-based lock control system. The system will be controlled using an ESP32 microcontroller and managed over the cloud via MQTT. The ESP32 device interfaces with 10 locks, each equipped with a sensor that detects whether the door is open or closed.

## Environment Setup

A prepared Dockerfile is included in the repository, containing ESP-IDF and configured to run a QEMU simulation of the ESP32 application (note that building the image will download few gigabytes of data). While using this setup is recommended, it is not mandatory. If you prefer not to use Docker, you can run the QEMU simulation locally on your system or use a physical ESP32 device if available.

In case you decide to continue with the Docker setup, run the following commands to ensure you have no problem with running the application. You should be able to see `Hello world` logs from the QEMU setup. However the setup is completly tested and everything should be fine.
```
docker build -t esp32-qemu .
docker run --rm -it -v "$PWD":/project esp32-qemu
```


If you decided to change the environment:
- Install ESP-IDF. The configuration is based on `v5.4`, but you can also work with newer versions.
- Ensure you have deleted the `/build` folder if it already exists.
- Adjust the configuration in `sdkconfig` to match your setup.
  
  Run:
  ```
  idf.py menuconfig
  ```

Regardless of your chosen environment, please include detailed steps for running your code in your documentation.

### Useful sources
- https://docs.espressif.com/projects/esp-idf/en/stable/esp32/get-started/index.html
- https://docs.espressif.com/projects/esp-idf/en/stable/esp32/api-guides/tools/qemu.html
- https://docs.espressif.com/projects/esp-idf/en/stable/esp32/api-guides/tools/idf-py.html

## Implementation Requirements

In this challenge, you should implement the following:
1. Complete the code for the ESP32 to establish an MQTT connection to the cloud.
2. Implement mocking functions to simulate the behavior of the sensors and locks.
3. The application should respond to commands on the topic `esp/lock/{id}/cmd` for opening locks. Design the message payload to include the lock number.
4. Implement a response to commands and send back the result of executing the command.
5. The device should periodically send device information every 30 seconds to the topic `esp/lock/{id}/status`.
6. The device should send sensor state updates whenever a sensor event occurs, to the topic `esp/lock/{id}/sensor`.
7. Include unit tests and testing functionalities wherever needed.
8. Thoroughly document every step and all valuable information.
9. Choose one of the two case studies below and provide your answer in a separate document.
10. (Optional) Prepare a minimal simulated server to test the system.

**Hint:** Do not focus excessively on minor details or complete implementation. What matters most is the style, organization, and documentation of your code, as well as your approach to problem-solving.

## Case Studies

1. You have now a working prototype of a lock control system, but this is not the end. You will also need a way to continuously update your system. Describe generally how you would design the OTA and CI/CD processes to achieve this.
   
2. The ESP32 application you developed requires cloud connectivity for opening locks, but what if there is no internet on the device? Describe how you would modify the application and what additional components you would add to the system to enable offline lock openings, while keeping security in mind.

## Submission Guidelines

Please submit your completed code, documentation, and the chosen case study answer. Ensure all steps for running your code are clearly documented. Contact `hossein.mousavizadeh@sensorberg.com` for any questions.
