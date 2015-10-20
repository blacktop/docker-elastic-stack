##### Signed by https://keybase.io/blacktop
```
-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQEcBAABCgAGBQJWJdILAAoJECZj0IKEt8C2uE0IAIGjdXi4wZhXjqj3TwcYyYev
MGoVYmEeydo3HF42OyXbX8TM1yC2tXH3TIBznzi9V6aduI78105lX7RWtNYavKA8
O6m4UYx6/8GSsM0CEbkK9Y3Q2bkZAOLbiIzDkt4nJgiZIzy8oansmAQ7JTPc5/Zt
jFcqEGw9hrjTs34PvMkBVOOFSB8QbX7EWqmOufkG4B9mMRCKvyHkBj89rHLNsy+p
GSxDRfm/F5ojmeO1wc3TZ8/NVJl5mr5CAbv1EYKl4+p+SHdgpem9MSvM4UETaKfq
x+SnE2+XmZfehcfHwegwg6DOMSfyLaT4dst6oN/09cz+NGjW/7ipD7S7gvFe0OU=
=+7qf
-----END PGP SIGNATURE-----

```

<!-- END SIGNATURES -->

### Begin signed statement 

#### Expect

```
size    exec  file                                   contents                                                                                                                         
              ./                                                                                                                                                                      
121             .dockerignore                        464319d7971418c4beab3f5ecaf4b258b34077be8d4aaeb2efc65f6a181a317b                                                                 
19              .gitignore                           792e97b1e4e01f634cd8890ea2f430d97fb0e9e708e581ec1a124f5d3e1afc9c                                                                 
97              .gitmodules                          3b2779fcab753143385e1d33eca525dc2e48da7b57ab1ab4393f539e174ef076                                                                 
                config/                                                                                                                                                               
                  elastic/                                                                                                                                                            
3250                elasticsearch.yml                c0c1a70c83bfe12865233622e641bf1c06dff6c8d585bb984f9f93c92b349b00                                                                 
469                 logging.yml                      a5eba34e1891eff31e18a5ce1b0c467845b0c7e6ed720206aab5c8bb11b29da7                                                                 
576               elasticsearch.nse                  c2fce0c316fc909ce6d229b6ee171d094cb21122a592038efe567bf866e7713e                                                                 
                  nginx/                                                                                                                                                              
44                  htpasswd                         e0d6d1654b00384604015dca4487ea8a568d68ae8d22c0ebe062596d670f5246                                                                 
557                 kibana.conf                      de9ad624bd72f4b335d5d20420552af84bb41506dbdcdbfe274f0632e6e2f4e8                                                                 
                  supervisord/                                                                                                                                                        
865                 supervisord.conf                 4b0bef9449d565367e8f54489f4a478a54df1db85e2a4471cb49330d5a1e6030                                                                 
733               test_index.py                      11a43fbc9c9fd381329b8ed32b6b00bab1c0902a117ed10e6af903689173b684                                                                 
817             docker-compose.yml                   8ac89adad18d67f487a7943805d5bacbebf46c611a00640b4587faa9f17ca0b5                                                                 
3149            Dockerfile                           160df285005e2769955fa9de3474e286882174d2516e3a1b0bcb9be61cb7f4d2                                                                 
                docs/                                                                                                                                                                 
184128            discover.png                       a3de1bd04a8fd442204d81a161318002d09d8b10dd3142218518573e302eafa5|7e382c8a749c7f5634084e63197fc4daf53dda46da4ff4b34f20eddef3109115
129237            elk-logo.png                       924c990c091e7efeb5d3f2e929b1cee901884e99c3e8ad0e9cce7d96af738c57|62f00ad3c24696c53ab0d291fe06a08a7921acae05de0a65eef7d7b4eb10c249
126113            timestamp.png                      c6b428056073b38b78cc599e7750bae45a99b47d4fc8285cdff3e5c1cfefa66f|82a5bbca5df771a45761e82b64ec73b5d1ad88fc48f4e631b47dcd8c050a713d
                entrypoints/                                                                                                                                                          
552               elastic-entrypoint.sh              1a829e1e0bcba27d047689012da790b0ed77afe1c31236b64ec5d88c68d1cdbc                                                                 
694               kibana-entrypoint.sh               0df6babdf0ea18556170372b57e87e38473271b3d5fa2f2bf5695dfa90eac859                                                                 
239               logstash-entrypoint.sh             5e59e653bba0b3c81c698a02bf7668a5df0dfa386832ef9576e992405bb0de38                                                                 
1088            LICENSE                              d881acc131e52a60d490203b898e9f42f68237323818d8f8bc3b8a20337df943                                                                 
                logstash/                                                                                                                                                             
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
1079              LICENSE                            98b7807625a5d1a3313bdade636b291bc33ebcf6c10ee1b3c899e03b5e8b284d                                                                 
1627              README.md                          27f314070a207039dc7af70855a80c929751b51ec1d499ccdb5983214e42825b                                                                 
                  type_mappings/                                                                                                                                                      
1797                log2timeline.type                af46a4e86596fb2f4f1820f03288482cbcdf2cde28972bed8df92d66725b0dd6                                                                 
3027                mhn-hpfeed.type                  24f8a228403aa7aedece03916511a7fce73a789e5161c9619f15335f2b25598d                                                                 
3964            README.md                            d7b5853b0b90ca5e5eeb794efc0bffa90ff68ad89a6f2e3cd41c2f582d04abd8                                                                 
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