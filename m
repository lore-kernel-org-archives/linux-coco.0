Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E11B28FFF6
	for <linux-coco@lists.linux.dev>; Sat, 14 Feb 2026 01:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771032432; cv=none; b=gSJR+9xzwkk1LywK7xQ+xv7x0DlEvk6Mu6DhYLrVJ/gv2hVrXBVD5E25sljq0NwNnuIRkqxBZOCGpsZJTiXovGiwRR79fO6mRx5+WIOjCRmjWhAsSbLyrkADPSa+o5D5K4k8rnVOyNxaYmVc67y7U30hMpzADao6ta7bZibHZtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771032432; c=relaxed/simple;
	bh=uHRBT0xtiTkIZnuHIJP94+r3B3sUuzdcITtjzmdIZxM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qHRKIatde2p37LezY0i5MNLxz3YvfItLdbHWnzGUkYz5VP6mdm3C0lN9pQPgtyc25RwsR3WLfwy4MF7zEnBIBX18y2X2+ah4viYAyHgjyk1dYPtFJg0J+50xps8gHwbV7iNqv/jprxOjn3A57jHudhPqAafrzveqtsybiwtxmhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DwblIIt4; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DwblIIt4"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a8f8c81d02so14261995ad.2
        for <linux-coco@lists.linux.dev>; Fri, 13 Feb 2026 17:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771032429; x=1771637229; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RDtoclkNp4NWg025cIg81rPLzczzFSfFPqIQKO5nW/E=;
        b=DwblIIt4EcYbXdqzZ/MpUwWctj7o0rrAkAVvcrv+zybcaQAY0Y3NMX9d6cw3rgkAoP
         HYRcpSLDrBEeq0+knZsrtl0VesJdUguhy3TMg/ZH1VlkZ+sPDGZX87cF9TEofgf3huiA
         rxCq1aoDDZXoAEXwsP3jMiS7mxhq5+dgddK8qVb+u5G7prI4ur6Z/lpmJDBUhgbA6y78
         Qv5cdtMsDywbZ3tHHqwhDO8nHCTrc7NqdxOG21dYMgjcBgFfh2cvSu5bD/DuP9NOIW/l
         CTPVhJsbMvtFC+NLrvkftdtHZePPy55xJr9Lr4wAnI1oJ5kQE9jS5thhj1cusOU5AgAS
         65fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771032429; x=1771637229;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDtoclkNp4NWg025cIg81rPLzczzFSfFPqIQKO5nW/E=;
        b=fWn513wLYihNnMwTKT/hNThE2CeUyTX+2KhSDLmZyz70U1JwN1R0k2eDQkSaZ7u5Xc
         V8Gyu+GfaUBgAuSUNVH7PclXAxv61TFH7y1L3nQtRrv/mgY6/psPIIgDg8vCUANkQd0h
         yW0vixrt3pWE4tbec+OS9TzMXZ924HSwJnUhFezt29nqySgm54actwJkJR6cjFIfKDkP
         dZiclLAWnN26vZcG3w4y1A6kjaY1/Znf9usJNNniGyfnnf56jA34xRlxYWjkdZa3gRAY
         l/oXUZ87L7NBfzRPqXdpwLZiqSy/OSDYdCcwOG4toN2FkPPr9UvgnhN3FiQmBCT/EGyp
         rcdA==
X-Forwarded-Encrypted: i=1; AJvYcCVIe/CXcHC5IVhCwDrby4hek4fpG/EQmppw+oPRvR+iOMX6MvDQ6oDmCsv4c9D6Ls0AMgEAzS0rKBVh@lists.linux.dev
X-Gm-Message-State: AOJu0Yyjyqc2xiSDzJcu1OiPdR6+yMIhg5Y+wQdiOApbimQehqiesqjl
	VxNVTWZP7xghR15iGmi//A6K1GyLeBgMfiymCQAEbeNUdrpErSr+AgNvN3knQzGEgZWbwxrUIuz
	brA+kAA==
X-Received: from plil7.prod.google.com ([2002:a17:903:17c7:b0:2a1:10fa:4a4a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f609:b0:2ab:230d:2d96
 with SMTP id d9443c01a7336-2ab50521f49mr39916555ad.11.1771032429246; Fri, 13
 Feb 2026 17:27:09 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Feb 2026 17:26:48 -0800
In-Reply-To: <20260214012702.2368778-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
Message-ID: <20260214012702.2368778-3-seanjc@google.com>
Subject: [PATCH v3 02/16] KVM: VMX: Move architectural "vmcs" and "vmcs_hdr"
 structures to public vmx.h
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"

Move "struct vmcs" and "struct vmcs_hdr" to asm/vmx.h in anticipation of
moving VMXON/VMXOFF to the core kernel (VMXON requires a "root" VMCS with
the appropriate revision ID in its header).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/vmx.h | 11 +++++++++++
 arch/x86/kvm/vmx/vmcs.h    | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/vmx.h b/arch/x86/include/asm/vmx.h
index b92ff87e3560..37080382df54 100644
--- a/arch/x86/include/asm/vmx.h
+++ b/arch/x86/include/asm/vmx.h
@@ -20,6 +20,17 @@
 #include <asm/trapnr.h>
 #include <asm/vmxfeatures.h>
 
+struct vmcs_hdr {
+	u32 revision_id:31;
+	u32 shadow_vmcs:1;
+};
+
+struct vmcs {
+	struct vmcs_hdr hdr;
+	u32 abort;
+	char data[];
+};
+
 #define VMCS_CONTROL_BIT(x)	BIT(VMX_FEATURE_##x & 0x1f)
 
 /*
diff --git a/arch/x86/kvm/vmx/vmcs.h b/arch/x86/kvm/vmx/vmcs.h
index 66d747e265b1..1f16ddeae9cb 100644
--- a/arch/x86/kvm/vmx/vmcs.h
+++ b/arch/x86/kvm/vmx/vmcs.h
@@ -22,17 +22,6 @@
 #define VMCS12_IDX_TO_ENC(idx) ROL16(idx, 10)
 #define ENC_TO_VMCS12_IDX(enc) ROL16(enc, 6)
 
-struct vmcs_hdr {
-	u32 revision_id:31;
-	u32 shadow_vmcs:1;
-};
-
-struct vmcs {
-	struct vmcs_hdr hdr;
-	u32 abort;
-	char data[];
-};
-
 DECLARE_PER_CPU(struct vmcs *, current_vmcs);
 
 /*
-- 
2.53.0.310.g728cabbaf7-goog

