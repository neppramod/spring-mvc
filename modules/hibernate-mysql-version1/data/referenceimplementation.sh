# We have two reference implemenations
# Difference between them in only in the service layer.
# One uses generic service and another uses traditional interface implementation mechanish
# I have not tested the formor one as much for the service layer, so I have included both
# I will create two variables here so you can choose to omit the one you don't like included.
# a. Contact : Uses generic service
# b. Person : Uses traditional service interface and implementation

CONTACT_REFERENCE_CREATE="y"
PERSON_REFERENCE_CREATE="y"

REFERENCE_DIRECTORY=$DATA_DIRECTORY/reference/

if [ $CONTACT_REFERENCE_CREATE = "y" ]; then
	cp -R $REFERENCE_DIRECTORY/contacts src/main/webapp/WEB-INF/jsp/
	source $REFERENCE_DIRECTORY/Contact.java.sh
	source $REFERENCE_DIRECTORY/ContactController.java.sh
	source $REFERENCE_DIRECTORY/ContactDAO.java.sh
	source $REFERENCE_DIRECTORY/ContactDAOImpl.java.sh
	source $REFERENCE_DIRECTORY/ContactService.java.sh
	source $REFERENCE_DIRECTORY/ContactServiceImpl.java.sh
fi

if [ $USE_REFERENCE_IMPLEMENTATION = "y" ]; then
	echo '''<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<html><head><title>Links</title></head><body>''' >  src/main/webapp/resources/links.jsp
		if [ $CONTACT_REFERENCE_CREATE = "y" ]; then
			echo '''<h5><a href="<c:url value="/contacts/" />">Contacts</a></h5>''' >> src/main/webapp/resources/links.jsp
		fi
		echo '''</body></html>''' >> src/main/webapp/resources/links.jsp
fi
	