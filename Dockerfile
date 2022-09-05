FROM node:18

RUN npm install -g vsce

WORKDIR /work
ENTRYPOINT [ "vsce" ]
CMD [ "package" ]