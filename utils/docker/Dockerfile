FROM alpine:3.21.1

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        curl \
        bash \
        && \
        :
#ENTRYPOINT [ "/bin/sh", "-c", "--" , "while true; do sleep 30; done;" ]
CMD ["/bin/bash"]
