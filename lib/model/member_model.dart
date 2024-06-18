class Member {
  final String name;
  final String email;
  final String description;
  final DateTime date;
  final int numberOfUserChildren;
  final int numberofMemberChildren;
  final int? MPP;
  final int MPC;
  final int numberOfDeletedChildren;
  final int phonenumber;

  Member(
      this.name,
      this.email,
      this.description,
      this.date,
      this.numberOfUserChildren,
      this.numberofMemberChildren,
      this.MPP,
      this.MPC,
      this.numberOfDeletedChildren,
      this.phonenumber);
}

Member memberInfo = Member(
    'Mai Shelbayeh',
    'maishelbayeh@gmail.com',
    'عضو في الشبكة',
    DateTime(2023, 10, 20), // Corrected date format
    2,
    5,
    50,
    25,
    3,
    05923683333);
