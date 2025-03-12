FROM <base_image>
RUN apt update
RUN apt install net-tools
RUN apt install vim 
WORKDIR /src 
ENV VAR1 VALUE1 
ENV VAR2 VALUE2 
COPY /home/charan/code /src
ADD https://github.com/nextopsvideos/code.zip /src
EXPOSE 8080
CMD ["/bin/bash -c ifconfig"]
MAINTAINER 
LABEL app=mavenapp