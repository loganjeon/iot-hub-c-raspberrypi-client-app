#
# Sandstone-azure-sdk-samples dev. environment container
#
FROM raspbian/stretch:latest
MAINTAINER Yeonggyoo.Jeon <yg.jeon@sk.com>

# for arm build, copy the resulting qemu-arm-static binary to the building instance
COPY qemu-aarch64-static /usr/bin

# set bashrc
RUN echo 'alias vi='vim'' >> $HOME/.bashrc

# fetch source code
RUN mkdir -p /home/devuser
ADD . /home/devuser/iothub-c-client-simulate-app

# run setup.sh for build env.
RUN home/devuser/iothub-c-client-simulate-app/setup.sh

# add user group : devuser 
RUN groupadd -r devuser && useradd -r -g devuser devuser
RUN chown -R devuser:devuser /home/devuser

# set user and work directory
USER devuser
WORKDIR /home/devuser/iothub-c-client-simulate-app

