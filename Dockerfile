# Dockerfile for ESP-IDF + QEMU that runs the current project in QEMU

FROM espressif/idf:release-v5.4

USER root
RUN apt-get update && \
    apt-get install -y \
        mosquitto \
        libgcrypt20 \
        libglib2.0-0 \
        libpixman-1-0 \
        libsdl2-2.0-0 \
        libslirp0 && \
    rm -rf /var/lib/apt/lists/*
RUN python $IDF_PATH/tools/idf_tools.py install qemu-xtensa qemu-riscv32
USER root

WORKDIR /project

CMD ["bash", "-c", "mosquitto -d && idf.py qemu monitor"]