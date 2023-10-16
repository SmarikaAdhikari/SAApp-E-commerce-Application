class Triol {
    final String userNameOrEmailAddress;
    final String password;
    final String twoFactorVerificationCode;
    final bool rememberClient;
    final String twoFactorRememberClientToken;
    final bool singleSignIn;
    final String returnUrl;
    final String captchaResponse;

    Triol({
        required this.userNameOrEmailAddress,
        required this.password,
        required this.twoFactorVerificationCode,
        required this.rememberClient,
        required this.twoFactorRememberClientToken,
        required this.singleSignIn,
        required this.returnUrl,
        required this.captchaResponse,
    });

    factory Triol.fromJson(Map<String, dynamic> json) => Triol(
        userNameOrEmailAddress: json["userNameOrEmailAddress"],
        password: json["password"],
        twoFactorVerificationCode: json["twoFactorVerificationCode"],
        rememberClient: json["rememberClient"],
        twoFactorRememberClientToken: json["twoFactorRememberClientToken"],
        singleSignIn: json["singleSignIn"],
        returnUrl: json["returnUrl"],
        captchaResponse: json["captchaResponse"],
    );


}