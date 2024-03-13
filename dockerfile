# use python3.8 as base image
# FROM python:3.8-bookworm
# FROM python:3.10-bookworm
FROM python:3.7-bookworm

# install gcsfuse dependencies
RUN apt update && \
    apt install -y nfs-common

# install odoo dependencies
RUN apt -y install git build-essential libxslt-dev libzip-dev libldap2-dev libsasl2-dev node-less libpq-dev

# create an odoo user and give that user sudo privilege
RUN groupadd -g 8069 odoo
RUN useradd -r -u 8069 -g 8069 -d /home/odoo -s /bin/bash odoo
RUN usermod -aG root odoo
RUN mkdir /home/odoo
RUN chown odoo: /home/odoo
# RUN echo "odoo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# copy the source code to the image
COPY . /opt/odoo

# set the working directory to /opt/odoo
WORKDIR /opt/odoo

# install odoo python dependecies
RUN export MAKEFLAGS="-j $(nproc)"
RUN pip install wheel
RUN pip install -r ./odoo-base/requirements.txt

# make the entrypoint script executable
RUN chmod +x ./entrypoint.sh
RUN chmod +x ./run-odoo.sh

# expose the default port of odoo
EXPOSE 8069
EXPOSE 8072

# set the command to run odoo instance using entrypoint.sh
CMD ["./entrypoint.sh"]

