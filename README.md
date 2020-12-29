Configuracion e instalación de el tema Univalle para la revista OJS colombiamedica  
========

## Instalación de el tema

### OJS 3.x

#### Via GIT

Clone el archivo dentro de la carpeta plugins/themes/ con el nombre *univalle* de la siguiente manera:

``` git clone https://github.com/andresmv94/colombiamedica univalle ```
Luego de los permisos correspondientes

```
APACHE_USER=$(ps -ef | egrep '(httpd|apache2|apache)' | grep -v `whoami` | grep -v root | head -n1 | awk '{print $1}')
APACHE_GROUP=$APACHE_USER
chown -R $APACHE_USER:$APACHE_GROUP univalle
```

#### Descargando los archivos manualmente

Descargue el archivo de el repositorio, muevalo a la carpeta plugins/themes y luego ejecute los siguientes comandos (debe tener instalado unzip)


```
APACHE_USER=$(ps -ef | egrep '(httpd|apache2|apache)' | grep -v `whoami` | grep -v root | head -n1 | awk '{print $1}')
APACHE_GROUP=$APACHE_USER
unzip colombiamedica-master.zip
mv colombiamedica univalle
chown -R $APACHE_USER:$APACHE_GROUP univalle
``` 



