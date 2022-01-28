FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json . 

RUN npm install

COPY . .

RUN npm run build

#/app/build 


FROM nginx

#copy from builder phase 
COPY --from=builder /app/build /usr/share/nginx/html
#/usr/share/nginx/html default place of nginx image to put static html and run
#nginx doesnt need start command its already set in the image


