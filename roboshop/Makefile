help:	## print Help Massage
	@fgrep -h "#" $(MAKEFILE_LIST) | FGREP -V FGREP | SED -E 's/\\$$//' | sed -e 's##//'

Frontend:	##  Install Frontend Component
    @sh components/fronend.sh

mongodb:	##  Install Mongodb Component
    @sh components/mongodb.sh

catalogue:	##  Install Catalouge Component
    @sh components/catalogue.sh

redis:	##  Install redis Component
    @sh components/redis.sh

user:	##  Install user Component
    @sh components/user.sh

cart:	##  Install Cart Component
    @sh components/cart.sh

mysql:	##  Install Mysql Component
    @sh components/mysql.sh


shipping:	##  Install Shipping Component
    @sh components/shipping.sh


payment:	##  Install Payment Component
    @sh components/payment.sh


rabbitmq:	##  Install RabitMQ Component
    @sh components/rabbitmq.sh