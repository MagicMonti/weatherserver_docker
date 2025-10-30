FROM ubuntu:24.04
ENV TERM=xterm-256color
RUN echo "PS1='\e[92m\u\e[0m@\e[94m\h\e[0m:\e[35m\w\e[0m# '" >> /root/.bashrc
RUN apt-get update && apt-get install -y openssh-server
#adding user
RUN useradd weather
RUN mkdir /home/weather
RUN echo "weather:1234weather" | chpasswd
RUN chown -R weather:weather /home/weather
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y universe
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install python3
RUN apt-get install -y curl;
RUN apt-get install -y ca-certificates
RUN apt-get install -y build-essential
RUN apt-get install -y make
RUN apt-get install -y cmake
RUN apt-get install -y g++
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y nlohmann-json3-dev
RUN apt-get install -y libcrypto++-dev
COPY Crow.deb /tmp/Crow.deb
COPY mariadb-connector.deb /tmp/mariadb-connector.deb
RUN apt-get install -y ./tmp/Crow.deb;
RUN apt-get install -y ./tmp/mariadb-connector.deb
RUN mkdir /var/run/sshd
CMD ["/usr/sbin/sshd", "-D"]

