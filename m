Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569C3364054
	for <linux-coco@lists.linux.dev>; Thu,  5 Mar 2026 22:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772749615; cv=none; b=gPNdKba9NkfgeBZDxvXfMIIWMVsyoCiVDva42yU+mvBIQoLn5rTo2Ylm1TGnJvSZDMtgYcFOhflhzev0yfPtRkISyooL4r2d9s5binzzk8I9p9xYTBToka8FTRSVJbBJNxanpXBJxT9cp8f6CsWk6VLEU/+KdJmMcnEFAmbtfcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772749615; c=relaxed/simple;
	bh=ckC8e9ScrPoWujr5t7OMT2iQ/3KONFj76Mv1ZZOmSHY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Vhh12Md5ku0j1P+w01UQuEaymlxQ27G9ZnZERzGwmGmkiZzhYZ5LMAejXknfInuDc19z8QTIodnd8EHlbIfcYLJg4KDkC3qrn+0vL29Y0vKeD8Dyh03XLz1rLFqKCKL3mLOmOYoN7wDL9PNk+JKRKmvkkpIVx+/dm3sJf9CXxyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hdjD0PoT; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hdjD0PoT"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-7d4beae6581so97493822a34.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Mar 2026 14:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772749613; x=1773354413; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RM07twrcR0dXNaC+0E22+0adMf36n7my8fIoC64KCh0=;
        b=hdjD0PoTojcxyNt+in/I3Cf15rxeMhYaMI+qmv4R8r7X8iA0hXnVZrDUmxRmESF/yR
         fGNU7wguy6aTzE2pH4eqgtyy8Z9f7h2HytPA2SDQ34J+VN1iQDgqURPLexjeRhYaGjA5
         rHJenH5j+41fAmaWFiaRQ6ZAngJ7wXaxqM2otRpt4VPZGnTP0h9KIyPwL/cfyIM9v418
         8pu8msAflMooU2iW+xR6f7nK39JI62y4XGW6XgxPdoofuPoCNLEIbkipXsUkZqksQhU+
         kJ9/Wbo4IytqlqpRlc8CLQ913DLgtALHAAyQzesp4x4xkv66ddzqeeK+dIL1o0dwnZvm
         TrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772749613; x=1773354413;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RM07twrcR0dXNaC+0E22+0adMf36n7my8fIoC64KCh0=;
        b=FBGFFLuXrBNCcWdNb/DjVfRgescuRrzW+YPQgZ6WI+aMuSIBJzu/tvbqFmPi25CzeY
         3cRIdSkR2Qrun+lFSyK9e2MFX6U4EcfEFBdpUpzlrC7Q2vOJ44lMGfyCOkK0FqM8TltK
         UejbCUoiq+MstnYminFDe1378d3Ic0EBKEMeJQlGeihUVlG4Jde+DIRF5pNdAIrpYwiT
         A27R4g5vqsYrda3NOoyceBQvzJ0G0y4oYiNH6dHR6mmDpoYW/0lrQSkBDpsCbJawEDx7
         +cyd+NOmZCIcxJdgxuBJHQlY6iP3bgfLpm34nTT07tWrYNfk/z2lKLGYP6xKCPPQIvir
         F5Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUrryxJkwtELr5SC7dMluAVycgcbCxYKI5KCWK1hSwqLaESMdOvRpuUX6kFoGcYyAkVzdwiO6yNlVen@lists.linux.dev
X-Gm-Message-State: AOJu0YwLCSuD5n7dkdTA5YkkqdvWV9scKkBsu05HAe0Gm8T+yPqdl3gB
	lc7FpB7VSPGJafuliwByTeFz1EEJKIFuu/m0L+QYrlirEiR2Vgqr8+ANySH7vbcePxk/d5H6Bwr
	zTQ==
X-Received: from jablo9.prod.google.com ([2002:a05:6638:aa09:b0:5d1:5187:4cc8])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:228e:b0:676:eb1e:df29
 with SMTP id 006d021491bc7-67b9bcc0e80mr106951eaf.31.1772749612963; Thu, 05
 Mar 2026 14:26:52 -0800 (PST)
Date: Thu,  5 Mar 2026 22:26:25 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260305222627.4193305-1-sagis@google.com>
Subject: [PATCH v4 0/2] Extend KVM_HC_MAP_GPA_RANGE api to allow retry
From: Sagi Shahar <sagis@google.com>
To: Vishal Annapurve <vannapurve@google.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	Michael Roth <michael.roth@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Sagi Shahar <sagis@google.com>
Content-Type: text/plain; charset="UTF-8"

In some cases, userspace might decide to split MAP_GPA requests and
retry them the next time the guest runs. One common case is MAP_GPA
requests received right before intrahost migration when userspace
might decide to complete the request after the migration is complete
to reduce blackout time.

This is v4 of the series.

Changes from v3[1]:
 * Rebased on top of v7.0-rc2.
 * Switch "if" statement to switch-case in tdx_complete_vmcall_map_gpa()
   as suggested by Michael Roth.

[1] https://lore.kernel.org/lkml/20260206222829.3758171-1-sagis@google.com/

Sagi Shahar (1):
  KVM: SEV: Restrict userspace return codes for KVM_HC_MAP_GPA_RANGE

Vishal Annapurve (1):
  KVM: TDX: Allow userspace to return errors to guest for MAPGPA

 Documentation/virt/kvm/api.rst |  3 +++
 arch/x86/kvm/svm/sev.c         | 12 ++++++++++--
 arch/x86/kvm/vmx/tdx.c         | 28 +++++++++++++++++++++-------
 arch/x86/kvm/x86.h             |  6 ++++++
 4 files changed, 40 insertions(+), 9 deletions(-)

-- 
2.53.0.473.g4a7958ca14-goog

