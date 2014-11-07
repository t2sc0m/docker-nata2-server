FROM ytnobody/ubuntu-jp
MAINTAINER ytnobody <ytnobody@gmail.com>

RUN apt-get update && apt-get install sqlite3 mysql-client libsqlite3-dev -y --force-yes
RUN git clone https://github.com/tagomoris/xbuild.git /root/xbuild
RUN /root/xbuild/ruby-install 2.1.4 /root/ruby-2.1

ENV PATH /root/ruby-2.1/bin:$PATH

RUN git clone https://github.com/studio3104/nata2.git /root/nata2
RUN cd /root/nata2 && bundle install

RUN mkdir /data

ADD run.sh /root/run.sh
RUN chmod +x /root/run.sh

EXPOSE 9292
ENTRYPOINT ["/root/run.sh"]
