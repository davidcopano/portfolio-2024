# Usa una imagen de Node.js como base
FROM node:16

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el package.json y package-lock.json al directorio de trabajo
COPY package*.json ./

# Instala las dependencias
RUN npm install --legacy-peer-deps

# Copia el resto de los archivos del proyecto al directorio de trabajo
COPY . .

# Construye la aplicación
RUN npm run build

# Expone el puerto 3000 para acceder a la aplicación
EXPOSE 3000

# Ejecuta la aplicación cuando el contenedor se inicia
CMD ["npm", "start"]
