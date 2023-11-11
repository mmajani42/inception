# Ce fichier permet de créer le fichier de configuration de Wordpress et de passer la configuration de base de Wordpress

sleep 10
cd /var/www/wordpress

# Vérifier si le fichier de configuration de Wordpress existe déjà
if [ -f /var/www/wordpress/wp-config.php ]; then
	exit 0
fi

# Créer le fichier de configuration de Wordpress
wp config create	--allow-root \
			        --dbname=$DB_NAME \
			        --dbuser=$DB_USER \
			        --dbpass=$DB_PASSWORD \
			        --dbhost=$DB_HOST \
					--path='/var/www/wordpress'

# Installer Wordpress
wp core install 	--allow-root \
					--path=/var/www/wordpress \
					--url=https://$DOMAIN_NAME \
					--title="Inception Webception" \
					--admin_user=$DB_USER \
					--admin_password=$DB_PASSWORD \
					--admin_email=mmajani42@gmail.com

# Créer un utilisateur
wp user create 		--allow-root \
					--path=/var/www/wordpress \
					user1 mmajani@student.42lyon.fr \
					--user_pass=$DB_PASSWORD