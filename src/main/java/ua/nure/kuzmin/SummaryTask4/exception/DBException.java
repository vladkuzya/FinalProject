package ua.nure.kuzmin.SummaryTask4.exception;
/**
 * An exception that provides information on a database access error.
 *
 * @author V.Kuzmin
 *
 */
public class DBException extends AppException {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public DBException() {
        super();
    }

    public DBException(String message, Throwable cause) {
        super(message, cause);
    }

}