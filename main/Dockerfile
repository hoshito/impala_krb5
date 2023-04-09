FROM impala-76ec

RUN mkdir /backup /root/work
WORKDIR /root/work

RUN cp /home/impdev/Impala/bin/impala-config.sh \
       /home/impdev/Impala/testdata/bin/minikdc_env.sh \
       /home/impdev/Impala/bin/kerberos/experimental-kerberos-setup.sh \
       /backup

COPY impala-config.sh /home/impdev/Impala/bin/impala-config.sh
COPY minikdc_env.sh /home/impdev/Impala/testdata/bin/minikdc_env.sh
COPY experimental-kerberos-setup.sh /home/impdev/Impala/bin/kerberos/experimental-kerberos-setup.sh

COPY krb5.conf /etc/krb5.conf
COPY kadm5.acl /etc/krb5kdc/kadm5.acl

COPY root_entrypoint.sh /root/work/entrypoint.sh
COPY impdev_entrypoint.sh /home/impdev/entrypoint.sh

#COPY nifi-1.17.0-bin.zip /root/work
#RUN apt install -y unzip && unzip nifi-1.17.0-bin.zip
#COPY nifi.properties /root/work/nifi-1.17.0/conf

CMD /bin/bash

