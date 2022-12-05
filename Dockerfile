FROM node:19

RUN npm install -g vsce@2.11

WORKDIR /work
ENTRYPOINT [ "vsce" ]
CMD [ "package" ]