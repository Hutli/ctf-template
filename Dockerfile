FROM ubuntu:bionic

RUN apt-get update
RUN apt-get -y install git tmux python3 python3-pip wget vim gdb gdbserver vim nano locales seccomp libc6-dbg
RUN wget -O /opt/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
RUN git clone https://github.com/pwndbg/pwndbg /opt/pwndbg
RUN pip3 install --upgrade pwntools
RUN pip3 install --upgrade future
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN echo "source /opt/pwndbg/gdbinit.py" > /root/.gdbinit

RUN rm -rf /var/lib/apt/lists/* \
&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

WORKDIR /root

COPY ./* /root/
