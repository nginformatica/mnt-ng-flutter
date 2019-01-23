class OrderService {
  const OrderService({this.id, this.name, this.type});

  final String id;
  final String name;
  final OrderServiceType type;
}


enum OrderServiceType {
 corrective, reventive
}
