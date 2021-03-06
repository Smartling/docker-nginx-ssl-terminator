FROM nginx:1.11
MAINTAINER dpavlov@smartling.com

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y ruby git openssl && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

COPY nginx.conf.erb /nginx.conf.erb
COPY openssl.cnf /openssl_for_selfsigned_cert.cnf

COPY nginx-entrypoint.sh /entrypoint
RUN chmod +x /entrypoint

EXPOSE 80 443

ENTRYPOINT [ "/entrypoint" ]

CMD ["nginx"]

