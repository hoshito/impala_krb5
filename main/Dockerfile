FROM impala-76ec

RUN mkdir /backup
RUN cp /home/impdev/Impala/bin/impala-config.sh \
       /home/impdev/Impala/testdata/bin/minikdc_env.sh \
       /home/impdev/Impala/bin/kerberos/experimental-kerberos-setup.sh \
       /backup

COPY impala-config.sh /home/impdev/Impala/bin/impala-config.sh
COPY minikdc_env.sh /home/impdev/Impala/testdata/bin/minikdc_env.sh
COPY experimental-kerberos-setup.sh /home/impdev/Impala/bin/kerberos/experimental-kerberos-setup.sh

COPY krb5.conf /etc/krb5.conf
COPY kadm5.acl /etc/krb5kdc/kadm5.acl

COPY root_entrypoint.sh /entrypoint.sh
COPY impdev_entrypoint.sh /home/impdev/entrypoint.sh

CMD /bin/bash

