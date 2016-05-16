## Create a manifest stub

Create the `cf-stub.yml` file with the following content:

```
---
director_uuid: {{ bosh status --uuid 2>/dev/null }}

networks:
- name: cf1
  type: manual
  subnets:
  - range: 10.0.16.0/24
    gateway: 10.0.16.1
    dns: [10.0.0.2]
    reserved: [10.0.16.1 - 10.0.16.10]
    static: [10.0.16.11 - 10.0.16.127]
    cloud_properties:
      subnet: {{ source deployment/vars && echo $cf_subnet_id }}
    security_groups:
    - cf_training_sg

- name: cf1_public
  type: manual
  subnets:
  - range: 10.0.0.0/24
    gateway: 10.0.0.1
    dns: [10.0.0.2]
    reserved: [10.0.0.1 - 10.0.0.10]
    cloud_properties:
      subnet: {{ source deployment/vars && echo $subnet_id }}
      security_groups:
      - training_sg
      - cf_training_sg

- name: elastic
  type: vip
  cloud_properties: {}

- name: cf2
  type: manual
  subnets: (( .networks.cf1.subnets ))

resource_pools:
- name: router_z1
  cloud_properties:
    elbs: []

jobs:
- name: ha_proxy_z1
  networks:
  - name: elastic
    static_ips: [{{ source deployment/vars && echo $cf_eip }}]
  - name: cf1_public
    default: [gateway, dns]
  properties:
    ha_proxy:
      ssl_pem: |
        -----BEGIN CERTIFICATE-----
        MIICJzCCAZACCQD7Xx+Rz/OzzzANBgkqhkiG9w0BAQUFADBYMQswCQYDVQQGEwJB
        VTETMBEGA1UECBMKU29tZS1TdGF0ZTEhMB8GA1UEChMYSW50ZXJuZXQgV2lkZ2l0
        cyBQdHkgTHRkMREwDwYDVQQDFAgqLnhpcC5pbzAeFw0xNjA0MDkxODM0MjBaFw0x
        NjA1MDkxODM0MjBaMFgxCzAJBgNVBAYTAkFVMRMwEQYDVQQIEwpTb21lLVN0YXRl
        MSEwHwYDVQQKExhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQxETAPBgNVBAMUCCou
        eGlwLmlvMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDsUsRMA0S8XK06iUpO
        vPnmFZr0R3SFRgTO3QQf+wKtU5xwUQETRGlPuFqnbEA9ElmUiIRySTb0gp79H/OH
        jY84YHwk/9+O/Bq79VIx/QLbPwstTL8ine4LRhJeK2lYseq47KwrqAR0b31VkYKs
        90AtGZRWlKF9yOCr2awl0SoZAwIDAQABMA0GCSqGSIb3DQEBBQUAA4GBAIkvRIwB
        oik7qcRZTMTzJH7uw2cu0tmh3LGFPybnuXwRfMKJMcPUAxt30a3/Xu/pVcWJGK+/
        JWBoqMzqx0+1X1tq+bAfeTbOx3LCUJp68ne/1Y4gDBiwrBu11pp7i6U9e1Vo/vmd
        FEW1b0+sM3/u+wD0iPhQaV3vFTi+gEQW3ehl
        -----END CERTIFICATE-----
        -----BEGIN RSA PRIVATE KEY-----
        MIICXQIBAAKBgQDsUsRMA0S8XK06iUpOvPnmFZr0R3SFRgTO3QQf+wKtU5xwUQET
        RGlPuFqnbEA9ElmUiIRySTb0gp79H/OHjY84YHwk/9+O/Bq79VIx/QLbPwstTL8i
        ne4LRhJeK2lYseq47KwrqAR0b31VkYKs90AtGZRWlKF9yOCr2awl0SoZAwIDAQAB
        AoGAO4YBUVAFcRg6vaK0564rl2tbsymITMU9EsmSb2eu3e9QWO3eQncZu22oz8Cx
        UXCcxY+5JHwSbnW0C/ePRFZAeyvM4EmhhKYf2q8bXavWXKm2H4UZVhbGVTySitEp
        ne/G9Rv/tbvpDMmRsPfP+1N1ym/glWOYH+dY1C/+7uoJ9oECQQD6k7nl9rmfxrvz
        AM7ocS1hqMuw/831T30kw0vwzOi1WNfoiBELIXszbUPRdsnV1qY4WRk3m7TgCDNO
        ixbi9mXBAkEA8XASCwowI0uY7JbySImrQhmsaxVubqRLDpfsqAB3WNj03inQtHKO
        froI8vJD0dIGdV50nh6fLyZsls4iqGZXwwJBANiUOLhoQVa1ShwmFbBYqlXftHb/
        EsA1/T96QbgXFAgyiyNj//8z6C2yAk0YtClMxwyrDh2/Sl3dGKOJmrV/LMECQQCk
        QDL2Mbsn9+EUa2hussHAmUi0HQNg4AJz7iVA8fg/iHGlxlrGt/x6+ELoTKqYzsI4
        DMdXXsu6vvA29Aud9uoTAkA33jpVzBvAdCIuj0V6x5amX5YJz08SWzAiLPAXHb2Y
        XEcMFaQVQihCuqCUpMxTzcHmIsYNXNTVydnIfD6lnTLn
        -----END RSA PRIVATE KEY-----

- name: postgres_z1
  instances: 1
  networks:
  - name: cf1
    static_ips: (( .properties.databases.address ))

properties:
  domain: {{ source deployment/vars && echo $cf_eip }}.xip.io

  ssl:
    skip_cert_verify: true

  nats:
    user: admin
    password: admin

  router:
    status:
      user: admin
      password: admin

  uaa:
    cc:
      client_secret: secret
    admin:
      client_secret: secret
    clients:
      cc_routing:
        secret: secret
      gorouter:
        secret: secret
      doppler:
        secret: secret
      login:
        secret: secret
      notifications:
        secret: secret
      cloud_controller_username_lookup:
        authorities: scim.userids
        authorized-grant-types: client_credentials
        secret: secret
      tcp_emitter:
        secret: secret
      tcp_router:
        secret: secret
    jwt:
      signing_key: |
        -----BEGIN RSA PRIVATE KEY-----
        MIICXAIBAAKBgQDHFr+KICms+tuT1OXJwhCUmR2dKVy7psa8xzElSyzqx7oJyfJ1
        JZyOzToj9T5SfTIq396agbHJWVfYphNahvZ/7uMXqHxf+ZH9BL1gk9Y6kCnbM5R6
        0gfwjyW1/dQPjOzn9N394zd2FJoFHwdq9Qs0wBugspULZVNRxq7veq/fzwIDAQAB
        AoGBAJ8dRTQFhIllbHx4GLbpTQsWXJ6w4hZvskJKCLM/o8R4n+0W45pQ1xEiYKdA
        Z/DRcnjltylRImBD8XuLL8iYOQSZXNMb1h3g5/UGbUXLmCgQLOUUlnYt34QOQm+0
        KvUqfMSFBbKMsYBAoQmNdTHBaz3dZa8ON9hh/f5TT8u0OWNRAkEA5opzsIXv+52J
        duc1VGyX3SwlxiE2dStW8wZqGiuLH142n6MKnkLU4ctNLiclw6BZePXFZYIK+AkE
        xQ+k16je5QJBAN0TIKMPWIbbHVr5rkdUqOyezlFFWYOwnMmw/BKa1d3zp54VP/P8
        +5aQ2d4sMoKEOfdWH7UqMe3FszfYFvSu5KMCQFMYeFaaEEP7Jn8rGzfQ5HQd44ek
        lQJqmq6CE2BXbY/i34FuvPcKU70HEEygY6Y9d8J3o6zQ0K9SYNu+pcXt4lkCQA3h
        jJQQe5uEGJTExqed7jllQ0khFJzLMx0K6tj0NeeIzAaGCQz13oo2sCdeGRHO4aDh
        HH6Qlq/6UOV5wP8+GAcCQFgRCcB+hrje8hfEEefHcFpyKH+5g1Eu1k0mLrxK2zd+
        4SlotYRHgPCEubokb2S1zfZDWIXW3HmggnGgM949TlY=
        -----END RSA PRIVATE KEY-----
      verification_key: |
        -----BEGIN PUBLIC KEY-----
        MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDHFr+KICms+tuT1OXJwhCUmR2d
        KVy7psa8xzElSyzqx7oJyfJ1JZyOzToj9T5SfTIq396agbHJWVfYphNahvZ/7uMX
        qHxf+ZH9BL1gk9Y6kCnbM5R60gfwjyW1/dQPjOzn9N394zd2FJoFHwdq9Qs0wBug
        spULZVNRxq7veq/fzwIDAQAB
        -----END PUBLIC KEY-----

    scim:
      users:
      - admin|admin|scim.write,scim.read,openid,cloud_controller.admin,doppler.firehose,routing.router_groups.read

  loggregator_endpoint:
    shared_secret: secret

  cc:
    db_encryption_key: key
    bulk_api_password: password
    staging_upload_user: admin
    staging_upload_password: admin
    internal_api_password: admin

  uaadb:
    address: (( .properties.databases.address ))
    databases:
    - name: uaadb
      tag: uaa
    db_scheme: postgresql
    port: (( .properties.databases.port ))
    roles:
    - name: uaaadmin
      password: admin
      tag: admin

  ccdb:
    address: (( .properties.databases.address ))
    databases:
    - name: ccdb
      tag: cc
    db_scheme: postgres
    port: (( .properties.databases.port ))
    roles:
    - name: ccadmin
      password: admin
      tag: admin

  consul:
    encrypt_keys:
    - admin
    agent_cert: |
      -----BEGIN CERTIFICATE-----
      MIIEJjCCAg6gAwIBAgIRAMaJ7g1qfTKgSZJZn/mpXVcwDQYJKoZIhvcNAQELBQAw
      EzERMA8GA1UEAxMIY29uc3VsQ0EwHhcNMTYwNDA5MTgzNTMwWhcNMTgwNDA5MTgz
      NTMwWjAXMRUwEwYDVQQDEwxjb25zdWwgYWdlbnQwggEiMA0GCSqGSIb3DQEBAQUA
      A4IBDwAwggEKAoIBAQDMGtOscMMue5XVTJn/7LDn509X2iImA1rNEtxrIHYBI6Sr
      Bw510dB5pHNqKsuBbfGKRksO9dTnNK3SWWHVm7ExZQfxIh1Gs9qx2hu3csPGM+LD
      rCaROYmkCD/NsDs+2eBWILbiNruZ5RA8YTEmxxChxCLjbDaj6QEjrL8skHHcyWSy
      Q6u3y3HWjT/yj1AeZh2KJzTpMvFAvyP6lEQgpex/H4IhuqFNqQBNEQzdz30o0wAF
      DUaWKMxhIfJk8pejFaBA38pQcyTYfmUcBKGSvuwQngJ1BATY98Q1MHM/bePBTx75
      Djj50FKfutlhK0GMsb3nPzN+1ljaoEIRINAPkGPtAgMBAAGjcTBvMA4GA1UdDwEB
      /wQEAwIDuDAdBgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIwHQYDVR0OBBYE
      FORpw43ZY5vRQg6N7qGGKHcpzXiRMB8GA1UdIwQYMBaAFF/Pza9U+q+wVTaFp1LV
      +enbraHlMA0GCSqGSIb3DQEBCwUAA4ICAQBSiJ8ytKLEWFN2G2C3uqvS1o0t9DSS
      Xj997Q6GXfy1mzS75c6rk9pdCiENLC/qVPUJVIbWYNi+qOeB3OH2K2k7V4eFq/rg
      U3CkuTHABBGgfDKEflV8x0MzzJJwJV65X81iwC6dCw9L52/q8KrjdK6ACbp+9ANM
      h5+FYwStPNYwPXBdT9bAvMH0L12KqkCDA0o2jsVjXgQZ1Xoqz8gJdeD5lokY9/fD
      5rL11whhkgmXavZluS8fa0hbtjDRWx+cIo4h1Kb6zHZL+EmumJ/r5HV6BI3AZPwm
      vCsQ4tkA46+hFhNIHzyf3McxgNwP8e8rGQWdVZiYEdxnhVDHxTFruOOsn19OC1h+
      yFO62uPQNFZ8TLp/k1Yp3mg43YXKv/qBnlUu0L9MUonnI7LUSVhzdA9Tny+kZuwj
      y7hoAyhR2rrUBbMRDGY9dNSGzlZDrj3/ykcOQNRWbbM/FmewGW46ZmhHaDKBKaA8
      odAiloG4fhj96mgSJ916RZ33CcUqF0r8oFBDve+ZMrrDz0Ye6GyPTWLvXsoDcZLG
      Fkif8V7BhJoevuiKcKhqMlaIyLJXkvHtQmZGb53DPozLd9V21TMPmcj3hIOznV9p
      SJJ53rPjWHA0bPGeBBWueSLQEN/wCVbpb0oJZmSdv2vlZW1tm+P6bk/3Pp4dRZOD
      BTb7cZR3dGjqFA==
      -----END CERTIFICATE-----
    agent_key: |
      -----BEGIN RSA PRIVATE KEY-----
      MIIEowIBAAKCAQEAzBrTrHDDLnuV1UyZ/+yw5+dPV9oiJgNazRLcayB2ASOkqwcO
      ddHQeaRzairLgW3xikZLDvXU5zSt0llh1ZuxMWUH8SIdRrPasdobt3LDxjPiw6wm
      kTmJpAg/zbA7PtngViC24ja7meUQPGExJscQocQi42w2o+kBI6y/LJBx3MlkskOr
      t8tx1o0/8o9QHmYdiic06TLxQL8j+pREIKXsfx+CIbqhTakATREM3c99KNMABQ1G
      lijMYSHyZPKXoxWgQN/KUHMk2H5lHAShkr7sEJ4CdQQE2PfENTBzP23jwU8e+Q44
      +dBSn7rZYStBjLG95z8zftZY2qBCESDQD5Bj7QIDAQABAoIBAA7ztCgAxrukABD1
      IJ739um2L0DPUQsZ2dAGHrGWWi6xLsH8rVmCOlR+8JmJcwkTRcuMZLk+1w7s9ALh
      22Hrmup0bUWD60Mfr9ixkrA4rxDZAja1aMngvi2PESV/UIfFLEMC+ILP4aRffHX/
      5LrjgFtpY+jnJ4WQby3u3L5mAoFa+g/GsGe3bb6+/mm7Vqfv27ybUnFgVOpNjN+7
      eS4ry7PsRjiK+tyC+ttNB7qLeCruCjtlfLp5aL5ytzF4rjP4jtw2DXGpdqqqqnXE
      B2ZM2V+0Pi2QSGKmQASaWeridA5vsiTmxQYxujq0ZpqHwsoUN8wxroTofRgB7NWB
      2DeBYZ0CgYEA4SBYj+Z+E2B6V38Wa+VIfU3hu8MNw1DK23nQqLODPJwiuuEvtRkv
      YdhZO87R/a/RCMN9f1TBfXuX5opD4vCg6KCkEY7l3W/+sxvol/vBaOw6YCvsmPcB
      YIK5DQU+O9DpvjwNLkCFZ1aK1YvLAnpkj4LYtTkiTmoxznfvZypJis8CgYEA6Bh2
      slMY7bqNs1tUnJi/lTnsDJnd0ZpLPglpEhZUBE+NfLenYAxHUQRfx7JOPj0CVJmc
      kaswAFxREGBr2214Pt0GeJ/pFRCozMxqCf+zrantsQNEpDHOJh4oWRjyVq6OZ7EQ
      gmF78/RRfCHSEoCtmClY26lPDGK6BIFSYKpS5IMCgYAPcNeCLy3wiEp729Se2+AH
      8CKObUdxYQY43XcJSx6yNodPSAispCiSznL4Xiwa+UceEcJ2zEplH+gAQPV9CEIR
      EouORL3RXVAb2ssuOW8/kgxC8mBM8YwfoXetw/FLyv1tNdM1m+lKeC4XjXoEFn71
      NOVGMMAAntoBrko2Sjk3EwKBgQCm7fFxEJM9aI/CEE4q0zH4AlDkP0ZrGq5DUEFh
      4O1MrGr26KBZVHt2qc65smTUHs0uS81wd89ucvda7/6jM3jovc+JsnnRzMmbgupB
      hseUgEOUrOURs0Cx6b7bVjX2YlXJ/nABVlvweiihPzH4XNR+PD7Mvlk8b0WbN+gn
      3lkAQQKBgF7g716ueDiFYJpexugfriHA0lB5GU03ij4wn34ErC+5SEFIQwxkDdcn
      yDjQwpq/gWjlCbhKZeGcVJcxrZPfwtx82p0Y3N/uW7yveTpFSMm6lSvhjsS9wASu
      Uj8QyL65vViO1IyocLkZZwvJL2pwkLciYgyPluR09PIG7z6vMRyH
      -----END RSA PRIVATE KEY-----
    ca_cert: |
      -----BEGIN CERTIFICATE-----
      MIIFBzCCAu+gAwIBAgIBATANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDEwhjb25z
      dWxDQTAeFw0xNjA0MDkxODM1MjhaFw0yNjA0MDkxODM1MjlaMBMxETAPBgNVBAMT
      CGNvbnN1bENBMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAzGDp2KDi
      bd6Gy0mKff3IBBdpc6QaDDPjI7MopLbFFkC4R98KC9QC+AQV737O+6jARIh8LAFV
      MUoYeSSEo4MMxNUBSMY7yqerctjEDOpt5xBDWrLV8pOHkX5MuuYJHsCmbqYg4d7+
      kIyj2MFyrJ4kvOFOkBilX336NxKYOSHytOM5K58GS5iRiMcqXp0o+Rt8+qrJhgRh
      14kM3jMo/2e3Y0VwZlIoCU1k+mfsMjp/5cmgCLnbhIfasu4euHMJGYkOmWrDQcW5
      Fv3i+oj9VYGmvD8g9U/9ImAczUCny5axqSIB3a+tMXQJWya3qGl6ucN21iF+DT6N
      mlG2VwqE13eRqECts/MTwQbTKZEKxI2HPErk4eY+IYzbsJfjJF6jU5vTrEKQqJrG
      jpsil1EI05B8cxisQirTNq5LBiQBrjx9tRiYmubFseL2ww3fhihgkBVcq2Aga0/c
      ne6ppYLomunF8Gj6PdbPTQzwPs9syuKs7Ks3BXS2wagyQWLyFUKDCdaV62u0I528
      U+F+a1hxntDCG8aMBJnsCdfB+t/d8W1jbIo3b5VgisRoO93H+7jwuEQ7UnGlxEws
      X6WKLGsnfm0ixO08GxVcITXGE+UrvSiebKAwOQYhDTkwvtruTKBrxMqhC6z25OLS
      a0alt7pAr6a7zqiVDGAvqSPYfFek///p0EcCAwEAAaNmMGQwDgYDVR0PAQH/BAQD
      AgEGMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFF/Pza9U+q+wVTaFp1LV
      +enbraHlMB8GA1UdIwQYMBaAFF/Pza9U+q+wVTaFp1LV+enbraHlMA0GCSqGSIb3
      DQEBCwUAA4ICAQBgxfhnZLADE1zvUVKvH3sjuclX5NvG843YjBrdyzlNnMcRRLVR
      EtBfoVWNNvFVdCNnLeWSWjCrCF8hoUuM+2w14KKWf33TMHKBPhdREDYJcgNtfW54
      y4SytIEFrIgWXjJ5MhJXEC2spKRaYCjAxwW1sdshDZFPB17EcmVEFwc+qYREzRxX
      cZ56NcUwgZ2+10rQeB6qyRVtI/hH3fe5ssiWb6jcpA6DDh5MQlecDJj2XQJt1M8q
      h/C+KRC6pb93V+2sO+4xf3kM6Kw04DziM65W1ejFRaS9Nm/LKJFSsBQg7gHHahjQ
      qK786zlyGsdzUrPDLmjz/yNwvnlNj1car+QUbDdmMow/EuTELaj5xvG2u9FW9GXH
      XXEPAxMCLmtdULD4iU+EG2IZv3v6w7ZP0A9fMGWivUxiY1WxoYgvx/2L9E5AmVLa
      BAhi2Keo2+QYMormrtMSCnOD/pAleZb30iqJuy87AOnNHHX2xbtoyuX8aAPKmUL3
      l7MpzbmUdsxY3Kmk83Wuwzi3fWTG3Spf5/qP9tIP6zr6GUcxCi9UfY/eu+TA77Ey
      mwjgHqxwTkDx57sihkF1ilzscqbr27PJ+eyMmMATM+5dxN1Y+mV7gH+26SUkvXGK
      GmnPujQfU8maoHtI7zmT1Cf9sMYakGBTVJBnbpQO+bRAsTBV3NQoiQCJEw==
      -----END CERTIFICATE-----
    server_cert: |
      -----BEGIN CERTIFICATE-----
      MIIEMDCCAhigAwIBAgIRAK/TQtsbEQRPBH5/6GVpxgMwDQYJKoZIhvcNAQELBQAw
      EzERMA8GA1UEAxMIY29uc3VsQ0EwHhcNMTYwNDA5MTgzNTMwWhcNMTgwNDA5MTgz
      NTMwWjAhMR8wHQYDVQQDExZzZXJ2ZXIuZGMxLmNmLmludGVybmFsMIIBIjANBgkq
      hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1SS5Ak5NijU2szVf8qzheH2WdfVY8K0N
      u0McvUrshMU39phwgZ/apUrCc0jKWYKneHJNFggN/U7Il6P4UPtALo82RWmUtreC
      pYDTze0LWWW00VwLzD5qEuhXbKy1zEYJ0C7Z6v4fXKaD1kIVaXgpyPKFE+LPlo3G
      ZWHLe73+9tVvTGlaIA0Lg1i4apnwCErYnZ0AGzrZ+GWHXrLTA8/GUBf8iQpArwVN
      zSne02cAwIns7t3AezriSgy7QR3mCSDRauTJiXNK7WrTmoC0TVRqWYi9cgyLujHP
      Tb9PiGR0q6L4GbO+iqYM+ht3V4Li8oWXK9KMaf0HR9fxs0sPE6Sg2wIDAQABo3Ew
      bzAOBgNVHQ8BAf8EBAMCA7gwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMC
      MB0GA1UdDgQWBBRBv5OTPI8iQubKIjMrjAi/0/zaAjAfBgNVHSMEGDAWgBRfz82v
      VPqvsFU2hadS1fnp262h5TANBgkqhkiG9w0BAQsFAAOCAgEAxC62kaJftRECwJFr
      bsGvt9uDE7myvqbTL3iwt9/+tJC8ypLhwT2+c+796lq4yjYgsEUUtQoG26LdDUh5
      +5TBFL/HRrEi3noLDytm0WvVz/r1Uxe7tgRjrvhvvEss0e/sbwxVTmVJLAQrCRJc
      RcqS4VIx8HXaC4XLwA7ZG8csglOcN/+ptLmBotZmLtjDI0VrBGGE2wK5Frq0gFAf
      fUKppTiS/GKQXxGQe3mRtAFFz23NZRMDIDpRJ5jM4SDNTrwXccVoPnQBRL5mtKCo
      n79fdlV4PUbxIdpgbEwHCRZk/GY9hOpkArhtH+Upty+Rynws3Odc8Lxwl/BrxXWT
      BdJgH5ADIx0YzTGWe14/jhZRB6YahicdwwXRumhf0GNxAchrQ2C607sweSf7/4s/
      59TNT5N3kDu2nlddQJfRgb3HEQ4fJrE5kspgTq2qN1QA55go76bDffopk0TV70Iz
      q0W8VsiDy+ACc3m7i8uR5xAQ0ieLgAsGSwHptv5xLzrw4tfbN0iqT2rN5umgrEcp
      No8rbwIAT7QMSMdUT+RTZrZInlTf2Pd7vZEX+SLO4hjWCgvwE207IMexjLmwGB1U
      lI7so0wQjJF8WdM2yM6xhpTyEzGkuGNKDyJyawwa1NlRfH6qWnQonBtowmo+ZH5N
      Ctxb1Y82WSPE4T9EhxpIxuR01zk=
      -----END CERTIFICATE-----
    server_key: |
      -----BEGIN RSA PRIVATE KEY-----
      MIIEowIBAAKCAQEA1SS5Ak5NijU2szVf8qzheH2WdfVY8K0Nu0McvUrshMU39phw
      gZ/apUrCc0jKWYKneHJNFggN/U7Il6P4UPtALo82RWmUtreCpYDTze0LWWW00VwL
      zD5qEuhXbKy1zEYJ0C7Z6v4fXKaD1kIVaXgpyPKFE+LPlo3GZWHLe73+9tVvTGla
      IA0Lg1i4apnwCErYnZ0AGzrZ+GWHXrLTA8/GUBf8iQpArwVNzSne02cAwIns7t3A
      ezriSgy7QR3mCSDRauTJiXNK7WrTmoC0TVRqWYi9cgyLujHPTb9PiGR0q6L4GbO+
      iqYM+ht3V4Li8oWXK9KMaf0HR9fxs0sPE6Sg2wIDAQABAoIBABam6XaiRcFbeG3B
      TWooD2pTxorQwVwKuDvfnQ1NCifuIc12U/aiu4T3lgTUhpTOuuelFiYyQvJZzh23
      kmtg2GhaVgU4fFKS3DKkp13qRFuC4J2jb6mMNI+/25K0JDoKc36JjCVaTpD1LWu2
      6DmmSKKPi68aWr+AX8Zkh1CmV5N517Q1CFXfh/Wfonj24XeOx38AQUUbp0E3xnVf
      NCFj8rVjQHe1AlqTZQ4wRCuTLYgEa6xRXVNoNldMzAzr9q7SU2aPs3BFr6MdGmoc
      Z88LPs5Cn2QzJCZkdImMqpOIqDrF8OYF8tOYsAgrbS98JXCzEEoIOHnTLQ0infkL
      Ex1IOSECgYEA242SmKUaD0ps1XnoPKeKJ4EJjs94fZKkXnKB9jPxx44A+rdEqMqM
      BQYHN7hBB/1qXMNuyP+FvZW88vPVP4eIeNQUQsvU9CqGkvwJyXddKloxbCYl/nQ2
      XHKefjHRt+7OsNB74Vfw2TvA5ChaIXOvJQyEaCjknEx6pfTFQV1A8SsCgYEA+IbC
      mA+EwzWXdMyyo/Yd5qwKaMFg8kDQf6jUvExte9xMO+TnXn8Ae8XM48IKeZT/TbBp
      k6ocETSLpM6DuwYGFsPDLyduokz0JePdbjgZqIwicIuBGDmloLnuRlKYVS6wyPWt
      4/pOcr9K53eXbbMC9O434tQONForFZRc2judVxECgYBheTEkY+h18WzwOfdJNni3
      oSpFJQcxePFQnTXlwJoPJpR4uvTYm1QextZdfoggq/mUxY9h3U/bI6eHlYmPcvS7
      8Cwum6An5tloWE1gDIZoTzKx+R3VInMgCCMlk6iwKG3LQkQ9f3WGfGje4qthPqL7
      p9sBA2a7nZi2JT2OD4DNkQKBgQC8+2R/0tUmx9rK01lIOr/UB6DGtb3tmQGzAYP7
      R7a9R/CkXtTdU3/fnrLFwmjKuVVGE07FHcbIAofpo6wiDFuW9fe3JKoJOrExGsvn
      oztHooARytM4w6VBygD5cpcptx5xQfif8lezA+mGh7cbkNM/wuG2V4ARqTs35qCQ
      xmJHsQKBgC1dz5VwndxoKTsY8VO+cAboJG1e5CjhT1xmCFxx5JADUrlbE9MY/i/4
      5PtV+cxCkKkdcle2qyK4XwW3VHNWChIreHmcRyJJ5L7dg1Sp31GDBbZgWwSl68J7
      MiyAqalHKtBqXkZwAlI+fdra0OrtmSX+VAYSEXJVCozv+r/DaAvk
      -----END RSA PRIVATE KEY-----

  databases:
    additional_config: null
    address: 10.0.16.101
    collect_statement_statistics: null
    databases:
    - citext: true
      name: ccdb
      tag: cc
    - citext: true
      name: uaadb
      tag: uaa
    db_scheme: postgres
    port: 5524
    roles:
    - name: ccadmin
      password: admin
      tag: admin
    - name: uaaadmin
      password: admin
      tag: admin

  hm9000:
    client_cert: |
      -----BEGIN CERTIFICATE-----
      MIIEJjCCAg6gAwIBAgIRAMaJ7g1qfTKgSZJZn/mpXVcwDQYJKoZIhvcNAQELBQAw
      EzERMA8GA1UEAxMIY29uc3VsQ0EwHhcNMTYwNDA5MTgzNTMwWhcNMTgwNDA5MTgz
      NTMwWjAXMRUwEwYDVQQDEwxjb25zdWwgYWdlbnQwggEiMA0GCSqGSIb3DQEBAQUA
      A4IBDwAwggEKAoIBAQDMGtOscMMue5XVTJn/7LDn509X2iImA1rNEtxrIHYBI6Sr
      Bw510dB5pHNqKsuBbfGKRksO9dTnNK3SWWHVm7ExZQfxIh1Gs9qx2hu3csPGM+LD
      rCaROYmkCD/NsDs+2eBWILbiNruZ5RA8YTEmxxChxCLjbDaj6QEjrL8skHHcyWSy
      Q6u3y3HWjT/yj1AeZh2KJzTpMvFAvyP6lEQgpex/H4IhuqFNqQBNEQzdz30o0wAF
      DUaWKMxhIfJk8pejFaBA38pQcyTYfmUcBKGSvuwQngJ1BATY98Q1MHM/bePBTx75
      Djj50FKfutlhK0GMsb3nPzN+1ljaoEIRINAPkGPtAgMBAAGjcTBvMA4GA1UdDwEB
      /wQEAwIDuDAdBgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIwHQYDVR0OBBYE
      FORpw43ZY5vRQg6N7qGGKHcpzXiRMB8GA1UdIwQYMBaAFF/Pza9U+q+wVTaFp1LV
      +enbraHlMA0GCSqGSIb3DQEBCwUAA4ICAQBSiJ8ytKLEWFN2G2C3uqvS1o0t9DSS
      Xj997Q6GXfy1mzS75c6rk9pdCiENLC/qVPUJVIbWYNi+qOeB3OH2K2k7V4eFq/rg
      U3CkuTHABBGgfDKEflV8x0MzzJJwJV65X81iwC6dCw9L52/q8KrjdK6ACbp+9ANM
      h5+FYwStPNYwPXBdT9bAvMH0L12KqkCDA0o2jsVjXgQZ1Xoqz8gJdeD5lokY9/fD
      5rL11whhkgmXavZluS8fa0hbtjDRWx+cIo4h1Kb6zHZL+EmumJ/r5HV6BI3AZPwm
      vCsQ4tkA46+hFhNIHzyf3McxgNwP8e8rGQWdVZiYEdxnhVDHxTFruOOsn19OC1h+
      yFO62uPQNFZ8TLp/k1Yp3mg43YXKv/qBnlUu0L9MUonnI7LUSVhzdA9Tny+kZuwj
      y7hoAyhR2rrUBbMRDGY9dNSGzlZDrj3/ykcOQNRWbbM/FmewGW46ZmhHaDKBKaA8
      odAiloG4fhj96mgSJ916RZ33CcUqF0r8oFBDve+ZMrrDz0Ye6GyPTWLvXsoDcZLG
      Fkif8V7BhJoevuiKcKhqMlaIyLJXkvHtQmZGb53DPozLd9V21TMPmcj3hIOznV9p
      SJJ53rPjWHA0bPGeBBWueSLQEN/wCVbpb0oJZmSdv2vlZW1tm+P6bk/3Pp4dRZOD
      BTb7cZR3dGjqFA==
      -----END CERTIFICATE-----
    client_key: |
      -----BEGIN RSA PRIVATE KEY-----
      MIIEowIBAAKCAQEAzBrTrHDDLnuV1UyZ/+yw5+dPV9oiJgNazRLcayB2ASOkqwcO
      ddHQeaRzairLgW3xikZLDvXU5zSt0llh1ZuxMWUH8SIdRrPasdobt3LDxjPiw6wm
      kTmJpAg/zbA7PtngViC24ja7meUQPGExJscQocQi42w2o+kBI6y/LJBx3MlkskOr
      t8tx1o0/8o9QHmYdiic06TLxQL8j+pREIKXsfx+CIbqhTakATREM3c99KNMABQ1G
      lijMYSHyZPKXoxWgQN/KUHMk2H5lHAShkr7sEJ4CdQQE2PfENTBzP23jwU8e+Q44
      +dBSn7rZYStBjLG95z8zftZY2qBCESDQD5Bj7QIDAQABAoIBAA7ztCgAxrukABD1
      IJ739um2L0DPUQsZ2dAGHrGWWi6xLsH8rVmCOlR+8JmJcwkTRcuMZLk+1w7s9ALh
      22Hrmup0bUWD60Mfr9ixkrA4rxDZAja1aMngvi2PESV/UIfFLEMC+ILP4aRffHX/
      5LrjgFtpY+jnJ4WQby3u3L5mAoFa+g/GsGe3bb6+/mm7Vqfv27ybUnFgVOpNjN+7
      eS4ry7PsRjiK+tyC+ttNB7qLeCruCjtlfLp5aL5ytzF4rjP4jtw2DXGpdqqqqnXE
      B2ZM2V+0Pi2QSGKmQASaWeridA5vsiTmxQYxujq0ZpqHwsoUN8wxroTofRgB7NWB
      2DeBYZ0CgYEA4SBYj+Z+E2B6V38Wa+VIfU3hu8MNw1DK23nQqLODPJwiuuEvtRkv
      YdhZO87R/a/RCMN9f1TBfXuX5opD4vCg6KCkEY7l3W/+sxvol/vBaOw6YCvsmPcB
      YIK5DQU+O9DpvjwNLkCFZ1aK1YvLAnpkj4LYtTkiTmoxznfvZypJis8CgYEA6Bh2
      slMY7bqNs1tUnJi/lTnsDJnd0ZpLPglpEhZUBE+NfLenYAxHUQRfx7JOPj0CVJmc
      kaswAFxREGBr2214Pt0GeJ/pFRCozMxqCf+zrantsQNEpDHOJh4oWRjyVq6OZ7EQ
      gmF78/RRfCHSEoCtmClY26lPDGK6BIFSYKpS5IMCgYAPcNeCLy3wiEp729Se2+AH
      8CKObUdxYQY43XcJSx6yNodPSAispCiSznL4Xiwa+UceEcJ2zEplH+gAQPV9CEIR
      EouORL3RXVAb2ssuOW8/kgxC8mBM8YwfoXetw/FLyv1tNdM1m+lKeC4XjXoEFn71
      NOVGMMAAntoBrko2Sjk3EwKBgQCm7fFxEJM9aI/CEE4q0zH4AlDkP0ZrGq5DUEFh
      4O1MrGr26KBZVHt2qc65smTUHs0uS81wd89ucvda7/6jM3jovc+JsnnRzMmbgupB
      hseUgEOUrOURs0Cx6b7bVjX2YlXJ/nABVlvweiihPzH4XNR+PD7Mvlk8b0WbN+gn
      3lkAQQKBgF7g716ueDiFYJpexugfriHA0lB5GU03ij4wn34ErC+5SEFIQwxkDdcn
      yDjQwpq/gWjlCbhKZeGcVJcxrZPfwtx82p0Y3N/uW7yveTpFSMm6lSvhjsS9wASu
      Uj8QyL65vViO1IyocLkZZwvJL2pwkLciYgyPluR09PIG7z6vMRyH
      -----END RSA PRIVATE KEY-----
    ca_cert: |
      -----BEGIN CERTIFICATE-----
      MIIFBzCCAu+gAwIBAgIBATANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDEwhjb25z
      dWxDQTAeFw0xNjA0MDkxODM1MjhaFw0yNjA0MDkxODM1MjlaMBMxETAPBgNVBAMT
      CGNvbnN1bENBMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAzGDp2KDi
      bd6Gy0mKff3IBBdpc6QaDDPjI7MopLbFFkC4R98KC9QC+AQV737O+6jARIh8LAFV
      MUoYeSSEo4MMxNUBSMY7yqerctjEDOpt5xBDWrLV8pOHkX5MuuYJHsCmbqYg4d7+
      kIyj2MFyrJ4kvOFOkBilX336NxKYOSHytOM5K58GS5iRiMcqXp0o+Rt8+qrJhgRh
      14kM3jMo/2e3Y0VwZlIoCU1k+mfsMjp/5cmgCLnbhIfasu4euHMJGYkOmWrDQcW5
      Fv3i+oj9VYGmvD8g9U/9ImAczUCny5axqSIB3a+tMXQJWya3qGl6ucN21iF+DT6N
      mlG2VwqE13eRqECts/MTwQbTKZEKxI2HPErk4eY+IYzbsJfjJF6jU5vTrEKQqJrG
      jpsil1EI05B8cxisQirTNq5LBiQBrjx9tRiYmubFseL2ww3fhihgkBVcq2Aga0/c
      ne6ppYLomunF8Gj6PdbPTQzwPs9syuKs7Ks3BXS2wagyQWLyFUKDCdaV62u0I528
      U+F+a1hxntDCG8aMBJnsCdfB+t/d8W1jbIo3b5VgisRoO93H+7jwuEQ7UnGlxEws
      X6WKLGsnfm0ixO08GxVcITXGE+UrvSiebKAwOQYhDTkwvtruTKBrxMqhC6z25OLS
      a0alt7pAr6a7zqiVDGAvqSPYfFek///p0EcCAwEAAaNmMGQwDgYDVR0PAQH/BAQD
      AgEGMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFF/Pza9U+q+wVTaFp1LV
      +enbraHlMB8GA1UdIwQYMBaAFF/Pza9U+q+wVTaFp1LV+enbraHlMA0GCSqGSIb3
      DQEBCwUAA4ICAQBgxfhnZLADE1zvUVKvH3sjuclX5NvG843YjBrdyzlNnMcRRLVR
      EtBfoVWNNvFVdCNnLeWSWjCrCF8hoUuM+2w14KKWf33TMHKBPhdREDYJcgNtfW54
      y4SytIEFrIgWXjJ5MhJXEC2spKRaYCjAxwW1sdshDZFPB17EcmVEFwc+qYREzRxX
      cZ56NcUwgZ2+10rQeB6qyRVtI/hH3fe5ssiWb6jcpA6DDh5MQlecDJj2XQJt1M8q
      h/C+KRC6pb93V+2sO+4xf3kM6Kw04DziM65W1ejFRaS9Nm/LKJFSsBQg7gHHahjQ
      qK786zlyGsdzUrPDLmjz/yNwvnlNj1car+QUbDdmMow/EuTELaj5xvG2u9FW9GXH
      XXEPAxMCLmtdULD4iU+EG2IZv3v6w7ZP0A9fMGWivUxiY1WxoYgvx/2L9E5AmVLa
      BAhi2Keo2+QYMormrtMSCnOD/pAleZb30iqJuy87AOnNHHX2xbtoyuX8aAPKmUL3
      l7MpzbmUdsxY3Kmk83Wuwzi3fWTG3Spf5/qP9tIP6zr6GUcxCi9UfY/eu+TA77Ey
      mwjgHqxwTkDx57sihkF1ilzscqbr27PJ+eyMmMATM+5dxN1Y+mV7gH+26SUkvXGK
      GmnPujQfU8maoHtI7zmT1Cf9sMYakGBTVJBnbpQO+bRAsTBV3NQoiQCJEw==
      -----END CERTIFICATE-----
    server_cert: |
      -----BEGIN CERTIFICATE-----
      MIIEMDCCAhigAwIBAgIRAK/TQtsbEQRPBH5/6GVpxgMwDQYJKoZIhvcNAQELBQAw
      EzERMA8GA1UEAxMIY29uc3VsQ0EwHhcNMTYwNDA5MTgzNTMwWhcNMTgwNDA5MTgz
      NTMwWjAhMR8wHQYDVQQDExZzZXJ2ZXIuZGMxLmNmLmludGVybmFsMIIBIjANBgkq
      hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1SS5Ak5NijU2szVf8qzheH2WdfVY8K0N
      u0McvUrshMU39phwgZ/apUrCc0jKWYKneHJNFggN/U7Il6P4UPtALo82RWmUtreC
      pYDTze0LWWW00VwLzD5qEuhXbKy1zEYJ0C7Z6v4fXKaD1kIVaXgpyPKFE+LPlo3G
      ZWHLe73+9tVvTGlaIA0Lg1i4apnwCErYnZ0AGzrZ+GWHXrLTA8/GUBf8iQpArwVN
      zSne02cAwIns7t3AezriSgy7QR3mCSDRauTJiXNK7WrTmoC0TVRqWYi9cgyLujHP
      Tb9PiGR0q6L4GbO+iqYM+ht3V4Li8oWXK9KMaf0HR9fxs0sPE6Sg2wIDAQABo3Ew
      bzAOBgNVHQ8BAf8EBAMCA7gwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMC
      MB0GA1UdDgQWBBRBv5OTPI8iQubKIjMrjAi/0/zaAjAfBgNVHSMEGDAWgBRfz82v
      VPqvsFU2hadS1fnp262h5TANBgkqhkiG9w0BAQsFAAOCAgEAxC62kaJftRECwJFr
      bsGvt9uDE7myvqbTL3iwt9/+tJC8ypLhwT2+c+796lq4yjYgsEUUtQoG26LdDUh5
      +5TBFL/HRrEi3noLDytm0WvVz/r1Uxe7tgRjrvhvvEss0e/sbwxVTmVJLAQrCRJc
      RcqS4VIx8HXaC4XLwA7ZG8csglOcN/+ptLmBotZmLtjDI0VrBGGE2wK5Frq0gFAf
      fUKppTiS/GKQXxGQe3mRtAFFz23NZRMDIDpRJ5jM4SDNTrwXccVoPnQBRL5mtKCo
      n79fdlV4PUbxIdpgbEwHCRZk/GY9hOpkArhtH+Upty+Rynws3Odc8Lxwl/BrxXWT
      BdJgH5ADIx0YzTGWe14/jhZRB6YahicdwwXRumhf0GNxAchrQ2C607sweSf7/4s/
      59TNT5N3kDu2nlddQJfRgb3HEQ4fJrE5kspgTq2qN1QA55go76bDffopk0TV70Iz
      q0W8VsiDy+ACc3m7i8uR5xAQ0ieLgAsGSwHptv5xLzrw4tfbN0iqT2rN5umgrEcp
      No8rbwIAT7QMSMdUT+RTZrZInlTf2Pd7vZEX+SLO4hjWCgvwE207IMexjLmwGB1U
      lI7so0wQjJF8WdM2yM6xhpTyEzGkuGNKDyJyawwa1NlRfH6qWnQonBtowmo+ZH5N
      Ctxb1Y82WSPE4T9EhxpIxuR01zk=
      -----END CERTIFICATE-----
    server_key: |
      -----BEGIN RSA PRIVATE KEY-----
      MIIEowIBAAKCAQEA1SS5Ak5NijU2szVf8qzheH2WdfVY8K0Nu0McvUrshMU39phw
      gZ/apUrCc0jKWYKneHJNFggN/U7Il6P4UPtALo82RWmUtreCpYDTze0LWWW00VwL
      zD5qEuhXbKy1zEYJ0C7Z6v4fXKaD1kIVaXgpyPKFE+LPlo3GZWHLe73+9tVvTGla
      IA0Lg1i4apnwCErYnZ0AGzrZ+GWHXrLTA8/GUBf8iQpArwVNzSne02cAwIns7t3A
      ezriSgy7QR3mCSDRauTJiXNK7WrTmoC0TVRqWYi9cgyLujHPTb9PiGR0q6L4GbO+
      iqYM+ht3V4Li8oWXK9KMaf0HR9fxs0sPE6Sg2wIDAQABAoIBABam6XaiRcFbeG3B
      TWooD2pTxorQwVwKuDvfnQ1NCifuIc12U/aiu4T3lgTUhpTOuuelFiYyQvJZzh23
      kmtg2GhaVgU4fFKS3DKkp13qRFuC4J2jb6mMNI+/25K0JDoKc36JjCVaTpD1LWu2
      6DmmSKKPi68aWr+AX8Zkh1CmV5N517Q1CFXfh/Wfonj24XeOx38AQUUbp0E3xnVf
      NCFj8rVjQHe1AlqTZQ4wRCuTLYgEa6xRXVNoNldMzAzr9q7SU2aPs3BFr6MdGmoc
      Z88LPs5Cn2QzJCZkdImMqpOIqDrF8OYF8tOYsAgrbS98JXCzEEoIOHnTLQ0infkL
      Ex1IOSECgYEA242SmKUaD0ps1XnoPKeKJ4EJjs94fZKkXnKB9jPxx44A+rdEqMqM
      BQYHN7hBB/1qXMNuyP+FvZW88vPVP4eIeNQUQsvU9CqGkvwJyXddKloxbCYl/nQ2
      XHKefjHRt+7OsNB74Vfw2TvA5ChaIXOvJQyEaCjknEx6pfTFQV1A8SsCgYEA+IbC
      mA+EwzWXdMyyo/Yd5qwKaMFg8kDQf6jUvExte9xMO+TnXn8Ae8XM48IKeZT/TbBp
      k6ocETSLpM6DuwYGFsPDLyduokz0JePdbjgZqIwicIuBGDmloLnuRlKYVS6wyPWt
      4/pOcr9K53eXbbMC9O434tQONForFZRc2judVxECgYBheTEkY+h18WzwOfdJNni3
      oSpFJQcxePFQnTXlwJoPJpR4uvTYm1QextZdfoggq/mUxY9h3U/bI6eHlYmPcvS7
      8Cwum6An5tloWE1gDIZoTzKx+R3VInMgCCMlk6iwKG3LQkQ9f3WGfGje4qthPqL7
      p9sBA2a7nZi2JT2OD4DNkQKBgQC8+2R/0tUmx9rK01lIOr/UB6DGtb3tmQGzAYP7
      R7a9R/CkXtTdU3/fnrLFwmjKuVVGE07FHcbIAofpo6wiDFuW9fe3JKoJOrExGsvn
      oztHooARytM4w6VBygD5cpcptx5xQfif8lezA+mGh7cbkNM/wuG2V4ARqTs35qCQ
      xmJHsQKBgC1dz5VwndxoKTsY8VO+cAboJG1e5CjhT1xmCFxx5JADUrlbE9MY/i/4
      5PtV+cxCkKkdcle2qyK4XwW3VHNWChIreHmcRyJJ5L7dg1Sp31GDBbZgWwSl68J7
      MiyAqalHKtBqXkZwAlI+fdra0OrtmSX+VAYSEXJVCozv+r/DaAvk
      -----END RSA PRIVATE KEY-----

  smoke_tests:
    skip_ssl_validation: true
    api: (( "https://api." .properties.domain ))
    apps_domain: (( .properties.domain ))
    org: SMOKE
    space: TEST
    user: admin
    password: admin

  template_only:
    aws:
      access_key_id: {{ cat ~/.aws/credentials | grep aws_access_key_id | awk '{print $3}' }}
      secret_access_key: {{ cat ~/.aws/credentials | grep aws_secret_access_key | awk '{print $3}' }}
      availability_zone: {{ source ~/deployment/vars && echo $avz }}
      availability_zone2: null

meta:
  environment: cf
```
