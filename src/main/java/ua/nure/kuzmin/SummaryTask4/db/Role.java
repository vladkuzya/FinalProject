package ua.nure.kuzmin.SummaryTask4.db;

import ua.nure.kuzmin.SummaryTask4.db.entity.User;

/**
 * Role entity.
 *
 * @author V.Kuzmin
 *
 */
public enum  Role {
    ADMIN, CLIENT;

    public static Role getRole(User user) {
        int roleId = user.getRoleId();
        return Role.values()[roleId - 1];
    }

    public String getName() {
        return name().toLowerCase();
    }
}
