class LaundryService {
  static const double cuciSetrikaPerKg = 6000;
  static const double cuciPerKg = 4000;
  static const double setrikaPerKg = 3000;

  final String nama;
  final double berat;
  final String tipePaket;

  LaundryService(this.nama, this.berat, this.tipePaket);

  double calculatePricePerKg() {
    switch (tipePaket.toLowerCase()) {
      case 'cuci dan setrika':
        return cuciSetrikaPerKg;
      case 'cuci':
        return cuciPerKg;
      case 'setrika':
        return setrikaPerKg;
      default:
        throw Exception('Paket tidak valid');
    }
  }

  double calculateSubtotal() {
    return berat * calculatePricePerKg();
  }

  double calculateDiskon() {
    double subtotal = calculateSubtotal();

    if (subtotal > 100000) {
      return subtotal * 0.10;
    } else if (subtotal >= 50000) {
      return subtotal * 0.05;
    } else {
      return 0;
    }
  }

  double calculateTotal() {
    return calculateSubtotal() - calculateDiskon();
  }

  void displayInvoice() {
    double subtotal = calculateSubtotal();
    double diskon = calculateDiskon();
    double total = calculateTotal();

    print('');
    print('=' * 40);
    print('INVOICE LAUNDRY');
    print('=' * 40);
    print('Nama Pelanggan: $nama');
    print('Berat Laundry: ${berat.toStringAsFixed(1)} kg');
    print('Jenis Paket: $tipePaket');
    print('Harga per Kg: Rp ${calculatePricePerKg().toStringAsFixed(0)}');
    print('-' * 40);
    print('Subtotal: Rp ${subtotal.toStringAsFixed(0)}');
    print('Diskon: Rp ${diskon.toStringAsFixed(0)}');
    print('-' * 40);
    print('TOTAL: Rp ${total.toStringAsFixed(0)}');
    print('=' * 40);
    print('TERIMA KASIH');
    print('');
  }
}

void main() {
  print('CONTOH APLIKASI MINI LAUNDRY');
  print('');

  var laundryList = [
    LaundryService('Astro', 9.0, 'Cuci dan Setrika'),
    LaundryService('Siti Rahayu', 7.5, 'Cuci'),
    LaundryService('Ahmad Fauzi', 20.0, 'Setrika'),
    LaundryService('Zahra', 18.0, 'Cuci dan Setrika'),
    LaundryService('Diego', 13.0, 'Cuci'),
  ];

  for (var laundry in laundryList) {
    laundry.displayInvoice();
  }
}
