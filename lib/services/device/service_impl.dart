import 'package:contacts_service/contacts_service.dart';
import 'package:postino/services/device/service.dart';

class DeviceServiceImpl  extends DeviceService{
  @override
  Future<List<String>> getDeviceContacts()async {
    final List<Contact> contacts = await ContactsService.getContacts();
    final List<String> contactPhoneNumbers = [];
    contacts.forEach((contact) {
      contact.phones?.forEach((phone) {
        if (phone.value != null) {
          String number = phone.value!.replaceAll('(', '');
          number = number.replaceAll(')', '');
          number = number.replaceAll('-', '');
          number = number.replaceAll(' ', '');
          contactPhoneNumbers.add(number);
        }
      });
    });
    return contactPhoneNumbers;
  }

}
