# https://github.com/msfreaks/EvergreenAdmx
function Get-ZoomDesktopClientAdmxOnline {
    <#
        .SYNOPSIS
        Returns latest Version and Uri for Zoom Desktop Client ADMX files
    #>
    
        try {
            $ProgressPreference = 'SilentlyContinue'
            $url = "https://support.zoom.us/hc/en-us/articles/360039100051"
            # grab content
            $web = Invoke-WebRequest -Uri $url -UseBasicParsing -ErrorAction Ignore
            # find ADMX download
            $URI = (($web.Links | Where-Object {$_.href -like "*msi-templates*.zip"})[-1]).href
            # grab version
            $Version = ($URI.Split("/")[-1] | Select-String -Pattern "(\d+(\.\d+){1,4})" -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value }).ToString()
    
            # return evergreen object
            return @{ Version = $Version; URI = $URI }
        }
        catch {
            Throw $_
        }
    }

Get-ZoomDesktopClientAdmxOnline

# SIG # Begin signature block
# MIIargYJKoZIhvcNAQcCoIIanzCCGpsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCDm9DY4NEuiPE9
# cot4pEZ6QOoQ3WbtzkVkc4hSw14N2KCCFZ0wggT+MIID5qADAgECAhANQkrgvjqI
# /2BAIc4UAPDdMA0GCSqGSIb3DQEBCwUAMHIxCzAJBgNVBAYTAlVTMRUwEwYDVQQK
# EwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xMTAvBgNV
# BAMTKERpZ2lDZXJ0IFNIQTIgQXNzdXJlZCBJRCBUaW1lc3RhbXBpbmcgQ0EwHhcN
# MjEwMTAxMDAwMDAwWhcNMzEwMTA2MDAwMDAwWjBIMQswCQYDVQQGEwJVUzEXMBUG
# A1UEChMORGlnaUNlcnQsIEluYy4xIDAeBgNVBAMTF0RpZ2lDZXJ0IFRpbWVzdGFt
# cCAyMDIxMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwuZhhGfFivUN
# CKRFymNrUdc6EUK9CnV1TZS0DFC1JhD+HchvkWsMlucaXEjvROW/m2HNFZFiWrj/
# ZwucY/02aoH6KfjdK3CF3gIY83htvH35x20JPb5qdofpir34hF0edsnkxnZ2OlPR
# 0dNaNo/Go+EvGzq3YdZz7E5tM4p8XUUtS7FQ5kE6N1aG3JMjjfdQJehk5t3Tjy9X
# tYcg6w6OLNUj2vRNeEbjA4MxKUpcDDGKSoyIxfcwWvkUrxVfbENJCf0mI1P2jWPo
# GqtbsR0wwptpgrTb/FZUvB+hh6u+elsKIC9LCcmVp42y+tZji06lchzun3oBc/gZ
# 1v4NSYS9AQIDAQABo4IBuDCCAbQwDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQC
# MAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwQQYDVR0gBDowODA2BglghkgBhv1s
# BwEwKTAnBggrBgEFBQcCARYbaHR0cDovL3d3dy5kaWdpY2VydC5jb20vQ1BTMB8G
# A1UdIwQYMBaAFPS24SAd/imu0uRhpbKiJbLIFzVuMB0GA1UdDgQWBBQ2RIaOpLqw
# Zr68KC0dRDbd42p6vDBxBgNVHR8EajBoMDKgMKAuhixodHRwOi8vY3JsMy5kaWdp
# Y2VydC5jb20vc2hhMi1hc3N1cmVkLXRzLmNybDAyoDCgLoYsaHR0cDovL2NybDQu
# ZGlnaWNlcnQuY29tL3NoYTItYXNzdXJlZC10cy5jcmwwgYUGCCsGAQUFBwEBBHkw
# dzAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tME8GCCsGAQUF
# BzAChkNodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRTSEEyQXNz
# dXJlZElEVGltZXN0YW1waW5nQ0EuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBIHNy1
# 6ZojvOca5yAOjmdG/UJyUXQKI0ejq5LSJcRwWb4UoOUngaVNFBUZB3nw0QTDhtk7
# vf5EAmZN7WmkD/a4cM9i6PVRSnh5Nnont/PnUp+Tp+1DnnvntN1BIon7h6JGA078
# 9P63ZHdjXyNSaYOC+hpT7ZDMjaEXcw3082U5cEvznNZ6e9oMvD0y0BvL9WH8dQgA
# dryBDvjA4VzPxBFy5xtkSdgimnUVQvUtMjiB2vRgorq0Uvtc4GEkJU+y38kpqHND
# Udq9Y9YfW5v3LhtPEx33Sg1xfpe39D+E68Hjo0mh+s6nv1bPull2YYlffqe0jmd4
# +TaY4cso2luHpoovMIIFMTCCBBmgAwIBAgIQCqEl1tYyG35B5AXaNpfCFTANBgkq
# hkiG9w0BAQsFADBlMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5j
# MRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSQwIgYDVQQDExtEaWdpQ2VydCBB
# c3N1cmVkIElEIFJvb3QgQ0EwHhcNMTYwMTA3MTIwMDAwWhcNMzEwMTA3MTIwMDAw
# WjByMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQL
# ExB3d3cuZGlnaWNlcnQuY29tMTEwLwYDVQQDEyhEaWdpQ2VydCBTSEEyIEFzc3Vy
# ZWQgSUQgVGltZXN0YW1waW5nIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
# CgKCAQEAvdAy7kvNj3/dqbqCmcU5VChXtiNKxA4HRTNREH3Q+X1NaH7ntqD0jbOI
# 5Je/YyGQmL8TvFfTw+F+CNZqFAA49y4eO+7MpvYyWf5fZT/gm+vjRkcGGlV+Cyd+
# wKL1oODeIj8O/36V+/OjuiI+GKwR5PCZA207hXwJ0+5dyJoLVOOoCXFr4M8iEA91
# z3FyTgqt30A6XLdR4aF5FMZNJCMwXbzsPGBqrC8HzP3w6kfZiFBe/WZuVmEnKYmE
# UeaC50ZQ/ZQqLKfkdT66mA+Ef58xFNat1fJky3seBdCEGXIX8RcG7z3N1k3vBkL9
# olMqT4UdxB08r8/arBD13ays6Vb/kwIDAQABo4IBzjCCAcowHQYDVR0OBBYEFPS2
# 4SAd/imu0uRhpbKiJbLIFzVuMB8GA1UdIwQYMBaAFEXroq/0ksuCMS1Ri6enIZ3z
# bcgPMBIGA1UdEwEB/wQIMAYBAf8CAQAwDgYDVR0PAQH/BAQDAgGGMBMGA1UdJQQM
# MAoGCCsGAQUFBwMIMHkGCCsGAQUFBwEBBG0wazAkBggrBgEFBQcwAYYYaHR0cDov
# L29jc3AuZGlnaWNlcnQuY29tMEMGCCsGAQUFBzAChjdodHRwOi8vY2FjZXJ0cy5k
# aWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290Q0EuY3J0MIGBBgNVHR8E
# ejB4MDqgOKA2hjRodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1
# cmVkSURSb290Q0EuY3JsMDqgOKA2hjRodHRwOi8vY3JsMy5kaWdpY2VydC5jb20v
# RGlnaUNlcnRBc3N1cmVkSURSb290Q0EuY3JsMFAGA1UdIARJMEcwOAYKYIZIAYb9
# bAACBDAqMCgGCCsGAQUFBwIBFhxodHRwczovL3d3dy5kaWdpY2VydC5jb20vQ1BT
# MAsGCWCGSAGG/WwHATANBgkqhkiG9w0BAQsFAAOCAQEAcZUS6VGHVmnN793afKpj
# erN4zwY3QITvS4S/ys8DAv3Fp8MOIEIsr3fzKx8MIVoqtwU0HWqumfgnoma/Capg
# 33akOpMP+LLR2HwZYuhegiUexLoceywh4tZbLBQ1QwRostt1AuByx5jWPGTlH0gQ
# GF+JOGFNYkYkh2OMkVIsrymJ5Xgf1gsUpYDXEkdws3XVk4WTfraSZ/tTYYmo9WuW
# wPRYaQ18yAGxuSh1t5ljhSKMYcp5lH5Z/IwP42+1ASa2bKXuh1Eh5Fhgm7oMLStt
# osR+u8QlK0cCCHxJrhO24XxCQijGGFbPQTS2Zl22dHv1VjMiLyI2skuiSpXY9aaO
# UjCCBXMwggRboAMCAQICEHfSaWkeOrd6wIWfUL7n78AwDQYJKoZIhvcNAQELBQAw
# fDELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAk1JMRIwEAYDVQQHEwlBbm4gQXJib3Ix
# EjAQBgNVBAoTCUludGVybmV0MjERMA8GA1UECxMISW5Db21tb24xJTAjBgNVBAMT
# HEluQ29tbW9uIFJTQSBDb2RlIFNpZ25pbmcgQ0EwHhcNMTkwNTA4MDAwMDAwWhcN
# MjIwNTA3MjM1OTU5WjCBrTELMAkGA1UEBhMCVVMxDjAMBgNVBBEMBTk4MTk1MQsw
# CQYDVQQIDAJXQTEQMA4GA1UEBwwHU2VhdHRsZTEZMBcGA1UECQwQNDU0NSAxNXRo
# IEF2ZSBORTEhMB8GA1UECgwYVW5pdmVyc2l0eSBvZiBXYXNoaW5ndG9uMQ4wDAYD
# VQQLDAVVVy1JVDEhMB8GA1UEAwwYVW5pdmVyc2l0eSBvZiBXYXNoaW5ndG9uMIIB
# IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxsTPspJZh9HrDs7Mk74OCoT/
# DhfhGOmrTQQwlb5hveyiAtFAIyblJp3vJThWOoiPz3OaSZ1r8+sL+i0gz1ozCpfx
# 4LLdGS9dRhDk1Ewc7NgaywDyfTQo8CkdzStelUAnXklsMVei+CP0VPiSi+I/elGC
# N/m98fJGvhEFtLHLzecUuYb1S9yd+Z6+quoMV0AXFuguoiSsx6hXM07RxFyaprx0
# tkgzTJIVniGdLfr4IZsa8Tge2n3/GvPEnUfA6Yb9cIYRC7MLYRHxs2fzuNZuDogZ
# KjgsCLxoCEkrR79HvkUPMXDk4NUlgt0SD3HFVT71L+dJRJ26BmaOTp2pt9VAUQID
# AQABo4IBvTCCAbkwHwYDVR0jBBgwFoAUrjUjF///Bj2cUOCMJGUzHnAQiKIwHQYD
# VR0OBBYEFG8MveiXDzZycmRwNhhn2L8wzjKPMA4GA1UdDwEB/wQEAwIHgDAMBgNV
# HRMBAf8EAjAAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMBEGCWCGSAGG+EIBAQQEAwIE
# EDBmBgNVHSAEXzBdMFsGDCsGAQQBriMBBAMCATBLMEkGCCsGAQUFBwIBFj1odHRw
# czovL3d3dy5pbmNvbW1vbi5vcmcvY2VydC9yZXBvc2l0b3J5L2Nwc19jb2RlX3Np
# Z25pbmcucGRmMEkGA1UdHwRCMEAwPqA8oDqGOGh0dHA6Ly9jcmwuaW5jb21tb24t
# cnNhLm9yZy9JbkNvbW1vblJTQUNvZGVTaWduaW5nQ0EuY3JsMH4GCCsGAQUFBwEB
# BHIwcDBEBggrBgEFBQcwAoY4aHR0cDovL2NydC5pbmNvbW1vbi1yc2Eub3JnL0lu
# Q29tbW9uUlNBQ29kZVNpZ25pbmdDQS5jcnQwKAYIKwYBBQUHMAGGHGh0dHA6Ly9v
# Y3NwLmluY29tbW9uLXJzYS5vcmcwDQYJKoZIhvcNAQELBQADggEBAIOY8ZyGOGaN
# V3IN/dIzuQ7sBMp2cTEvzg31d703Wh3pqVCAMLd0DTKXSBW0A38yj496nCURIfeT
# CT24bOd6BWCX8qOSX102irZLGixh7ccG3xcxJgoLk31k9rtdOoROCueJry7+gU4P
# lZ5UfwCDtuJFl3fX6gLBo/pQRYNIEY7LN6mMclmgKaSDuBXMFbBiB0yH/Awbomf/
# c+6Vr/uaXMPlhRQh6rkBEdkO1QuuJjPGU2GXO/yuPRqQEvoyf8ErfKUsZp0AcED1
# NdC1Xw+h6ZFWvHwvYh1vncIVSh07PW3FaXoiCwRBdUJpa6r9nyrKPyvlgm4Rj3Aa
# nSzCbDQXijkwggXrMIID06ADAgECAhBl4eLj1d5QRYXzJiSABeLUMA0GCSqGSIb3
# DQEBDQUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIG
# A1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29y
# azEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0
# eTAeFw0xNDA5MTkwMDAwMDBaFw0yNDA5MTgyMzU5NTlaMHwxCzAJBgNVBAYTAlVT
# MQswCQYDVQQIEwJNSTESMBAGA1UEBxMJQW5uIEFyYm9yMRIwEAYDVQQKEwlJbnRl
# cm5ldDIxETAPBgNVBAsTCEluQ29tbW9uMSUwIwYDVQQDExxJbkNvbW1vbiBSU0Eg
# Q29kZSBTaWduaW5nIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
# wKAvix56u2p1rPg+3KO6OSLK86N25L99MCfmutOYMlYjXAaGlw2A6O2igTXrC/Ze
# fqk+aHP9ndRnec6q6mi3GdscdjpZh11emcehsriphHMMzKuHRhxqx+85Jb6n3dos
# NXA2HSIuIDvd4xwOPzSf5X3+VYBbBnyCV4RV8zj78gw2qblessWBRyN9EoGgwAEo
# PgP5OJejrQLyAmj91QGr9dVRTVDTFyJG5XMY4DrkN3dRyJ59UopPgNwmucBMyvxR
# +hAJEXpXKnPE4CEqbMJUvRw+g/hbqSzx+tt4z9mJmm2j/w2nP35MViPWCb7hpR2L
# B8W/499Yqu+kr4LLBfgKCQIDAQABo4IBWjCCAVYwHwYDVR0jBBgwFoAUU3m/Wqor
# Ss9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFK41Ixf//wY9nFDgjCRlMx5wEIiiMA4G
# A1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBMGA1UdJQQMMAoGCCsG
# AQUFBwMDMBEGA1UdIAQKMAgwBgYEVR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRw
# Oi8vY3JsLnVzZXJ0cnVzdC5jb20vVVNFUlRydXN0UlNBQ2VydGlmaWNhdGlvbkF1
# dGhvcml0eS5jcmwwdgYIKwYBBQUHAQEEajBoMD8GCCsGAQUFBzAChjNodHRwOi8v
# Y3J0LnVzZXJ0cnVzdC5jb20vVVNFUlRydXN0UlNBQWRkVHJ1c3RDQS5jcnQwJQYI
# KwYBBQUHMAGGGWh0dHA6Ly9vY3NwLnVzZXJ0cnVzdC5jb20wDQYJKoZIhvcNAQEN
# BQADggIBAEYstn9qTiVmvZxqpqrQnr0Prk41/PA4J8HHnQTJgjTbhuET98GWjTBE
# E9I17Xn3V1yTphJXbat5l8EmZN/JXMvDNqJtkyOh26owAmvquMCF1pKiQWyuDDll
# xR9MECp6xF4wnH1Mcs4WeLOrQPy+C5kWE5gg/7K6c9G1VNwLkl/po9ORPljxKKeF
# hPg9+Ti3JzHIxW7LdyljffccWiuNFR51/BJHAZIqUDw3LsrdYWzgg4x06tgMvOEf
# 0nITelpFTxqVvMtJhnOfZbpdXZQ5o1TspxfTEVOQAsp05HUNCXyhznlVLr0JaNkM
# 7edgk59zmdTbSGdMq8Ztuu6VyrivOlMSPWmay5MjvwTzuNorbwBv0DL+7cyZBp7N
# YZou+DoGd1lFZN0jU5IsQKgm3+00pnnJ67crdFwfz/8bq3MhTiKOWEb04FT3OZVp
# +jzvaChHWLQ8gbCORgClaZq1H3aqI7JeRkWEEEp6Tv4WAVsr/i7LoXU72gOb8CAz
# PFqwI4Excdrxp0I4OXbECHlDqU4sTInqwlMwofmxeO4u94196qIqJQl+8Sykl06V
# ktqMux84Iw3ZQLH08J8LaJ+WDUycc4OjY61I7FGxCDkbSQf3npXeRFm0IBn8GiW+
# TRDk6J2XJFLWEtVZmhboFlBLoUlqHUCKu0QOhU/+AEOqnY98j2zRMYIEZzCCBGMC
# AQEwgZAwfDELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAk1JMRIwEAYDVQQHEwlBbm4g
# QXJib3IxEjAQBgNVBAoTCUludGVybmV0MjERMA8GA1UECxMISW5Db21tb24xJTAj
# BgNVBAMTHEluQ29tbW9uIFJTQSBDb2RlIFNpZ25pbmcgQ0ECEHfSaWkeOrd6wIWf
# UL7n78AwDQYJYIZIAWUDBAIBBQCggYQwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKA
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYK
# KwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQge2P2C2aJvJQiUS133QRGNu2pmXVw
# coU7vVY/clPG7YcwDQYJKoZIhvcNAQEBBQAEggEAJCzCbxsIFZnbUCYkQGZ5LqSM
# kg+ZAYkp8DGeCfvoft6GEGn+jdEp2Vnoz8SemeRQIymt0roEIF2ywokf2hfDDCNt
# G2AyINCzTemgypG2SBUS3vrtqNUoyET5KxBLbq7M6pLdUeBHuJoPLeOMazMO7aVt
# 7nF0otyi8OgMSmVc7oKACkScCTnBiwhvo2NhWe09vDOddP+L5n506HuuOdVgdPwq
# L6S1ORJFHMZnepxrGvQNdNX8LfS3pwpDX8jvdRN5Rkmx/7haKV+Qg2+SPDPKQUkj
# J7WuwdVK3GBWrLetuyrk9lEigM/6Ha0rCScIk0FesRp11Qsz6/S1hRDI+4eVYaGC
# AiAwggIcBgkqhkiG9w0BCQYxggINMIICCQIBATCBhjByMQswCQYDVQQGEwJVUzEV
# MBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29t
# MTEwLwYDVQQDEyhEaWdpQ2VydCBTSEEyIEFzc3VyZWQgSUQgVGltZXN0YW1waW5n
# IENBAhANQkrgvjqI/2BAIc4UAPDdMAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0BCQMx
# CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAxMDQxNjU1MjdaMCMGCSqG
# SIb3DQEJBDEWBBTHegkmwGwke/v9hpV2rd5qHG3hbzANBgkqhkiG9w0BAQEFAASC
# AQBXZIQTitG8XAS+2CC+5C86SOHTwHVrLupGoZXw7GI1sSgiSr7yErKFCI0oJVqk
# xYPG/jJuKtR1p+DLafvKVcV/vPXYFSYPmxkJRFmMKdne7yLou0RB/69/GSgCYlEB
# Dx4f3XC8e5cnj66xcCyYlzmXqVOu9KMQfFKOfJC/ySci1LJO6odAdcKWnac2yrWX
# A3LxQVQp+/CqgoZwkeFgItD7SdnQpRLqN+cTJw5uf4VMNAGyIVSpc77373DFCC6M
# T4sgCYP6MrLEElE815AzVC2iaUUcpYLGh6F/ua2tVnlDTCPuo/MssG0zHhUfZslA
# 77yi4bALD5j3S5ashiIJ7kd/
# SIG # End signature block
