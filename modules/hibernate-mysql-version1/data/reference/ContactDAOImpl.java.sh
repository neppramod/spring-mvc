echo '''package '''$BASE_PACKAGE'''.dao;

import org.springframework.stereotype.Repository;

import '''$GROUP_ID'''.domain.Contact;
import '''$BASE_PACKAGE'''.dao.interfaces.ContactDAO;

@Repository
public class ContactDAOImpl extends GenericDAOImpl<Contact, Long> implements
		ContactDAO {

}''' > $DEFAULT_DAO_DIRECTORY/ContactDAOImpl.java
