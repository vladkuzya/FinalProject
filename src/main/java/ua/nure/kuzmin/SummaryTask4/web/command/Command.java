package ua.nure.kuzmin.SummaryTask4.web.command;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ua.nure.kuzmin.SummaryTask4.exception.AppException;

import java.io.IOException;

/**
 * The main interface for implementing the Command template.
 *
 * @author V.Kuzmin
 */
public abstract class Command {
    /**
     * Execution method for command.
     *
     * @return Address to go once the command is executed.
     */
    public abstract String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, AppException;

    @Override
    public final String toString() {
        return getClass().getSimpleName();
    }
}
