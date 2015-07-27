##### Signed by https://keybase.io/blacktop
```
-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQEcBAABCgAGBQJVtXUnAAoJECZj0IKEt8C2ZBcH/3LGPsbteHHgcOGK6PAUidCx
i6K+/icsdQX6M61FWrTN/zYvfY0Nsc/mVttgcPb4rYryLucv6FuHPonAcRtOYKE2
jYayhs7XN3jcR6fu3G8/me9f/7jPZxCFxJGSBMiqgVKpA/7WywRNV2bWRSY/YRlM
gIAzQPSVD9ZnQB09CZ4+Fn6dlc5ssui132PxM/U9a5ACmhCL89IfF99i5WWKHhJy
z+zaiaCEnoWill5swtNKFa0YZlVIOMqUB9Y+yCAZ4LcBoKsAY9LCmDEuwyLgm1uD
sXQu1jdtucHdhf2pHlRP3MyNs6I3CDJJodkPomnLl80u6hsRLKJABtiKTiaqHeg=
=GppB
-----END PGP SIGNATURE-----

```

<!-- END SIGNATURES -->

### Begin signed statement 

#### Expect

```
size    exec  file                                   contents                                                                                                                         
              ./                                                                                                                                                                      
110             .dockerignore                        3fca02933b036c56ae53d8c558b7af0d69e1d4524e68456b919f91ac29100be2                                                                 
19              .gitignore                           792e97b1e4e01f634cd8890ea2f430d97fb0e9e708e581ec1a124f5d3e1afc9c                                                                 
97              .gitmodules                          3b2779fcab753143385e1d33eca525dc2e48da7b57ab1ab4393f539e174ef076                                                                 
1974            Dockerfile                           25e3238c88416ae97cca687c5f377912b2dea6ba9c2d3317e4def24000f0f877                                                                 
1088            LICENSE                              d881acc131e52a60d490203b898e9f42f68237323818d8f8bc3b8a20337df943                                                                 
3909            README.md                            d106c93bd5de268efca2000558b2c1eb1222542717c5d12a17f33e910ebd90d0                                                                 
                conf/                                                                                                                                                                 
44                htpasswd                           e0d6d1654b00384604015dca4487ea8a568d68ae8d22c0ebe062596d670f5246                                                                 
557               kibana.conf                        de9ad624bd72f4b335d5d20420552af84bb41506dbdcdbfe274f0632e6e2f4e8                                                                 
853               supervisord.conf                   2f0be3af804e6da4cfa417acf846ccd86a6897a1cf3a65944370451c4a2c37f4                                                                 
733               test_index.py                      11a43fbc9c9fd381329b8ed32b6b00bab1c0902a117ed10e6af903689173b684                                                                 
786             docker-compose.yml                   cc1bf87cb05a827a6cf5c079e5130ad762a0446b5ce417ed35a3795d10985dc7                                                                 
129237          elk-logo.png                         924c990c091e7efeb5d3f2e929b1cee901884e99c3e8ad0e9cce7d96af738c57|47ba57b522a645032ce24b77e68143d119bd9b32fd5856e69929a8b28391f9bf
598             entrypoint.sh                        c8366fc2f6a94ae05c0f5deaf32727753fd92ce4d507b81075839463d3bf3b32                                                                 
                esdata/                                                                                                                                                               
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
                screens/                                                                                                                                                              
184128            discover.png                       a3de1bd04a8fd442204d81a161318002d09d8b10dd3142218518573e302eafa5|20229b864b17499a493ca74ea320d99f36555a2367e3379b6ee7c0237620e804
126113            timestamp.png                      c6b428056073b38b78cc599e7750bae45a99b47d4fc8285cdff3e5c1cfefa66f|ea7bd6990320a935d7457dce16ba78f84a06a2dbd7b47c5b519b7f15e338371b
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