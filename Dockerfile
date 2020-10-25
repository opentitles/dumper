FROM ubuntu:latest
WORKDIR /usr/src/dumper

# Install mongo
RUN apt update
RUN apt install -y cron gnupg wget systemd
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
RUN apt update
RUN apt install -y mongodb-org-tools

# Copy scripts
COPY dumper_entry.sh .
COPY dumper_script.sh .

# Setup cronjob
RUN mkdir -p /etc/cron.d
COPY dumper-cron /etc/cron.d/dumper-cron
RUN chmod 0644 /etc/cron.d/dumper-cron
RUN crontab /etc/cron.d/dumper-cron
RUN touch /var/log/cron.log

CMD cd /usr/src/dumper && ./dumper_entry.sh
