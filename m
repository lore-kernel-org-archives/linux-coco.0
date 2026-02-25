Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89220284682
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 01:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771982478; cv=none; b=ExkjNFPyWWvRDVpG0XSAWLy3ZmPX9/NH9fSJl9uVQiEPaJt59ozLcVfZ2IYjXG7ZlAfIhQEPuJ+esr07XT/mFDPbQ+ClyUxsPofSB5tKFbJmdYJdtTC8Ju9/zvj+BaDqf7SHJA3DPl5j+eO+1dbaaOV3J98gfh6u4U5bSxQIb5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771982478; c=relaxed/simple;
	bh=85i39OWQhVtkn+KmWvGw+H0S5qjkbaqht3+QjSVkoLI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I70zoYR1c62ZGlsHHvWhMiZ1Dxni/M0RVrWMV3b8/0UIrzltxKNLU5jD9s4w+il/2EW4E0efp8i9mcJSDfGclXQktpzHaPDA2DF4cK1m/G5NwphmP+vXHqFWlvBXEvMbhi/Na5e/DtlhFtrbsLN2/lJjlIAxMomaulI/ap7ACyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iGr9ueaa; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iGr9ueaa"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c70e8e7fe55so51234a12.2
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 17:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771982475; x=1772587275; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=PEtXjeylvLkO6uPQdY2VXz1BpnUVZoay6R5c8Z2Fy64=;
        b=iGr9ueaaKE6+0b+xHdUbF8isFrOD2uZdpmCaOkgwHxXqluz5UrLuDHfuQI20lmUnAi
         p7YBGNdnEqEXmzBRClV4x6KpQ0tliu3hVTVaxQACaWWhkJiQFDy6X6lZcxCB+A+ti8lK
         ewEvw9KwkTUNBIAGMym63hWIDRIyLNZCR+JDkRzSRGUGq4HbDVS1Zmvnk+aBDnWkPI8E
         58+biHcJPFek0uKP+JUl97KPtitLpqngcNx63OtglPz0l0YueMCu5tVKf4DVV2y3p/JN
         x3eNd9/PPRjRKRRJGjyg7AyIP3kXTDuBQlHOCLDSy+LqhREvzbUlnu0XAv/OszrFmei5
         rMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771982475; x=1772587275;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEtXjeylvLkO6uPQdY2VXz1BpnUVZoay6R5c8Z2Fy64=;
        b=g6PlUVwUzi3W4+Jijozj9xMqcnAs8ir8uId2XJos7rkzeeNU7kz8q59FYPa9AD4ghw
         dfciSdCT+Vno5ZUtHRtSRzAqePiI45eSHVe96K9lMG/c4Mh9y6+IpLUVS+KtXNMahuij
         A4QAAs2YnzMyUnebreTLQu01MWWwaHlg23Fk5EJ9elEEvKWu+mXeK/Q0oFVlmrSvk9Nq
         WE5AHL9ZWlibsonDspZ1DXxwBoNEEYAyJXeJZuKxq8r1sDIEQYRolaoMu3ZeS5rbdKNQ
         ROAMmT84/uPKXsg77KyghbD/JDGBKGAfy8GSnJO581cZIqvjMnGWRSCO3FFFxcTf/gK7
         KjCg==
X-Forwarded-Encrypted: i=1; AJvYcCW1WEoeoTTAIUEVryYLGTPud9AamZJ7Y+JblveCZ8h2MIwIQuCnj7N+tl81rKAKNAohz/XLpGOCuXy6@lists.linux.dev
X-Gm-Message-State: AOJu0YwB5N6E/epoMcwPeVMg8qpAlx3kmJsyi5KhQuDMGjBlThIkHoe9
	fd+PHqBAdQJoXGAzKiZ3/S1M365h52NiqzzWSxowtYxjXtbW+8pMN1VB0JbXycwVIXfRMqWmX2S
	OgDdnVg==
X-Received: from pgbdw17.prod.google.com ([2002:a05:6a02:4491:b0:c6e:2e2c:d4a2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:cf85:b0:395:9d89:db69
 with SMTP id adf61e73a8af0-3959f270843mr632443637.7.1771982474849; Tue, 24
 Feb 2026 17:21:14 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 24 Feb 2026 17:20:47 -0800
In-Reply-To: <20260225012049.920665-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225012049.920665-13-seanjc@google.com>
Subject: [PATCH 12/14] KVM: x86: Rename .read_write_emulate() to .read_write_guest()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yashu Zhang <zhangjiaji1@huawei.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

Rename the ops and helpers to read/write guest memory to clarify that they
do exactly that, i.e. aren't generic emulation flows and don't do anything
related to emulated MMIO.

Opportunistically add comments to explain the flow, e.g. it's not exactly
obvious that KVM deliberately treats "failed" accesses to guest memory as
emulated MMIO.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5a3ba161db7b..f3e2ec7e1828 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8103,21 +8103,21 @@ static int vcpu_mmio_gva_to_gpa(struct kvm_vcpu *vcpu, unsigned long gva,
 }
 
 struct read_write_emulator_ops {
-	int (*read_write_emulate)(struct kvm_vcpu *vcpu, gpa_t gpa,
-				  void *val, int bytes);
+	int (*read_write_guest)(struct kvm_vcpu *vcpu, gpa_t gpa,
+				void *val, int bytes);
 	int (*read_write_mmio)(struct kvm_vcpu *vcpu, gpa_t gpa,
 			       int bytes, void *val);
 	bool write;
 };
 
-static int read_emulate(struct kvm_vcpu *vcpu, gpa_t gpa,
-			void *val, int bytes)
+static int emulator_read_guest(struct kvm_vcpu *vcpu, gpa_t gpa,
+			       void *val, int bytes)
 {
 	return !kvm_vcpu_read_guest(vcpu, gpa, val, bytes);
 }
 
-static int write_emulate(struct kvm_vcpu *vcpu, gpa_t gpa,
-			 void *val, int bytes)
+static int emulator_write_guest(struct kvm_vcpu *vcpu, gpa_t gpa,
+				void *val, int bytes)
 {
 	int ret;
 
@@ -8157,11 +8157,22 @@ static int emulator_read_write_onepage(unsigned long addr, void *val,
 			return X86EMUL_PROPAGATE_FAULT;
 	}
 
-	if (!ret && ops->read_write_emulate(vcpu, gpa, val, bytes))
+	/*
+	 * If the memory is not _known_ to be emulated MMIO, attempt to access
+	 * guest memory.  If accessing guest memory fails, e.g. because there's
+	 * no memslot, then handle the access as MMIO.  Note, treating the
+	 * access as emulated MMIO is technically wrong if there is a memslot,
+	 * i.e. if accessing host user memory failed, but this has been KVM's
+	 * historical ABI for decades.
+	 */
+	if (!ret && ops->read_write_guest(vcpu, gpa, val, bytes))
 		return X86EMUL_CONTINUE;
 
 	/*
-	 * Is this MMIO handled locally?
+	 * Attempt to handle emulated MMIO within the kernel, e.g. for accesses
+	 * to an in-kernel local or I/O APIC, or to an ioeventfd range attached
+	 * to MMIO bus.  If the access isn't fully resolved, insert an MMIO
+	 * fragment with the relevant details.
 	 */
 	handled = ops->read_write_mmio(vcpu, gpa, bytes, val);
 	if (handled == bytes)
@@ -8182,6 +8193,13 @@ static int emulator_read_write_onepage(unsigned long addr, void *val,
 		frag->data = val;
 	}
 	frag->len = bytes;
+
+	/*
+	 * Continue emulating, even though KVM needs to (eventually) do an MMIO
+	 * exit to userspace.  If the access splits multiple pages, then KVM
+	 * needs to exit to userspace only after emulating both parts of the
+	 * access.
+	 */
 	return X86EMUL_CONTINUE;
 }
 
@@ -8279,7 +8297,7 @@ static int emulator_read_emulated(struct x86_emulate_ctxt *ctxt,
 				  struct x86_exception *exception)
 {
 	static const struct read_write_emulator_ops ops = {
-		.read_write_emulate = read_emulate,
+		.read_write_guest = emulator_read_guest,
 		.read_write_mmio = vcpu_mmio_read,
 		.write = false,
 	};
@@ -8294,7 +8312,7 @@ static int emulator_write_emulated(struct x86_emulate_ctxt *ctxt,
 			    struct x86_exception *exception)
 {
 	static const struct read_write_emulator_ops ops = {
-		.read_write_emulate = write_emulate,
+		.read_write_guest = emulator_write_guest,
 		.read_write_mmio = vcpu_mmio_write,
 		.write = true,
 	};
-- 
2.53.0.414.gf7e9f6c205-goog

