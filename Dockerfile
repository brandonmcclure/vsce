FROM node:15

RUN npm install -g vsce

WORKDIR /work
ENTRYPOINT [ "vsce" ]
CMD [ "package" ]