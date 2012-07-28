echo '''package '''$BASE_PACKAGE'''.dao.interfaces;

import '''$GROUP_ID'''.domain.Contact;

public interface ContactDAO extends GenericDAO<Contact, Long> {

}''' > $DEFAULT_DAO_INTERFACE_DIRECTORY/ContactDAO.java
