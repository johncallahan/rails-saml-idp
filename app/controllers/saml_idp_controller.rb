class SamlIdpController < SamlIdp::IdpController

  def idp_authenticate(email, password)
    email == ENV["USER_EMAIL"] && password == ENV["PASSWORD"] ? true : nil
  end

  def idp_make_saml_response(user)
    encode_SAMLResponse(ENV["USER_EMAIL"])
  end

end
