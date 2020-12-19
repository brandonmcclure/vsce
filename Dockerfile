FROM node:lts-alpine3.12

RUN npm install -g vsce

WORKDIR /work
ENTRYPOINT [ "vsce" ]
CMD [ "package" ]