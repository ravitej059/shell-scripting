help:		## Print Help Message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

frontend:
	@sh components/frontend.sh

mongodb:
	@sh components/mongodb.sh

catalogue:
	@sh components/catalogue.sh

redis:
	@sh components/redis.sh

user:
	@sh components/user.sh

cart:
	@sh components/cart.sh

mysql:
	@sh components/mysql.sh

shipping:
	@sh components/shipping.sh

payment:
	@sh components/payment.sh

rabbitmq:
	@sh components/rabbitmq.sh