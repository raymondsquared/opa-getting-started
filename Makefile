k8s__%:
	${MAKE} --directory k8s -f Makefile $*

app__%:
	${MAKE} --directory javascript-application -f Makefile $*
