Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702905;
	b=c3uExO6to5ZRZDF9arI4c3lRvqzWNaEU82qoYJ27t/gCfJiP08DtoTbtedJ1DM3O8uNF
	 M0wRUrqGkir2bVYsPQ8+b1ItbhnGVtsxSyTstR1SkIAWmjZ9qICL8M/YzddeOP5Qx3GpE
	 IKewdWo8QqwMDYqJeE9BIQQpRHFxKlyk7sdVXaYaWWJooVCfv0UiQT6ifhgA7wrUFJf6z
	 FQkTRiWM/ombsSaZi3mIDzGWbtbnkjrBQaae4hucIqAdRuDCLlyS9+kqjc2hGG5HezqdG
	 Nz55Uqh59j9h2vAUsFQMweYeLht2CsQf23VmnNE1V3pFI+rE907TayTxDxw3Guak6Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=XC+w9Viu2qvKH/AbWhn/9WyIQrAbEorvKdSI99G+qIU=;
	b=RL9vc4duGTR4VQC51i1zuIPt6ogCA3DbkjVE7wmDjEicp+T8O1sb+durLjzCnt3FYjv9
	 d/1L/tncKqZzK+BETcE0hr3fmuwXsXynUqtk263wtng4PcBfTuaOE6zl8mqFeqp4pMOhT
	 1Y/1Fj2Ffapn7tXQQ8vmwCNh9WlJ2Z2nz8kx/ORp7kPiEm/Dlsjqa+xb8EtvMbha6KzVa
	 qGPw1vsF6o3LEGtxtVQVKy6ZG5gmUCHTWLBZ4MOdcewcRuA48ztKRjFN/DrIZnpWlqk6q
	 a2I4jg5v1Zhz7XUICxvctlxIiKd9cnFASr2wiSEqjQ30+sE8UmiOO0EP3mRmH9VoZMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=IETH6jIf;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A824E606A319
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 21:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A824E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=IETH6jIf
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0589ff620so185989b3a.1
        for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 14:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792702904; x=1793307704; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XC+w9Viu2qvKH/AbWhn/9WyIQrAbEorvKdSI99G+qIU=;
        b=IETH6jIfS4ueGGv14SwhEnqisZZOW5LO/nEab4aqUYgMpXeqDttv4to95hF3K54W8Z
         NJxiIVuJzG4yB2dRUvtzq8Fpb/75V0giFYH6iM8cp4UznyHpq9ZF88uL+kmSS4jt5tYF
         Rso3c3K/F6qHMPezElgsrQdXbLEQerIZyUNyj6EGpeTdxbj6O4xe0XR/zpBNWgbHBz2Z
         fCFWXOLrYTKwJ8mfpE+eHspnbj9P1XKn4S8e2M0/+AAQLuGZ59hAMkX3cyMw2Lp6XXMu
         AJmeDeleRZMemv4HY5VQTL8/Fbq14/Zf9lpWv0tuJa0fVwBfjC8lm2zkril7AQOyp5rQ
         2ZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702904; x=1793307704;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XC+w9Viu2qvKH/AbWhn/9WyIQrAbEorvKdSI99G+qIU=;
        b=dP/sBeA1DCR92rFTePNNGjREqx7MxKPnfO7o6US0d48FFeCB9W4HyIdsEGwkppz4Vm
         rY/o9HJBbndbBkk01ArG/bhLNnnGt9nXwhZb8YNY0m+tidfHBJGCd/OMxafTD+ENvqHL
         OBDn5GVi+xWF32d6HRFwsZmjRhUa+qXc/NeMLcxwZANW/LH0kRWe/F2a9DysWlWIH4uP
         Av5najluGO+Hg9Ai0gAuRI98Ufbj7OfgFZ4XQaXYn8IHgsUeQ2tFFVUBt7ojaPfpIniH
         LPA0Uz6Hz1jb9hSqTOxkgrTMfjXKHLhJKDzna2cw9o2ElMIzjIjABairuhOMM7ntahwR
         2YbA==
X-Forwarded-Encrypted: i=1; AKwUvBxhqnCBbndYtoYwU7l7cHultTOWbNjBWo0hnp3HtHv8HSvs5+A0uMHjlhxxknMsOUlrxK9W1mvTwSgC@lists.linux.dev
X-Gm-Message-State: AFq9FYL+4ASQQku4d+SQuHJbBTmuFLn3bwBgDyaHPWZQqPDtNNgbrUeW
	cQLHpXK0kjKbTISM/K1SZ1gTmk7/aS+G873VSlaCmNRMw7znDcdvAPu8wiTeuo8yXfKMcWI0rgK
	bJGtrIQ==
X-Received: from pfoa26.prod.google.com ([2002:aa7:865a:0:b0:890:3943:6267])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:330b:b0:87d:ee98:606
 with SMTP id d2e1a72fcca58-8a2c604340cmr293927b3a.23.1792702903840; Thu, 22
 Oct 2026 14:01:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 14:01:34 -0700
In-Reply-To: <20261022210134.612848-1-seanjc@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261022210134.612848-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022210134.612848-4-seanjc@google.com>
Subject: [PATCH v2 3/3] KVM: TDX: Reject KVM_TDX_INIT_VM if indexed CPUID
 functions don't match
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Binbin Wu <binbin.wu@linux.intel.com>, 
	Changyuan Lyu <changyuanl@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Reject KVM_TDX_INIT_VM if userspace doesn't configure the canonical CPUID
entries correctly with respect to KVM_CPUID_FLAG_SIGNIFCANT_INDEX to fix a
bug where userspace could bypass the TSX and WAITPKG checks by simply not
marking a CPUID.0x7 entry as being indexed.  This also sets the stage for
more in-depth validation of the incoming CPUID configuration.

This is obviously an ABI change and diverges from KVM's general approach of
"let userspace do what it wants".  In practice, no "real" VMM that supports
TDX misconfigures a TD's CPUID entries in this way, i.e. the probability of
actually breaking userspace is basically nil.  And unlike normal VMs, where
KVM has full control and thus can deal with bizarre CPUID input without too
much fuss, TDX VMs require extra care due to the TDX Module also reacting
to the CPUID configuration, i.e. KVM_TDX_INIT_VM needs to be more strict
than KVM_SET_CPUID{,2} to avoid creating potentially dangerous-to-the-host
setups.

Opportunistically rename the helper to make it more obvious that it's
checking if the passed in @entry is unsupported, as opposed to returning a
set of unsupported entries or something.

Fixes: 6d415778f106 ("KVM: TDX: Disable support for TSX and WAITPKG")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/kvm/20260604024927.E22311F00893@smtp.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 37d088f6f7a8..6abf92ffec24 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -151,8 +151,12 @@ static void tdx_clear_unsupported_cpuid(struct kvm_cpuid_entry2 *entry)
 		clear_waitpkg(entry);
 }
 
-static bool tdx_unsupported_cpuid(const struct kvm_cpuid_entry2 *entry)
+static bool tdx_is_unsupported_cpuid_entry(const struct kvm_cpuid_entry2 *entry)
 {
+	if (cpuid_function_is_indexed(entry->function) !=
+	    !!(entry->flags & KVM_CPUID_FLAG_SIGNIFCANT_INDEX))
+		return true;
+
 	return has_tsx(entry) || has_waitpkg(entry);
 }
 
@@ -2393,7 +2397,7 @@ static int setup_tdparams_cpuids(struct kvm_cpuid2 *cpuid,
 		if (!entry)
 			continue;
 
-		if (tdx_unsupported_cpuid(entry))
+		if (tdx_is_unsupported_cpuid_entry(entry))
 			return -EINVAL;
 
 		copy_cnt++;
-- 
2.56.0.257.gf7497c7d27-goog

