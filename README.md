## docker-jenkins ##

This is the base jenkins docker image which contains some useful jenkins plugin, it can be started directly.

	docker run -it -p 8080:8080 larrycai/jenkins

It can also be used as parent to build downstream jenkins images by putting your configuration into `JENKINS_HOME`, it will be triggered by `ONBUILD`

	ONBUILD COPY JENKINS_HOME $JENKINS_HOME
	
Mostly in your `Dockerfile`

	FROM larrycai/jenkins
	
## TODO ##

* install_plugins.sh : to load your own plugins 
* pin_plugins.sh     : pin some plugins 

## Reference ##

* Official jenkins image : http://jenkins-ci.org/content/official-jenkins-lts-docker-image 

