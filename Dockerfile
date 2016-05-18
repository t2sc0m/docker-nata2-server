FROM ytnobody/base:wheezy
MAINTAINER ytnobody <ytnobody@gmail.com>

RUN apt-get update && apt-get install sqlite3 mysql-client libsqlite3-dev bzip2 libssl-dev libreadline-dev zlib1g-dev libmysqlclient-dev -y --force-yes

WORKDIR /opt
RUN git clone https://github.com/rbenv/ruby-build.git

WORKDIR /opt/ruby-build
RUN ./bin/ruby-build 2.1.8 /root/ruby-2.1
ENV PATH /root/ruby-2.1/bin:$PATH

RUN gem install bundler

WORKDIR /root
RUN git clone https://github.com/studio3104/nata2.git /root/nata2
WORKDIR /root/nata2
RUN git checkout a7d400c030dcd66aca6ab4963eadfa511253cf83
WORKDIR /root 
RUN cd /root/nata2 && bundle install

RUN mkdir /data

ADD run.sh /root/run.sh
RUN chmod +x /root/run.sh

EXPOSE 9292
ENTRYPOINT ["/root/run.sh"]
