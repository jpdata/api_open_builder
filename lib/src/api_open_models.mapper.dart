// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'api_open_models.dart';

class ParameterMapper extends ClassMapperBase<Parameter> {
  ParameterMapper._();

  static ParameterMapper? _instance;
  static ParameterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ParameterMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Parameter';

  static ParameterType _$type(Parameter v) => v.type;
  static const Field<Parameter, ParameterType> _f$type = Field('type', _$type);
  static BodyType _$bodyType(Parameter v) => v.bodyType;
  static const Field<Parameter, BodyType> _f$bodyType =
      Field('bodyType', _$bodyType, opt: true, def: BodyType.json);

  @override
  final MappableFields<Parameter> fields = const {
    #type: _f$type,
    #bodyType: _f$bodyType,
  };

  static Parameter _instantiate(DecodingData data) {
    return Parameter(data.dec(_f$type), data.dec(_f$bodyType));
  }

  @override
  final Function instantiate = _instantiate;

  static Parameter fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Parameter>(map);
  }

  static Parameter fromJson(String json) {
    return ensureInitialized().decodeJson<Parameter>(json);
  }
}

mixin ParameterMappable {
  String toJson() {
    return ParameterMapper.ensureInitialized()
        .encodeJson<Parameter>(this as Parameter);
  }

  Map<String, dynamic> toMap() {
    return ParameterMapper.ensureInitialized()
        .encodeMap<Parameter>(this as Parameter);
  }

  ParameterCopyWith<Parameter, Parameter, Parameter> get copyWith =>
      _ParameterCopyWithImpl(this as Parameter, $identity, $identity);
  @override
  String toString() {
    return ParameterMapper.ensureInitialized()
        .stringifyValue(this as Parameter);
  }

  @override
  bool operator ==(Object other) {
    return ParameterMapper.ensureInitialized()
        .equalsValue(this as Parameter, other);
  }

  @override
  int get hashCode {
    return ParameterMapper.ensureInitialized().hashValue(this as Parameter);
  }
}

extension ParameterValueCopy<$R, $Out> on ObjectCopyWith<$R, Parameter, $Out> {
  ParameterCopyWith<$R, Parameter, $Out> get $asParameter =>
      $base.as((v, t, t2) => _ParameterCopyWithImpl(v, t, t2));
}

abstract class ParameterCopyWith<$R, $In extends Parameter, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({ParameterType? type, BodyType? bodyType});
  ParameterCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ParameterCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Parameter, $Out>
    implements ParameterCopyWith<$R, Parameter, $Out> {
  _ParameterCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Parameter> $mapper =
      ParameterMapper.ensureInitialized();
  @override
  $R call({ParameterType? type, BodyType? bodyType}) =>
      $apply(FieldCopyWithData({
        if (type != null) #type: type,
        if (bodyType != null) #bodyType: bodyType
      }));
  @override
  Parameter $make(CopyWithData data) => Parameter(
      data.get(#type, or: $value.type),
      data.get(#bodyType, or: $value.bodyType));

  @override
  ParameterCopyWith<$R2, Parameter, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ParameterCopyWithImpl($value, $cast, t);
}

class ExternaldocsMapper extends ClassMapperBase<Externaldocs> {
  ExternaldocsMapper._();

  static ExternaldocsMapper? _instance;
  static ExternaldocsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExternaldocsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Externaldocs';

  static String _$url(Externaldocs v) => v.url;
  static const Field<Externaldocs, String> _f$url =
      Field('url', _$url, opt: true, def: "0");
  static String _$description(Externaldocs v) => v.description;
  static const Field<Externaldocs, String> _f$description =
      Field('description', _$description, opt: true, def: "");

  @override
  final MappableFields<Externaldocs> fields = const {
    #url: _f$url,
    #description: _f$description,
  };

  static Externaldocs _instantiate(DecodingData data) {
    return Externaldocs(data.dec(_f$url), data.dec(_f$description));
  }

  @override
  final Function instantiate = _instantiate;

  static Externaldocs fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Externaldocs>(map);
  }

  static Externaldocs fromJson(String json) {
    return ensureInitialized().decodeJson<Externaldocs>(json);
  }
}

mixin ExternaldocsMappable {
  String toJson() {
    return ExternaldocsMapper.ensureInitialized()
        .encodeJson<Externaldocs>(this as Externaldocs);
  }

  Map<String, dynamic> toMap() {
    return ExternaldocsMapper.ensureInitialized()
        .encodeMap<Externaldocs>(this as Externaldocs);
  }

  ExternaldocsCopyWith<Externaldocs, Externaldocs, Externaldocs> get copyWith =>
      _ExternaldocsCopyWithImpl(this as Externaldocs, $identity, $identity);
  @override
  String toString() {
    return ExternaldocsMapper.ensureInitialized()
        .stringifyValue(this as Externaldocs);
  }

  @override
  bool operator ==(Object other) {
    return ExternaldocsMapper.ensureInitialized()
        .equalsValue(this as Externaldocs, other);
  }

  @override
  int get hashCode {
    return ExternaldocsMapper.ensureInitialized()
        .hashValue(this as Externaldocs);
  }
}

extension ExternaldocsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Externaldocs, $Out> {
  ExternaldocsCopyWith<$R, Externaldocs, $Out> get $asExternaldocs =>
      $base.as((v, t, t2) => _ExternaldocsCopyWithImpl(v, t, t2));
}

abstract class ExternaldocsCopyWith<$R, $In extends Externaldocs, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? url, String? description});
  ExternaldocsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ExternaldocsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Externaldocs, $Out>
    implements ExternaldocsCopyWith<$R, Externaldocs, $Out> {
  _ExternaldocsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Externaldocs> $mapper =
      ExternaldocsMapper.ensureInitialized();
  @override
  $R call({String? url, String? description}) => $apply(FieldCopyWithData({
        if (url != null) #url: url,
        if (description != null) #description: description
      }));
  @override
  Externaldocs $make(CopyWithData data) => Externaldocs(
      data.get(#url, or: $value.url),
      data.get(#description, or: $value.description));

  @override
  ExternaldocsCopyWith<$R2, Externaldocs, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ExternaldocsCopyWithImpl($value, $cast, t);
}

class TagMapper extends ClassMapperBase<Tag> {
  TagMapper._();

  static TagMapper? _instance;
  static TagMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagMapper._());
      ExternaldocsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Tag';

  static String _$name(Tag v) => v.name;
  static const Field<Tag, String> _f$name = Field('name', _$name);
  static String _$description(Tag v) => v.description;
  static const Field<Tag, String> _f$description =
      Field('description', _$description, opt: true, def: "");
  static Externaldocs _$externalDocs(Tag v) => v.externalDocs;
  static const Field<Tag, Externaldocs> _f$externalDocs = Field(
      'externalDocs', _$externalDocs,
      opt: true, def: const Externaldocs("", ""));

  @override
  final MappableFields<Tag> fields = const {
    #name: _f$name,
    #description: _f$description,
    #externalDocs: _f$externalDocs,
  };

  static Tag _instantiate(DecodingData data) {
    return Tag(
        data.dec(_f$name), data.dec(_f$description), data.dec(_f$externalDocs));
  }

  @override
  final Function instantiate = _instantiate;

  static Tag fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Tag>(map);
  }

  static Tag fromJson(String json) {
    return ensureInitialized().decodeJson<Tag>(json);
  }
}

mixin TagMappable {
  String toJson() {
    return TagMapper.ensureInitialized().encodeJson<Tag>(this as Tag);
  }

  Map<String, dynamic> toMap() {
    return TagMapper.ensureInitialized().encodeMap<Tag>(this as Tag);
  }

  TagCopyWith<Tag, Tag, Tag> get copyWith =>
      _TagCopyWithImpl(this as Tag, $identity, $identity);
  @override
  String toString() {
    return TagMapper.ensureInitialized().stringifyValue(this as Tag);
  }

  @override
  bool operator ==(Object other) {
    return TagMapper.ensureInitialized().equalsValue(this as Tag, other);
  }

  @override
  int get hashCode {
    return TagMapper.ensureInitialized().hashValue(this as Tag);
  }
}

extension TagValueCopy<$R, $Out> on ObjectCopyWith<$R, Tag, $Out> {
  TagCopyWith<$R, Tag, $Out> get $asTag =>
      $base.as((v, t, t2) => _TagCopyWithImpl(v, t, t2));
}

abstract class TagCopyWith<$R, $In extends Tag, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ExternaldocsCopyWith<$R, Externaldocs, Externaldocs> get externalDocs;
  $R call({String? name, String? description, Externaldocs? externalDocs});
  TagCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TagCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Tag, $Out>
    implements TagCopyWith<$R, Tag, $Out> {
  _TagCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Tag> $mapper = TagMapper.ensureInitialized();
  @override
  ExternaldocsCopyWith<$R, Externaldocs, Externaldocs> get externalDocs =>
      $value.externalDocs.copyWith.$chain((v) => call(externalDocs: v));
  @override
  $R call({String? name, String? description, Externaldocs? externalDocs}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (description != null) #description: description,
        if (externalDocs != null) #externalDocs: externalDocs
      }));
  @override
  Tag $make(CopyWithData data) => Tag(
      data.get(#name, or: $value.name),
      data.get(#description, or: $value.description),
      data.get(#externalDocs, or: $value.externalDocs));

  @override
  TagCopyWith<$R2, Tag, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TagCopyWithImpl($value, $cast, t);
}

class InfoMapper extends ClassMapperBase<Info> {
  InfoMapper._();

  static InfoMapper? _instance;
  static InfoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InfoMapper._());
      MapperContainer.globals.useAll([UriMapper()]);
      ContactMapper.ensureInitialized();
      LicenseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Info';

  static String _$title(Info v) => v.title;
  static const Field<Info, String> _f$title =
      Field('title', _$title, opt: true, def: "ApiOpen");
  static String _$version(Info v) => v.version;
  static const Field<Info, String> _f$version =
      Field('version', _$version, opt: true, def: "0.0.1");
  static String _$description(Info v) => v.description;
  static const Field<Info, String> _f$description = Field(
      'description', _$description,
      opt: true, def: "ApiOpen description");
  static Uri? _$termsOfService(Info v) => v.termsOfService;
  static const Field<Info, Uri> _f$termsOfService =
      Field('termsOfService', _$termsOfService, opt: true);
  static Contact? _$contact(Info v) => v.contact;
  static const Field<Info, Contact> _f$contact =
      Field('contact', _$contact, opt: true);
  static License? _$license(Info v) => v.license;
  static const Field<Info, License> _f$license =
      Field('license', _$license, opt: true);

  @override
  final MappableFields<Info> fields = const {
    #title: _f$title,
    #version: _f$version,
    #description: _f$description,
    #termsOfService: _f$termsOfService,
    #contact: _f$contact,
    #license: _f$license,
  };

  static Info _instantiate(DecodingData data) {
    return Info(
        title: data.dec(_f$title),
        version: data.dec(_f$version),
        description: data.dec(_f$description),
        termsOfService: data.dec(_f$termsOfService),
        contact: data.dec(_f$contact),
        license: data.dec(_f$license));
  }

  @override
  final Function instantiate = _instantiate;

  static Info fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Info>(map);
  }

  static Info fromJson(String json) {
    return ensureInitialized().decodeJson<Info>(json);
  }
}

mixin InfoMappable {
  String toJson() {
    return InfoMapper.ensureInitialized().encodeJson<Info>(this as Info);
  }

  Map<String, dynamic> toMap() {
    return InfoMapper.ensureInitialized().encodeMap<Info>(this as Info);
  }

  InfoCopyWith<Info, Info, Info> get copyWith =>
      _InfoCopyWithImpl(this as Info, $identity, $identity);
  @override
  String toString() {
    return InfoMapper.ensureInitialized().stringifyValue(this as Info);
  }

  @override
  bool operator ==(Object other) {
    return InfoMapper.ensureInitialized().equalsValue(this as Info, other);
  }

  @override
  int get hashCode {
    return InfoMapper.ensureInitialized().hashValue(this as Info);
  }
}

extension InfoValueCopy<$R, $Out> on ObjectCopyWith<$R, Info, $Out> {
  InfoCopyWith<$R, Info, $Out> get $asInfo =>
      $base.as((v, t, t2) => _InfoCopyWithImpl(v, t, t2));
}

abstract class InfoCopyWith<$R, $In extends Info, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ContactCopyWith<$R, Contact, Contact>? get contact;
  LicenseCopyWith<$R, License, License>? get license;
  $R call(
      {String? title,
      String? version,
      String? description,
      Uri? termsOfService,
      Contact? contact,
      License? license});
  InfoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _InfoCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Info, $Out>
    implements InfoCopyWith<$R, Info, $Out> {
  _InfoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Info> $mapper = InfoMapper.ensureInitialized();
  @override
  ContactCopyWith<$R, Contact, Contact>? get contact =>
      $value.contact?.copyWith.$chain((v) => call(contact: v));
  @override
  LicenseCopyWith<$R, License, License>? get license =>
      $value.license?.copyWith.$chain((v) => call(license: v));
  @override
  $R call(
          {String? title,
          String? version,
          String? description,
          Object? termsOfService = $none,
          Object? contact = $none,
          Object? license = $none}) =>
      $apply(FieldCopyWithData({
        if (title != null) #title: title,
        if (version != null) #version: version,
        if (description != null) #description: description,
        if (termsOfService != $none) #termsOfService: termsOfService,
        if (contact != $none) #contact: contact,
        if (license != $none) #license: license
      }));
  @override
  Info $make(CopyWithData data) => Info(
      title: data.get(#title, or: $value.title),
      version: data.get(#version, or: $value.version),
      description: data.get(#description, or: $value.description),
      termsOfService: data.get(#termsOfService, or: $value.termsOfService),
      contact: data.get(#contact, or: $value.contact),
      license: data.get(#license, or: $value.license));

  @override
  InfoCopyWith<$R2, Info, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _InfoCopyWithImpl($value, $cast, t);
}

class ContactMapper extends ClassMapperBase<Contact> {
  ContactMapper._();

  static ContactMapper? _instance;
  static ContactMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContactMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Contact';

  static String _$name(Contact v) => v.name;
  static const Field<Contact, String> _f$name =
      Field('name', _$name, opt: true, def: "");
  static String _$email(Contact v) => v.email;
  static const Field<Contact, String> _f$email =
      Field('email', _$email, opt: true, def: "");

  @override
  final MappableFields<Contact> fields = const {
    #name: _f$name,
    #email: _f$email,
  };

  static Contact _instantiate(DecodingData data) {
    return Contact(name: data.dec(_f$name), email: data.dec(_f$email));
  }

  @override
  final Function instantiate = _instantiate;

  static Contact fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Contact>(map);
  }

  static Contact fromJson(String json) {
    return ensureInitialized().decodeJson<Contact>(json);
  }
}

mixin ContactMappable {
  String toJson() {
    return ContactMapper.ensureInitialized()
        .encodeJson<Contact>(this as Contact);
  }

  Map<String, dynamic> toMap() {
    return ContactMapper.ensureInitialized()
        .encodeMap<Contact>(this as Contact);
  }

  ContactCopyWith<Contact, Contact, Contact> get copyWith =>
      _ContactCopyWithImpl(this as Contact, $identity, $identity);
  @override
  String toString() {
    return ContactMapper.ensureInitialized().stringifyValue(this as Contact);
  }

  @override
  bool operator ==(Object other) {
    return ContactMapper.ensureInitialized()
        .equalsValue(this as Contact, other);
  }

  @override
  int get hashCode {
    return ContactMapper.ensureInitialized().hashValue(this as Contact);
  }
}

extension ContactValueCopy<$R, $Out> on ObjectCopyWith<$R, Contact, $Out> {
  ContactCopyWith<$R, Contact, $Out> get $asContact =>
      $base.as((v, t, t2) => _ContactCopyWithImpl(v, t, t2));
}

abstract class ContactCopyWith<$R, $In extends Contact, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? email});
  ContactCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ContactCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Contact, $Out>
    implements ContactCopyWith<$R, Contact, $Out> {
  _ContactCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Contact> $mapper =
      ContactMapper.ensureInitialized();
  @override
  $R call({String? name, String? email}) => $apply(FieldCopyWithData(
      {if (name != null) #name: name, if (email != null) #email: email}));
  @override
  Contact $make(CopyWithData data) => Contact(
      name: data.get(#name, or: $value.name),
      email: data.get(#email, or: $value.email));

  @override
  ContactCopyWith<$R2, Contact, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ContactCopyWithImpl($value, $cast, t);
}

class LicenseMapper extends ClassMapperBase<License> {
  LicenseMapper._();

  static LicenseMapper? _instance;
  static LicenseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LicenseMapper._());
      MapperContainer.globals.useAll([UriMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'License';

  static String _$name(License v) => v.name;
  static const Field<License, String> _f$name =
      Field('name', _$name, opt: true, def: "");
  static Uri? _$url(License v) => v.url;
  static const Field<License, Uri> _f$url = Field('url', _$url, opt: true);

  @override
  final MappableFields<License> fields = const {
    #name: _f$name,
    #url: _f$url,
  };

  static License _instantiate(DecodingData data) {
    return License(name: data.dec(_f$name), url: data.dec(_f$url));
  }

  @override
  final Function instantiate = _instantiate;

  static License fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<License>(map);
  }

  static License fromJson(String json) {
    return ensureInitialized().decodeJson<License>(json);
  }
}

mixin LicenseMappable {
  String toJson() {
    return LicenseMapper.ensureInitialized()
        .encodeJson<License>(this as License);
  }

  Map<String, dynamic> toMap() {
    return LicenseMapper.ensureInitialized()
        .encodeMap<License>(this as License);
  }

  LicenseCopyWith<License, License, License> get copyWith =>
      _LicenseCopyWithImpl(this as License, $identity, $identity);
  @override
  String toString() {
    return LicenseMapper.ensureInitialized().stringifyValue(this as License);
  }

  @override
  bool operator ==(Object other) {
    return LicenseMapper.ensureInitialized()
        .equalsValue(this as License, other);
  }

  @override
  int get hashCode {
    return LicenseMapper.ensureInitialized().hashValue(this as License);
  }
}

extension LicenseValueCopy<$R, $Out> on ObjectCopyWith<$R, License, $Out> {
  LicenseCopyWith<$R, License, $Out> get $asLicense =>
      $base.as((v, t, t2) => _LicenseCopyWithImpl(v, t, t2));
}

abstract class LicenseCopyWith<$R, $In extends License, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, Uri? url});
  LicenseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LicenseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, License, $Out>
    implements LicenseCopyWith<$R, License, $Out> {
  _LicenseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<License> $mapper =
      LicenseMapper.ensureInitialized();
  @override
  $R call({String? name, Object? url = $none}) => $apply(FieldCopyWithData(
      {if (name != null) #name: name, if (url != $none) #url: url}));
  @override
  License $make(CopyWithData data) => License(
      name: data.get(#name, or: $value.name),
      url: data.get(#url, or: $value.url));

  @override
  LicenseCopyWith<$R2, License, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LicenseCopyWithImpl($value, $cast, t);
}
