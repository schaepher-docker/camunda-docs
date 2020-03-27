FROM nginx:1.17.9-alpine

ARG HUGO_VER=0.68.3
ARG CAMUNDA_VER=7.10

RUN set -ex; \
    cd /tmp ; \
    wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VER}/hugo_${HUGO_VER}_Linux-64bit.tar.gz -O hugo.tgz ; \
    tar xvzf hugo.tgz ; \
    wget https://github.com/camunda/camunda-docs-manual/archive/${CAMUNDA_VER}.zip ; \
    unzip ${CAMUNDA_VER}.zip ; \
    cd camunda-docs-manual-${CAMUNDA_VER} ; \
    sed -i "s/manual\/${CAMUNDA_VER}\///g" config.yaml; \
    ../hugo ; \
    rm -f /usr/share/nginx/html/* ; \
    mv public/* /usr/share/nginx/html/ ; \
    cd /usr/share/nginx/html ; \
    rm -rf /tmp/*