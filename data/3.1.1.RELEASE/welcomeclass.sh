echo '''package '''$BASE_PACKAGE'''.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Default welcome page of the application
 */
@Controller
@RequestMapping("/")
public class '''$CONTROLLER_CLASS''' {

	@RequestMapping
	public String welcome() {
        return "welcome";
	}
}'''> $DEFAULT_CONTROLLER_DIRECTORY/$CONTROLLER_CLASS.java

echo '''
<html>
	<head>Welcome Page</head>
	<body>
		<h1>Welcome Page</h1>
	</body>
</html>
''' > src/main/webapp/WEB-INF/jsp/welcome.jsp
