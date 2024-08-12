k8s__%:
	${MAKE} --directory k8s -f Makefile $*

app__%:
	${MAKE} --directory javascript-application -f Makefile $*

api-gateway__%:
	${MAKE} --directory api-gateway -f Makefile $*

terraform__%:
	${MAKE} --directory terraform -f Makefile $*

kafka__%:
	${MAKE} --directory kafka -f Makefile $*
