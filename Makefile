all:
	if ! grep -q "dzurita.42.fr" /etc/hosts; then \
		echo "127.0.0.1 dzurita.42.fr" >> /etc/hosts; \
	fi
	if ! grep -q "www.dzurita.42.fr" /etc/hosts; then \
		echo "127.0.0.1 www.dzurita.42.fr" >> /etc/hosts; \
	fi
	mkdir -p /home/dzurita/data/mariadb
	mkdir -p /home/dzurita/data/wordpress
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up -d
	
clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v

fclean: clean
	rm -rf /home/dzurita/data/mariadb
	rm -rf /home/dzurita/data/wordpress
	docker system prune -f

re: fclean all

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

.PHONY: all clean fclean re up down
