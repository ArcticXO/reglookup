struct lifepickerapp: View {
    @State private var phone: String
    @State private var countryCode: String

    init(phone: String = "", countryCode: String = "+1") {
        _phone = State(initialValue: phone)
        _countryCode = State(initialValue: countryCode)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Color(uiColor: .systemYellow))
                    .ignoresSafeArea(edges: [.all])

                VStack(alignment: .leading, spacing: 16) {
                    ZStack(alignment: .leading) {
                        Capsule(
                            style: .circular
                        )
                        .fill(Color(hue: 0.123, saturation: 0.581, brightness: 0.851, opacity: 1))
                        .frame(
                            height: 3
                        )

                        Capsule(
                            style: .circular
                        )
                        .fill(Color(hue: 0.7222222222222218, saturation: 0.136, brightness: 0.086, opacity: 1))
                        .frame(
                            width: 24,
                            height: 3
                        )
                    }
                    Text("You're a Shmuck!")
                        .font(.system(.largeTitle, design: .default))
                        .bold()
                        .lineLimit(2...)

                    Text("As per GDPR requirements, if you look that ugly we need to know who you are. Pop your number inn to ger started")
                        .font(.system(.title3, design: .default))

                    HStack {
                        Picker("Picker", selection: $countryCode) {
                            Text("US +1").tag("+1")
                            Text("UK +44").tag("+44")
                            Text("PL +48").tag("+48")
                        }
                        .pickerStyle(.menu)
                        .tint(Color(hue: 0.7222222222222218, saturation: 0.136, brightness: 0.086, opacity: 1))
                        .padding(10)
                        .background(alignment: .center) {
                            RoundedRectangle(
                                cornerRadius: 8,
                                style: .circular
                            )
                            .fill(Color(uiColor: .white))
                        }

                        TextField("Phone number", text: $phone)
                            .padding()
                            .background(alignment: .center) {
                                RoundedRectangle(
                                    cornerRadius: 8,
                                    style: .circular
                                )
                                .fill(Color(uiColor: .white))
                                .shadow(
                                    color: Color(hue: 0, saturation: 0, brightness: 0, opacity: 0.15),
                                    radius: 0,
                                    x: 0,
                                    y: 4
                                )
                            }
                            .keyboardType(.phonePad)
                    }
                    Spacer()
                    HStack(spacing: 0) {
                        HStack {
                            Image(systemName: "lock.fill")
                            Text("If you are exceptionaly ugly, We may publish your darkest secrets to the internet.")
                                .font(.system(.footnote, design: .default))
                        }
                        Spacer(minLength: 16)
                        if phone == "" {
                            Image(systemName: "chevron.right")
                                .font(.system(size: 19, weight: .heavy, design: .default))
                                .padding()
                                .background(alignment: .center) {
                                    Circle()
                                        .fill(Color(uiColor: .white))
                                        .opacity(0.4)
                                }
                                .foregroundColor(Color(hue: 0.12230215827338126, saturation: 0.582, brightness: 0.937, opacity: 1))
                        }
                        if phone != "" {
                            NavigationLink {
                                Mode()

                            } label: {
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 19, weight: .heavy, design: .default))
                                    .padding()
                                    .background(alignment: .center) {
                                        Circle()
                                            .fill(Color(hue: 0.7222222222222218, saturation: 0.136, brightness: 0.086, opacity: 1))
                                    }
                                    .foregroundColor(Color(uiColor: .white))
                            }
                        }
                    }
                }
                .padding(40)
                .frame(
                    maxWidth: .infinity
                )
                .foregroundColor(Color(hue: 0.7222222222222218, saturation: 0.136, brightness: 0.086, opacity: 1))
            }
        }
    }
}
