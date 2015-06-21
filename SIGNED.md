##### Signed by https://keybase.io/blacktop
```
-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQEcBAABCgAGBQJVhyvyAAoJECZj0IKEt8C2eZIH/RuES1J6Awy9PUc1W9Ygd4mc
0nS4dC/sH0+4HL3NwquPLhruOZW+yOL9MpchXCKkGWs3RZhZIc7oj74OwxIazlzS
M9TfsMuM5CATPmC2IYnpFy2PTHkIu1a4dJAmR4wJfxl+d0j2ERAuDXeiKGZXNIBT
P5rmQTx5fdEdiK/r1YncLvucuWyfFt6T1XhcjRq+eSZPau/ysSwsqDLDiQkH03Qt
ev8qPs4Q+eUst8uxfFGE4zWmIhLbnet1ABT5SLCQd7+gORUJ7s72UlwXlWxiCIy5
pbRWTB0T1kQbxIBTbfN/YKo4UONvK4i1xX/J4lRaxDjyDaIf/TtbovmR8eKnyFk=
=4G3g
-----END PGP SIGNATURE-----

```

<!-- END SIGNATURES -->

### Begin signed statement 

#### Expect

```
size    exec  file                                   contents                                                                                                                         
              ./                                                                                                                                                                      
52              .dockerignore                        1e6a7c33b346fde2d16e4e24910ff7e4515a6f6bf14c4f51094c6939f3a5fc62                                                                 
10              .gitignore                           d97c263d44a33954979f9582146bf8d4cc1d9bf9959a9059aeb58afd01bebaea                                                                 
97              .gitmodules                          3b2779fcab753143385e1d33eca525dc2e48da7b57ab1ab4393f539e174ef076                                                                 
1883            Dockerfile                           c38bcc9538a6aba75b658534f8f4263908b7f6df60051d245f204129ff026305                                                                 
1088            LICENSE                              d881acc131e52a60d490203b898e9f42f68237323818d8f8bc3b8a20337df943                                                                 
1951            README.md                            b4601ef42d95505331e90a7fc613785a0e4bb2683ae81bea30a784767a9ce1ad                                                                 
                conf/                                                                                                                                                                 
44                htpasswd                           e0d6d1654b00384604015dca4487ea8a568d68ae8d22c0ebe062596d670f5246                                                                 
557               kibana.conf                        de9ad624bd72f4b335d5d20420552af84bb41506dbdcdbfe274f0632e6e2f4e8                                                                 
853               supervisord.conf                   2f0be3af804e6da4cfa417acf846ccd86a6897a1cf3a65944370451c4a2c37f4                                                                 
129237          elk-logo.png                         924c990c091e7efeb5d3f2e929b1cee901884e99c3e8ad0e9cce7d96af738c57|47ba57b522a645032ce24b77e68143d119bd9b32fd5856e69929a8b28391f9bf
598             entrypoint.sh                        c8366fc2f6a94ae05c0f5deaf32727753fd92ce4d507b81075839463d3bf3b32                                                                 
                logstash/                                                                                                                                                             
1079              LICENSE                            98b7807625a5d1a3313bdade636b291bc33ebcf6c10ee1b3c899e03b5e8b284d                                                                 
1627              README.md                          27f314070a207039dc7af70855a80c929751b51ec1d499ccdb5983214e42825b                                                                 
                  conf_files/                                                                                                                                                         
                    bro/                                                                                                                                                              
3837                  bro-conn_log.conf              2c9d9d7cec84f432022a604e3f7f83898473b98b2dc549a2eda42ca89167b0d9                                                                 
1638                  bro-dhcp_log.conf              36b58e38ba7986239b339b6d8425e32ce6872899d5c932fcca60341ed8f98381                                                                 
1812                  bro-dns_log.conf               a0a85bea1431ab38cd44136da3cdf1afd3f2b79ffd960427147f16110f432981                                                                 
1880                  bro-files_log.conf             f01bef3d9ed3f6a96c62a8cba85801c224734b80ad63b1dd9b97f9c7b2f0a8ee                                                                 
2012                  bro-http_log.conf              1c473bde77a9df2f9679c29f58c29e19c6f7f1f12d4cde8fbaad5bbefa9a92dc                                                                 
1898                  bro-notice_log.conf            3bda97c3388fe013059ec26718f810db37fa7ac3e7d7afc8437d6c40ecaf9018                                                                 
1545                  bro-weird_log.conf             3c910110b9b6b8e3dd4004914b0282d41c5d2310a2ed933c34d1470f8541302f                                                                 
                    log2timeline/                                                                                                                                                     
1407                  logstash-log2timeline.conf     271c1f4fe77bab7675bfe90ef56b1321bfee3c077ce6390bc92769a9138f61d2                                                                 
                    web_logs/                                                                                                                                                         
1373                  logstash-apache-combined.conf  0319a023767132be634b77943d86cdef8fd35fde30c76f185067cd0938b19ebf                                                                 
1469                  logstash-apache-common.conf    41c1cbd59a25b3f33bea05dda89396c7b7837ebfc0dea877b2ff27104405e2a7                                                                 
1711                  logstash-iis6.conf             7e11499ff0ef111ba5f764a8d311b93467b590a4ad008f20596095edbfb6603f                                                                 
1067                  logstash-iis7.conf             ebadb12fb0365a02c18642375914e313d6eeedf9877c48a8ee74e49029050457                                                                 
1224                  logstash-iis8.conf             ad76d69b07604895914f350880df266e6dc0cefb77c6f52f2dbb08af63b1e810                                                                 
                  dictionaries/                                                                                                                                                       
2121                logstash-bro-conn-log.dict       1ae12747b6d257251e2ce8f473c242f4b46f60c40685bf677bcdc0159ecaa147                                                                 
3916                logstash-ftp-status-codes.dict   2fe32a14c3db0f42541f7a9b649443bb257e0121aa902b6d980083c64f5989b8                                                                 
3326                logstash-http-status-codes.dict  4ddd9c79899c1aa5fba95c09af60021c6265f499cbdcf61e651eb991ba2ea2d6                                                                 
                  type_mappings/                                                                                                                                                      
1797                log2timeline.type                af46a4e86596fb2f4f1820f03288482cbcdf2cde28972bed8df92d66725b0dd6                                                                 
3027                mhn-hpfeed.type                  24f8a228403aa7aedece03916511a7fce73a789e5161c9619f15335f2b25598d                                                                 
```

#### Ignore

```
/SIGNED.md
```

#### Presets

```
git      # ignore .git and anything as described by .gitignore files
dropbox  # ignore .dropbox-cache and other Dropbox-related files    
kb       # ignore anything as described by .kbignore files          
```

<!-- summarize version = 0.0.9 -->

### End signed statement

<hr>

#### Notes

With keybase you can sign any directory's contents, whether it's a git repo,
source code distribution, or a personal documents folder. It aims to replace the drudgery of:

  1. comparing a zipped file to a detached statement
  2. downloading a public key
  3. confirming it is in fact the author's by reviewing public statements they've made, using it

All in one simple command:

```bash
keybase dir verify
```

There are lots of options, including assertions for automating your checks.

For more info, check out https://keybase.io/docs/command_line/code_signing