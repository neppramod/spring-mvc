echo '''package '''$BASE_PACKAGE'''.service.interfaces;

import '''$GROUP_ID'''.domain.Contact;

public interface ContactService extends GenericService<Contact, Long> {

}''' > $DEFAULT_SERVICE_INTERFACE_DIRECTORY/ContactService.java
