enum ROLES { CUSTOMER, SHIPPER, STORE, ADMIN }

extension RolesExtension on ROLES {
  int get value {
    switch (this) {
      case ROLES.CUSTOMER:
        return 1;
      case ROLES.SHIPPER:
        return 2;
      case ROLES.STORE:
        return 3;
      case ROLES.ADMIN:
        return 4;
      default:
        return 0;
    }
  }
}
