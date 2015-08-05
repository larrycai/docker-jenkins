== docker-jenkins ==

This is the base jenkins docker image which contains some useful jenkins plugin already.

	docker run -it -p 8080:8080 larrycai/jenkins

You can also build downstream jenkins images by putting your configuration into `JENKINS_HOME`, it will be triggered by `ONBUILD`

	ONBUILD COPY JENKINS_HOME $JENKINS_HOME
	
Mostly in your `Dockerfile`

	FROM larrycai/jenkins-onbuild
	
== TODO ==
* install_plugins.sh : to load your own plugins 
* pin_plugins.sh     : pin some plugins 

== Reference ==
* Official jenkins image : http://jenkins-ci.org/content/official-jenkins-lts-docker-image 

