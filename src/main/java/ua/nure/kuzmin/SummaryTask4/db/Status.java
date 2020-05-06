package ua.nure.kuzmin.SummaryTask4.db;

import ua.nure.kuzmin.SummaryTask4.db.entity.Order;
/**
 * Status entity.
 *
 * @author V.Kuzmin
 *
 */
public enum Status {
    UNPAID, PAID;
    public static Status getStatus(Order order) {
        int statusId = order.getStatusId();
        return Status.values()[statusId - 1];
    }
    public String getName() {
        return name().toLowerCase();
    }
}
