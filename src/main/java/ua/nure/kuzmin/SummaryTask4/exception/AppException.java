package ua.nure.kuzmin.SummaryTask4.exception;
/**
 * 
 * An exception that provides information about an application error.
 *
 * @author V.Kuzmin
 *
 */
public class AppException extends Exception {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AppException() {
        super();
    }

    public AppException(String message, Throwable cause) {
        super(message, cause);
    }

    public AppException(String message) {
        super(message);
    }
}
