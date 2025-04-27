# Local Group Policy Object Templates and US-us Languages for Windows Server 2022
resource "aws_s3_object" "attachmentmanager_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/AttachmentManager.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/AttachmentManager.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/AttachmentManager.adml")

  tags = {
    Name = "AttachmentManager.adml"
  }
}

resource "aws_s3_object" "attachmentmanager_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/AttachmentManager.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/AttachmentManager.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/AttachmentManager.admx")

  tags = {
    Name = "AttachmentManager.admx"
  }
}

resource "aws_s3_object" "cloudcontent_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/CloudContent.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/CloudContent.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/CloudContent.adml")

  tags = {
    Name = "CloudContent.adml"
  }
}

resource "aws_s3_object" "cloudcontent_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/CloudContent.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/CloudContent.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/CloudContent.admx")

  tags = {
    Name = "CloudContent.admx"
  }
}

resource "aws_s3_object" "desktopappinstaller_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/DesktopAppInstaller.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/DesktopAppInstaller.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/DesktopAppInstaller.adml")

  tags = {
    Name = "DesktopAppInstaller.adml"
  }
}

resource "aws_s3_object" "desktopappinstaller_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/DesktopAppInstaller.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/DesktopAppInstaller.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/DesktopAppInstaller.admx")

  tags = {
    Name = "DesktopAppInstaller.admx"
  }
}

resource "aws_s3_object" "dnsclient_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/DnsClient.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/DnsClient.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/DnsClient.adml")

  tags = {
    Name = "DnsClient.adml"
  }
}

resource "aws_s3_object" "dnsclient_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/DnsClient.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/DnsClient.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/DnsClient.admx")

  tags = {
    Name = "DnsClient.admx"
  }
}

resource "aws_s3_object" "helpandsupport_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/HelpAndSupport.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/HelpAndSupport.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/HelpAndSupport.adml")

  tags = {
    Name = "HelpAndSupport.adml"
  }
}

resource "aws_s3_object" "helpandsupport_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/HelpAndSupport.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/HelpAndSupport.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/HelpAndSupport.admx")

  tags = {
    Name = "HelpAndSupport.admx"
  }
}

resource "aws_s3_object" "localsecurityauthority_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/LocalSecurityAuthority.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/LocalSecurityAuthority.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/LocalSecurityAuthority.adml")

  tags = {
    Name = "LocalSecurityAuthority.adml"
  }
}

resource "aws_s3_object" "localsecurityauthority_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/LocalSecurityAuthority.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/LocalSecurityAuthority.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/LocalSecurityAuthority.admx")

  tags = {
    Name = "LocalSecurityAuthority.admx"
  }
}

resource "aws_s3_object" "msi_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/MSI.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/MSI.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/MSI.adml")

  tags = {
    Name = "MSI.adml"
  }
}

resource "aws_s3_object" "msi_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/MSI.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/MSI.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/MSI.admx")

  tags = {
    Name = "MSI.admx"
  }
}

resource "aws_s3_object" "msslegacy_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/MSS-legacy.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/MSS-legacy.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/MSS-legacy.adml")

  tags = {
    Name = "MSS-legacy.adml"
  }
}

resource "aws_s3_object" "msslegacy_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/MSS-legacy.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/MSS-legacy.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/MSS-legacy.admx")

  tags = {
    Name = "MSS-legacy.admx"
  }
}

resource "aws_s3_object" "networkprovider_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/NetworkProvider.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/NetworkProvider.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/NetworkProvider.adml")

  tags = {
    Name = "NetworkProvider.adml"
  }
}

resource "aws_s3_object" "networkprovider_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/NetworkProvider.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/NetworkProvider.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/NetworkProvider.admx")

  tags = {
    Name = "NetworkProvider.admx"
  }
}

resource "aws_s3_object" "performanceperftrack_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/performanceperftrack.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/performanceperftrack.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/performanceperftrack.adml")

  tags = {
    Name = "performanceperftrack.adml"
  }
}

resource "aws_s3_object" "performanceperftrack_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/performanceperftrack.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/performanceperftrack.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/performanceperftrack.admx")

  tags = {
    Name = "performanceperftrack.admx"
  }
}

resource "aws_s3_object" "printing_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/Printing.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/Printing.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/Printing.adml")

  tags = {
    Name = "Printing.adml"
  }
}

resource "aws_s3_object" "printing_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/Printing.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/Printing.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/Printing.admx")

  tags = {
    Name = "Printing.admx"
  }
}

resource "aws_s3_object" "search_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/Search.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/Search.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/Search.adml")

  tags = {
    Name = "Search.adml"
  }
}

resource "aws_s3_object" "search_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/Search.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/Search.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/Search.admx")

  tags = {
    Name = "Search.admx"
  }
}

resource "aws_s3_object" "secguide_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/SecGuide.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/SecGuide.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/SecGuide.adml")

  tags = {
    Name = "SecGuide.adml"
  }
}

resource "aws_s3_object" "secguide_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/SecGuide.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/SecGuide.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/SecGuide.admx")

  tags = {
    Name = "SecGuide.admx"
  }
}

resource "aws_s3_object" "terminalserver_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/TerminalServer.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/TerminalServer.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/TerminalServer.adml")

  tags = {
    Name = "TerminalServer.adml"
  }
}

resource "aws_s3_object" "terminalserver_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/TerminalServer.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/TerminalServer.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/TerminalServer.admx")

  tags = {
    Name = "TerminalServer.admx"
  }
}

resource "aws_s3_object" "wcm_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/WCM.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/WCM.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/WCM.adml")

  tags = {
    Name = "WCM.adml"
  }
}

resource "aws_s3_object" "wcm_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/WCM.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/WCM.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/WCM.admx")

  tags = {
    Name = "WCM.admx"
  }
}

resource "aws_s3_object" "windowsmediaplayer_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/windowsmediaplayer.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/windowsmediaplayer.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/windowsmediaplayer.adml")

  tags = {
    Name = "windowsmediaplayer.adml"
  }
}

resource "aws_s3_object" "windowsmediaplayer_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/windowsmediaplayer.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/windowsmediaplayer.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/windowsmediaplayer.admx")

  tags = {
    Name = "windowsmediaplayer.admx"
  }
}

resource "aws_s3_object" "winlogon_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/WinLogon.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/WinLogon.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/WinLogon.adml")

  tags = {
    Name = "WinLogon.adml"
  }
}

resource "aws_s3_object" "winlogon_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/WinLogon.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/WinLogon.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/WinLogon.admx")

  tags = {
    Name = "WinLogon.admx"
  }
}

resource "aws_s3_object" "wpn_adml" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/WPN.adml"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/WPN.adml"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/WPN.adml")

  tags = {
    Name = "WPN.adml"
  }
}

resource "aws_s3_object" "wpn_admx" {
  bucket = aws_s3_bucket.bakery_store.id
  key    = "/lgpo/WPN.admx"
  source = "${path.module}/config-tools/ansible/windows/sec-baseline/WPN.admx"
  etag   = filemd5("${path.module}/config-tools/ansible/windows/sec-baseline/WPN.admx")

  tags = {
    Name = "WPN.admx"
  }
}
