Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F294A13540B
	for <linux-coco@lists.linux.dev>; Thu, 21 Mar 2024 16:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711040383; cv=none; b=gkmWIOSE6NBuU6h11HPCvg4uUztIg2e29gvoe9xk1OY2jcRgtiTAHO/0e+Sdw3e8rqlqQlPp7Xhfs3BE+dMnSmPxy4YW/zogC7e14v07NuQQFCpLur00e1Vup3aK/1HueGwOldV8v4FwiPSLG3hW+c4gsTJNJQ2KXcjvyk6Mqw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711040383; c=relaxed/simple;
	bh=oprXBsEMb82JAendFlEaUtFMpOly2KMb5BVycREDcK4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=isSTvMev/1KXCz8D2pyO/0OYlN1t9LRBI4tGwo3NmDduWof+70065HBH1dJzsj6XvLqzlQ81sVftlpXmwxAWvST0WWesFe8MC5xr56l+TyAdObDsRIzhihSlhGpmuwRmVlo6WZX8naLcUmG8uPUH44iUZXI37K4Xp4W8I3UQALI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--qinkun.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vu3Rrhfl; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--qinkun.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vu3Rrhfl"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcbee93a3e1so1901085276.3
        for <linux-coco@lists.linux.dev>; Thu, 21 Mar 2024 09:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711040381; x=1711645181; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ejdsIgCs0lNb6RId6zCAz77FLolzFUTJO8XFtWSKmc8=;
        b=vu3Rrhfl/Qxd9gk6I3yb3Zksq6A3V1tDUPf8jApRgIGitOppyw9OBa9TmakWTg/vMB
         GcTv4r8TWbun8X2Vn6IiUDpM/KP6ondvOjQpcp4NH8jdTBWYM7pDgHfWTwkbelkuQ1y7
         jexxaQiqxUD8w9lgQ3H4b3+kvX21N1urXBRac1w0bNsqVQWKk7K9EAYW4RaRHsdtY1gF
         mt7HZG+loEKLcm9EvndhcXcVGxWGURCoUrGDlWoDT/nXvXIpS1l6Ouk97Veg6BaxZqmJ
         MRy/7NYcElN4bBmYL+Ga3Ebcxf3FhqlaeHSTQK5msBbGVHaH7qvsZm5uyD96gC5Qjnw5
         B2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711040381; x=1711645181;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejdsIgCs0lNb6RId6zCAz77FLolzFUTJO8XFtWSKmc8=;
        b=Du626ibqJt9XQo3n3gSMqCnKzoRdqN/BxeGIOYKaYWtwEL38gjcniXXhxOXFMLtANN
         wWdrCVF8qOCK0gAU309+fx+edAp0DfdSPInXXJ/TVJkYxJ7zWCbjf49SrySTtIMrLGkY
         9UeF/OCu0dJO1s5UKSWyGJd86R5FUvjx8hzvu2ESQWgyJmiF309wFbdQ2c2J82Kddz9c
         FDusHaDT8bXLIXY+SPcx61JylRSLUFHVR66F3Paq5ePc6Sz1O1W0dtzaF3JUsriJ+PaQ
         lCoh4fimvGkocLRLyd8mF75j5m7M+cm891/K2K2G9wblsMdZJTeAuKkegH/DLZ0g3lJn
         tyTQ==
X-Gm-Message-State: AOJu0Yw5IZVVjFSo0Kl1Nux3pr5tNs6UXq/iWwVAoiKvqYhexsONRfbC
	74YAtjPYyycQkkxmExkumqQKkscoKuMj9wj/acwRuHjyF9VMUBqPnwU5bY9w4s2I3HBYzlh9Vyq
	hVg==
X-Google-Smtp-Source: AGHT+IHKb2wvuObmot2f8B27NKxbHC4r8SBwwqsePGxDouTk5yUjAODv5egoOIJzYDlUP8+dQp3Sdivu8UA=
X-Received: from qinkun.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:6ec])
 (user=qinkun job=sendgmr) by 2002:a05:6902:11c4:b0:dc6:d890:1a97 with SMTP id
 n4-20020a05690211c400b00dc6d8901a97mr1144253ybu.9.1711040381010; Thu, 21 Mar
 2024 09:59:41 -0700 (PDT)
Date: Thu, 21 Mar 2024 16:59:04 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <94521f20aa2872c1b8f018b7db31eca4a2b8222d.1711039409.git.qinkun@google.com>
Subject: [RFC PATCH] OvmfPkg/SecurityPkg: Add build option for coexistance of
 vTPM and RTMR.
From: qinkun Bao <qinkun@google.com>
To: devel@edk2.groups.io
Cc: linux-coco@lists.linux.dev, Erdem Aktas <erdemaktas@google.com>, 
	Jiewen Yao <jiewen.yao@intel.com>, Ard Biesheuvel <ardb@kernel.org>, Peter Gonda <pgonda@google.com>, 
	Dionna Glaze <dionnaglaze@google.com>, Qinkun Bao <qinkun@google.com>, 
	James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Qinkun Bao <qinkun@google.com>

The UEFI v2.10 spec defines the protocol EFI_CC_MEASUREMENT_PROTOCOL
to enable (for example) RTMR-based boot measurement for TDX VMs.
With the current UEFI spec=E2=80=99s =E2=80=9Cshould not=E2=80=9D wording a=
nd EDK2
implementation, TPM measurement in TDVF is disabled when
RTMR measurement is enabled.

Mutual exclusion of the CC measurement protocol and TCG measurement
protocol breaks backwards compatibility, which makes adoption of RTMRs
challenging. A virtualized TPM device (vTPM) managed by the host VMM
makes boot measurements visible to the VMM operator, but this is an
oft-requested feature that users can choose to accept.

The TPM has been a standard for over a decade and many existing
applications rely on the TPM. Both inside and outside Google,
we have many users that require vTPM, including features that are
not easily available via RTMRs (e.g. sealing using keys that the
guest OS cannot access).

This patch adds a non-default build option to allow the coexistence
of both the CC measurement and TCG protocols. Not included is a
vendor-specific measured event in the CC event log that indicates
whether a vTPM is attached or not.

Cc: Erdem Aktas <erdemaktas@google.com>
Cc: James Bottomley <jejb@linux.ibm.com>
Cc: Jiewen Yao <jiewen.yao@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Signed-off-by: Qinkun Bao <qinkun@google.com>
---
 OvmfPkg/OvmfPkgX64.dsc                               |  9 ++++++++-
 .../DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c    | 12 +++++++++++-
 .../DxeTpmMeasurementLib/DxeTpmMeasurementLib.c      |  6 ++++++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/OvmfPkg/OvmfPkgX64.dsc b/OvmfPkg/OvmfPkgX64.dsc
index 56c920168d..9bcee45047 100644
--- a/OvmfPkg/OvmfPkgX64.dsc
+++ b/OvmfPkg/OvmfPkgX64.dsc
@@ -32,7 +32,8 @@
   DEFINE SECURE_BOOT_ENABLE      =3D FALSE
   DEFINE SMM_REQUIRE             =3D FALSE
   DEFINE SOURCE_DEBUG_ENABLE     =3D FALSE
-  DEFINE CC_MEASUREMENT_ENABLE   =3D FALSE
+  DEFINE CC_MEASUREMENT_ENABLE   =3D TRUE
+  DEFINE CC_MEASUREMENT_AND_TCG2_COEXIST  =3D FASLE
=20
 !include OvmfPkg/Include/Dsc/OvmfTpmDefines.dsc.inc
=20
@@ -99,6 +100,11 @@
   INTEL:*_*_X64_GENFW_FLAGS =3D --keepexceptiontable
 !endif
   RELEASE_*_*_GENFW_FLAGS =3D --zero
+!if $(CC_MEASUREMENT_ENABLE) =3D=3D TRUE && $(CC_MEASUREMENT_AND_TCG2_COEX=
IST) =3D=3D TRUE
+  MSFT:*_*_*_CC_FLAGS =3D /D CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
+  INTEL:*_*_*_CC_FLAGS =3D /D CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
+  GCC:*_*_*_CC_FLAGS =3D -D CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
+!endif
=20
   #
   # Disable deprecated APIs.
@@ -1045,6 +1051,7 @@
   }
 !endif
=20
+
   #
   # TPM support
   #
diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLi=
b.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
index 73719f3b96..4c9bc8ab4a 100644
--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
+++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
@@ -325,7 +325,12 @@ Tcg2MeasureGptTable (
     }
=20
     DEBUG ((DEBUG_INFO, "DxeTpm2MeasureBootHandler - Cc MeasureGptTable - =
%r\n", Status));
+#ifdef CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
+  }
+  if (Tcg2Protocol !=3D NULL) {
+#else
   } else if (Tcg2Protocol !=3D NULL) {
+#endif
     //
     // If Tcg2Protocol is installed, then Measure GPT data with this proto=
col.
     //
@@ -493,7 +498,12 @@ Tcg2MeasurePeImage (
                            CcEvent
                            );
     DEBUG ((DEBUG_INFO, "DxeTpm2MeasureBootHandler - Cc MeasurePeImage - %=
r\n", Status));
-  } else if (Tcg2Protocol !=3D NULL) {
+#ifdef CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
+   }
+   if (Tcg2Protocol !=3D NULL) {
+#else
+   } else if (Tcg2Protocol !=3D NULL) {
+#endif
     Status =3D Tcg2Protocol->HashLogExtendEvent (
                              Tcg2Protocol,
                              PE_COFF_IMAGE,
diff --git a/SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurementLib.=
c b/SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurementLib.c
index 6f287b31fc..b1c6198b4b 100644
--- a/SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurementLib.c
+++ b/SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurementLib.c
@@ -261,7 +261,11 @@ TpmMeasureAndLogData (
                HashData,
                HashDataLen
                );
+#ifdef CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
+  }
+#else
   } else {
+#endif
     //
     // Try to measure using Tpm20 protocol
     //
@@ -287,7 +291,9 @@ TpmMeasureAndLogData (
                  HashDataLen
                  );
     }
+#ifndef CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
   }
+#endif
=20
   return Status;
 }
--=20
2.44.0.291.gc1ea87d7ee-goog

