Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375342;
	b=Zen8ucWRr0et/KTXhvSRycIIJKnAKosvKuqNJpT2NhCyVFvUr6KCeuaogVnE/u99UUOn
	 SJSQVZaeBMlLgbZ5kDBX5nFEcL0AInBTXEMtEjJj98nWsi5KDgABcR7ivFHTBkxWbjRbH
	 UyDWF/SfGNDwleYiMIvVfPPDnjRBtyt8bV/RJpAnaxG2f7EFuvl0/DHax74l1xZTGYdRc
	 qD3exIXRfrjXPukIQGY+65rCQMAd5Nocud0uQkPM5r/x9LcdHPbzS/YQbAFCdhYxYbeSh
	 5XBGierg7SAimjxqUEWZ0OeHgD9tVWVn6C78JgmgQn9inSaV6zY6hKenbMFd4f7iQ0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d0SM8LOepW7XUMwU+ZDps/Wc1zMBVt4O8GKS2q6Z4u8=;
	b=UQSNWvT9ZZ2YxkjlHEoYNGu1FqgiKqNJK4J47yJyK6nt5yBeq3B86JPdqOt2eN50AsKW
	 K8bwhq3gE2b1t4TlJ7ZOnFf8ZDncl4MnO2IDNJ1MLzSQ9/FcA5nEFXlq6dajM2BxjvssC
	 K6NAr3IhoAcJWSjjD+gTnr9X1tuPD+/UCt1pI3+7J43M1itbvX0LXd7x6PoVbd/UOq32B
	 ceGZiGXM0qNZ5GRCB4l9jaRFcZjR9DlN7OCKmNnEMtSFWQBAyJBW7gtDQ+o1AoDJD1+pc
	 5juzym2/5JdSKVGeBKHd61Wkack4XMe7XPwwFbqmPrQXNQA+juosnE6iwKE6CggbEaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=injfLSpH;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE99606A322
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 15:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE99606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=injfLSpH
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e96502e447so8384295ad.1
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 08:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793375341; x=1793980141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0SM8LOepW7XUMwU+ZDps/Wc1zMBVt4O8GKS2q6Z4u8=;
        b=injfLSpHBv3MZ6dRlVOEAHIfNI/VXZ7gLnjNwyHRQva9O/m8G+qs9goJlE0/WwwC9z
         bECublmeILUgikfurBxSn4MFEjDCnCDOe7fAG99pqXDwd1r+kj8ssGJCZAqlHGFWHIBt
         58Fg6ywEVuCt8QnPtM5mjR+tLnER3n6y9cWUSzVv52yOBkdR1nI/j56GcPr/yev2k4ss
         hUM+bETD0ktBlzB7Om4AE5HwOjS2U6nCA9IP9gbw3ZSvmb6YVGF9sMyvmPy75GOdmMWW
         XowVe+0BAVBVHeb7uzroGwRGOAmQc0BywXrhSwc/VuhUxPua4ud8hEnKQxxqHhKDT6TC
         o3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375341; x=1793980141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0SM8LOepW7XUMwU+ZDps/Wc1zMBVt4O8GKS2q6Z4u8=;
        b=fUbPDCX/9X1fJphshX/oG5M4clh3fwCChXVlPwdCNsk5x9cSXg3JmOPRjJ/oJIVjrX
         v1ma1raO+0pcbz/nB5IB1tG/Vzi5GK9B3MzRrjIPtVeg0bzp1NsEQEuoVHt7R2qMpixX
         W/A+cpFxR9v0xsK+WGXTm2GgNRwXe8HJWgBT8uVsIyVub+YxvQqu42LPmpmQr0+CQA1r
         LMrylG1EAZIKviVPEYtxgYcUOgv/YkPKuDAa5CA8c3gFWF5So+wV6v9sq14eQJPr7wTF
         /AhsNjTdrhs35pvckRibCcmlpNJbfxBPvNlQuT/jw3aWtIhrMeeUXGvU+JEWtt4Gz0Lq
         +E2w==
X-Forwarded-Encrypted: i=1; AKwUvBwr1qADlRoW8Hf7ZF+NQwu+caBkErpZ2IgPCLc8elNAZqm8iENRP6JfqjtI28yfjeD0OG92p3ZBMCJy@lists.linux.dev
X-Gm-Message-State: AFq9FYI1iKA+uCKSf1HtO12B5eFOkzR9wwvcNvITrt2HlJNg0OfwGbXW
	YJDVIm2ILwuz30fvnUQhA7Y1ukejEmAOXM1805G2n1tqrRh0PbyE0Fpf
X-Gm-Gg: AYBFou2eW9r1KvydZXR5f6BerQ795NE3BeD7Nw3ePDRBzCwXQnqmYdsQaEovjk9uEJU
	NCqkWSwpXdfDr7WxRvvycr29WY0UuuWtaiFOgb13KIxsv9eVNQpopBeb73p1kSA+ZMpR1DKRwJW
	SxQynbxHhT8UVvMueS70CyYawM6r+gI44P8cXmsCk6WKp6jrTy0oJ/oNZ/Z04esGryLxEMLNyYI
	EMNUj/uml/JP9wxgqh2DDnIlK2Ygftb1l75tqiRmtuj2/znID4ydTlwM5+fvkfly7ulxES4f6p4
	r5iWrRENt6GSrlimDyEL/gLTUU9bUyvt2o/lNomQGAa39/5LapWnTjqLP50Gbi+jHynW3zNQRPx
	i56oGw6p5ifA5DYLzlmrVC8KaFSlp9fqCi7uLlODDYHqFYlRFB2bG4KdFLSXuCd0zbsEeH5pSLl
	FpItYv2XkNCBBAGoh4o6AOdCZFqYD72zzyaoSV0/KoQCBOa6XTNx64ypopruSclRdqhqM55/Yxm
	FZ3COgVrOjwz2D5NjxuO1aJGNepKLh+WLnY07t6NTM0lw69PzpbOqTNCwhemm1jr5VONE1oMaHs
	ycYO5t0qjTV6ogFvRjrFIgp/FxmQl6fPQy+kiblp22w=
X-Received: by 2002:a17:903:3c6c:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2eb3649bef0mr30087255ad.17.1793375341157;
        Fri, 30 Oct 2026 08:49:01 -0700 (PDT)
Received: from iZj6c0kydq3fvfrtx5kta5Z ([47.86.51.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39248621sm9426235ad.28.2026.10.30.08.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:49:00 -0700 (PDT)
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
Subject: [PATCH v3] x86/virt/tdx: Skip TDH.SYS.DISABLE if the TDX module is not initialized
Date: Fri, 30 Oct 2026 23:48:51 +0800
Message-ID: <20261030154851.907726-1-challvy.tee@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <auM3KKutfutAqgWG@thinkstation>
References: <auM3KKutfutAqgWG@thinkstation>
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

Gate the SEAMCALL on tdx_module_state.initialized, the predicate
tdx_get_sysinfo() already uses in this file: a kernel that never
initialized the module has no module to disable, and where it did the
gate is a no-op.  Doing it here rather than at the crash.c call site
also covers the syscore caller and any future one.

It also decouples kdump from the host KVM version -- a guest cannot
require its host to inject the #UD.

Fixes: 5b25f249be32 ("x86/tdx: Disable the TDX module during kexec and kdump")
Cc: stable@vger.kernel.org
Signed-off-by: Challvy Tee <challvy.tee@gmail.com>
---
v2 -> v3:
 - Rework the changelog around the VM exit mechanism from the review
   and scope the impact to guests on SEAM-capable hosts whose
   hypervisor does not handle the exit.
 - Shorten it and move the reproduction data below the fold.
 - Cc the author of the KVM commit now cited.  No code change.
   v2: https://lore.kernel.org/all/20261029094705.896693-1-challvy.tee@gmail.com/

Hypervisor -- KVM on all five (CPUID leaf 0x40000000), across three
clouds: Alibaba Cloud ECS, AWS EC2 and Tencent Cloud CVM.

Host log -- yes, from the Alibaba ECS host of the Emerald Rapids guest:

  KVM internal error. Suberror: 4
  extra data[0]: 4c
  extra data[1]: 2f
  RAX=0000000000000045 RDI=0000000000000045 RIP=ffffffff855422fe
  R12=8000020300000000 R13=8000000300000000 R14=8000020200000000
  Code=... 4c 8b 5e 28 <66> 0f 01 cf 72 05 ...
  check runstate transition: 'running' -> 'internal-error'

Suberror 4 is KVM_INTERNAL_ERROR_UNEXPECTED_EXIT_REASON; the two data
words are the exit reason (0x4c = EXIT_REASON_SEAMCALL) and
last_vmentry_cpu, i.e. kvm_prepare_unexpected_reason_exit().

RAX and RDI hold 0x45 = TDH_SYS_DISABLE and RIP is at the '66 0f 01 cf'
SEAMCALL opcode in __seamcall.  RAX still holds the input leaf rather
than a status code: the SEAMCALL never returned.

Reproduced with 'echo c > /proc/sysrq-trigger'.  All five have
CONFIG_INTEL_TDX_HOST=y, kexec_crash_loaded=1, a kernel changelog
naming both backported commits, and "TDX not supported by the host
platform" in dmesg:

  Microarch          x86_vfm  Cloud          Kernel             echo c
  Sapphire Rapids    0x68F    AWS EC2        6.12.0-278.el10    no vmcore
  Emerald Rapids     0x6CF    Alibaba ECS    6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    Alibaba ECS    6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    AWS EC2        6.12.0-278.el10    no vmcore
  Granite Rapids     0x6AD    Tencent CVM    6.12.0-278.el10    no vmcore

Controls, each producing a vmcore: the same platform on a kernel
without 5b25f249be32 (tdx_sys_disable absent from kallsyms), platforms
without SEAM support (Skylake, Cascade Lake, Ice Lake, AMD), and plain
kexec.

With the gate applied kdump produces a vmcore on the two Alibaba ECS
guests; the others have not been retested.  No TDX host was available,
so the no-op case is reasoned from the code rather than measured.

 arch/x86/virt/vmx/tdx/tdx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 96ced0494b68..a7eae7492c1e 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2321,6 +2321,9 @@ void tdx_sys_disable(void)
 	struct tdx_module_args args = {};
 	u64 ret;
 
+	if (!tdx_module_state.initialized)
+		return;
+
 	/*
 	 * Don't loop forever.
 	 *
-- 
2.52.0

