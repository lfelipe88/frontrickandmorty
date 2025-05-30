FROM node:latest AS build

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar los archivos de la aplicación al contenedor
COPY . .

# Instalar las dependencias de la aplicación
RUN npm install

# Compilar la aplicación
RUN npm run build

# Usar una imagen ligera de Nginx para deploy
FROM nginx:latest

# Copiar la carpeta de salida de la aplicación al contenedor de Nginx
COPY --from=build /app/dist/api-ricky-morty /usr/share/nginx/html

# Exponer el puerto 80 para acceder a la aplicación
EXPOSE 80

