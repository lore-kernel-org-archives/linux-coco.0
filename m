Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672222;
	b=h/Lylu1q2kAP9c2GQ1q5LNPtjzOXMdzUeZkOqHh2aYp3RB1rqlXKSX28o7vgwwjlP74p
	 wbzjBw1SkqXZN4R5MsKQZ62Te1OXQxjNPq5Otf2L4mL4x4g1lQisN9DMygEv6f3LHI+f5
	 murV0r1HrdxWxa8rv/lJNWH9+jTi4IPCCEaUpMQOhNi8ncVbEtp9S1+qkjm/q3uqqfKs8
	 aTwGltbl4O3uQZehwxKSEJCxvra6Tp5rT/7e/vGTtUV7bvb2dKLJlNVz+jTQOIS34HcHs
	 uR9drGKqVWK9X+moU7+qUV6Kfda8+8Gr8lq6obvgnEIQKrt6eMllPmOfdkYvtjN8/yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IOGgt4lAkAMwt4N6sT0llhti/KNul9J7tc5dogJ2lwc=;
	b=szuCnWGS8K9b8hIGe9Uv54m9+51166bAHbWGmpcepHFRPleMf0OH6tZTjKWcx7QWzrh2
	 tKB7/2J3pWXJTx/Eb/ymD4JhxXn0UhBd3mbWD75AjLnYlJu3uuTARtqYOLgbZ03+BTuyF
	 9DkzBzclgIo/6zbiEKweV49BCBmyNF8QQd7Jm+fCaGc0L306SHm+ba7BJPcOa6/BCe4ya
	 2UoVQsoTOjBYOSOJkyhpD134AOWON3e36nLAQSBAtDfe2goxnoWSzA6QNDqr4kfFylfKu
	 u1rcG2LRyCtwTj9ZjG2HSK/R/OEwQ/vXi0/WaYvSGshwCmr+HLtfG9FrmNFTnx3KQWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtv1XhB6;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2CF606A327
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 02:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2CF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtv1XhB6
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-89f85edd210so1377862b3a.2
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 18:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672221; x=1794277021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOGgt4lAkAMwt4N6sT0llhti/KNul9J7tc5dogJ2lwc=;
        b=jtv1XhB6Mtiedz+uSY+B7vauO+un5UHrrC75CMpD16Eh+J5wsX3jq7Z8V3uzplreht
         JYBYdfaN1SAGAPOZcXqHwe7Qnj6+nSHGz3yf/IqF+RWrcl9S7Aaa+s34B1VPoiuhtj1z
         kpIaIaOww4mfnEH8kpJe5L+BeDd7f5Za8B5a7EYyzgQXNxMAwdpUHt107y6C1surZpLG
         nG9/wsySr6zxeTzxlOr/A933+29aPlVTqi83fPr2z5higDqAGPv4Tzsi+EgQdBd/8lNE
         yDKCu7aQvedsWfx5p94P3YIFmgOE1UznWjvRWKhED4uXllrOOclAK7DWYx4PJbOGXRd7
         kijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672221; x=1794277021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOGgt4lAkAMwt4N6sT0llhti/KNul9J7tc5dogJ2lwc=;
        b=X3rAx1tBKFZiFMSFexgDRGwJ+yZztePxbIsCuWHYABCaHWdCfC4aZ/SdTEIo8GLDmZ
         saE2Mf7xegIcD/O9TnNIvazjR2Q05IGXKzPrfL0vAip6gwWjlZ2/TJvv8vOfB9w1zEii
         rgw2aqMM5TODa5nCtHYYqO5nD1u4BN418YD2ou7V5WBajipeT9iQ12NlhkOy89Rie/8O
         C5ghJH1jcnJxFjUKMKrjaSqMJT/P9AOW6V66XQP3sXnHghzz02hhArXZKvypL1KspRSS
         wn8VnIz1fvC3ZCvguoluUtzRwNlHO+LYScTnAxEsU2e2Xr8IFc5rRh72JfcHzqyApTXE
         4mYg==
X-Forwarded-Encrypted: i=1; AKwUvBzTL9RS5zJi+jaarQKpVk7RFMgf+4KOZEtsZIyXQFFNnGudyQbTqiRh3aohqo5f0LZ7Y+CcFT+be/hd@lists.linux.dev
X-Gm-Message-State: APuU4Z98Iye8mnEhkee3D9lsKusXhUW09KOQPDZml9RZZElMJI5pfmH8
	mXpdj1fhC4f0HTgxkI5WWHQpzV1d+yRH9hxtr2XlFdbuQ+GxfFS/FrTp
X-Gm-Gg: AYBFou1p3As1KpXQ1kmYKKXnLHuZKD1UvOEDQWs3/tZBDscvKEhIk0GnNawhAfDTFCb
	y0akMl1mTFzd6p9jAt6lLpQZZlZ+2T09F2c5TvMEKDSco6D5Suna0md7PQM4tnUXXVrQ6U+xHSo
	1pplrbjWqCDOxh0Qxq/iibRqc2xf9jwJY1/dcMASdDw60h18zX5oaIAM3rTkHSjdz52hUw1uZml
	R3qMA8o3/xnYsef5D+W+vhWqKrXPs6EH1VZAVvZVdy63t1/XPHMWUMY/NSeL5I9pBvN0dSjQN7C
	3IHUYS4Y/49SgvmRue6jRD3e/FPPB7Hc43m00qCBFMRfRNQn378mB2tcJn7fHVCyVRMZnKIkWB6
	7dHxMMdid4BDS6rL6Qc/AuqboorBMUSCIaVOy/gQaUI/ynOCWLhs8qrwCx/mlJzZ1kmSSWqnby8
	kTL+C/cvLEsiTAGPAa1HVh4NmaeDAIQVfefgiq+00h0ihOTJSiB0oADD5yFZPDIvNmVDsC/0B4/
	RMZ5yRg/VLkva/yE09++UFhrxzwtRzRDMBB3IjmErp8tjpFvKULpB/DeADWSN/Hy9t5FRtz+gnK
	p5FLbWZLn9UBld7xWmOCIo9mvyXch+B4C4IsJK01Wpw=
X-Received: by 2002:a05:6a21:3b49:b0:3e1:d379:f3b3 with SMTP id adf61e73a8af0-3e928fe8569mr7948733637.77.1793672220726;
        Mon, 02 Nov 2026 18:17:00 -0800 (PST)
Received: from iZj6c0kydq3fvfrtx5kta5Z ([47.86.51.122])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb36448182sm490457a12.6.2026.11.02.18.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:17:00 -0800 (PST)
From: Challvy Tee <challvy.tee@gmail.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	kas@kernel.org,
	dave.hansen@linux.intel.com,
	rick.p.edgecombe@intel.com,
	vishal.l.verma@intel.com,
	kai.huang@intel.com,
	seanjc@google.com
Subject: [PATCH v5] x86/virt/tdx: Gate TDH.SYS.DISABLE on X86_FEATURE_TDX_HOST_PLATFORM
Date: Tue,  3 Nov 2026 10:16:50 +0800
Message-ID: <20261103021650.924302-1-challvy.tee@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <09c311c6aae214c04a9a55ff6456d7abfe82c319.camel@intel.com>
References: <09c311c6aae214c04a9a55ff6456d7abfe82c319.camel@intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and
kdump") made native_machine_crash_shutdown() call tdx_sys_disable(),
whose only gate is compile time (CONFIG_INTEL_TDX_HOST).  A kernel that
never initialized the TDX module therefore still issues
TDH.SYS.DISABLE.

In VMX non-root operation on a SEAM-capable host, SEAMCALL causes a VM
exit instead of a native #UD.  KVM injects #UD only since
commit 9d7dfb95da2c ("KVM: VMX: Inject #UD if guest tries to execute
SEAMCALL or TDCALL"), first released in v6.18.  On an older host the
VMM gets KVM_EXIT_INTERNAL_ERROR and the vCPU never resumes, so
machine_kexec() is never reached and no vmcore is written.  Kdump is
thus broken only in guests on SEAM-capable hosts whose hypervisor does
not handle the exit; plain kexec is unaffected because tdx_shutdown()
only runs as a syscore op, registered after init_tdx_module() succeeds.

Gate the SEAMCALL on X86_FEATURE_TDX_HOST_PLATFORM before issuing it,
the way paddr_is_tdx_private() already guards its own SEAMCALL in this
file.  Without that feature the module is never initialized, so there
is nothing to disable; on a TDX host the gate is a no-op.

It also decouples kdump from the host KVM version -- a guest cannot
require its host to inject the #UD.

Fixes: 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and kdump")
Suggested-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Vishal Verma <vishal.l.verma@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Challvy Tee <challvy.tee@gmail.com>
---
v4 -> v5:
 - Update the subject to name the X86_FEATURE_TDX_HOST_PLATFORM check,
   as requested in review.  No code change.
 - Add the Reviewed-by tags collected on v4.

The reproduction data and the host-side KVM log are unchanged from v4:
https://lore.kernel.org/all/20261102073244.919864-1-challvy.tee@gmail.com/

 arch/x86/virt/vmx/tdx/tdx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 96ced0494b68..9b01131f7b7b 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2321,6 +2321,9 @@ void tdx_sys_disable(void)
 	struct tdx_module_args args = {};
 	u64 ret;
 
+	if (!boot_cpu_has(X86_FEATURE_TDX_HOST_PLATFORM))
+		return;
+
 	/*
 	 * Don't loop forever.
 	 *
-- 
2.52.0

