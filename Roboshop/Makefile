help:		## print Help Massage
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's##//'

frontend:	##Install Frontend Component
	@sh Components/frontend.sh

mongodb:	##	Install Mongodb Component
	@sh Components/Mongodb.sh


catalogue:	## Install Catalogue Component
	@sh Components/Catalogue.sh

cedis:		## Install Redis Component
	@sh Components/Redis.sh

user:		## Install User Component
	@sh Components/User.sh

cart:		## Install Cart Component
	@sh Components/Cart.sh

mysql:		## Install Mysql Component
	@sh Components/Mysql.sh


shipping:	## Install Shipping Component
	@sh Components/Shipping.sh


payment:	## Install Paymemt Component
	@sh Components/payment.sh


rabbitmq:	## Install RabitMQ Component
	@sh Components/Rabbitmq.sh

