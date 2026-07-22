Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAE02E7366
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 23:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762062; cv=none; b=VF6XpO1zSuR1HJucb4eb+JgrAugFyjVyAB1AX9ZDyeiNGCgWFMeAaDpshhJJUtiU2DG+wK3yNaCK87yl7joab/96TOnc+z9GbA80Q/+jiOvz6eUSZRLVp16kRrHhSvhRaf7oc6ktu8EvT45IbPoEQfS8pJmwlmD2mnsRDCRVohc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762062; c=relaxed/simple;
	bh=rn7lIDTWcxoiO6D4/Cdhdy8K/SysdSX/CMUU+rwcLOI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y2aumua3ixu84zVzAzVDo3F/yZnQWE4wsVhALCHSH8OZj4P8QwNO7I0X/hfuwmi3R1TYy3EDEXBIJme8uHbxj0jbEORYqoU/J1usdX20DgQbAVoehIpRci4QjYUhxRA3rASZZpYyicJeDoms7XL1+QD3qONFXoLdk+SmlTDvxCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rVdOXPNe; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rVdOXPNe"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so15069a91.3
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 16:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762060; x=1785366860; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oVBS289J/Z2jqIHEMCM1gipu2UkhJ+nCd+Y4BOZxwFE=;
        b=rVdOXPNeIpnr+GDg2zbd6YPkdTdGWeXffplxL5ITeHV5Hy5/oSlk0c+gVxh/YYc6mx
         M+1fmA3tH+hh+0BzcZ2zhhl8eLYt09WgYdMcsEd6SGtp/VSWuZ/9z1yy1HyF2HQguAlM
         9s9zXqClJLggWaacm1y4cAPaQNEa/ZsM/8rGe+AX8RNXMtWgOrbhIrvuxc0Er1xdStUN
         XmDcTDx1SL6knUtfrO3fdr44z/gwvPGo/2eGlAI+VdvW0IExhlUvHKoMxp2YlVQVoY9p
         cjMuOJ4d1mslUu+z0i7UaYFzihz9AG+lAXiHOBHwtCAKHPpfbuUIcDe+cesDDWcenSCK
         cDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762060; x=1785366860;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVBS289J/Z2jqIHEMCM1gipu2UkhJ+nCd+Y4BOZxwFE=;
        b=KIxqxEATKyownVHgb4K62idXIF/7U6lHZHzAnT9Zu17cem01S6ge6gR5CVKtSuVrig
         f4O0oLoRSVMmGH1tXXqFO/azZ7LQm8q22368pDba7BqqqYAWjnXZr863eFovJsvvifxv
         tx3ql6xOYhi3fp7Ket7OfOyNSVP5cF5yFyXCXMJKr8XhNcE2bEUaPxAgYWqpQyAGr0ub
         2cqIpqVUwgP/LS5Jt2ErTRmuBLY/TOuim0oBP4eonfBf4lvkGExBF2CKqw4WCgBLvzyE
         cW9atHDpAOt3SBgrdRlhQX2+BiKOiLzK8kIozrRrTP1b9yWGFmVCUpqqgMgGB69M8jNJ
         P/mg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2+Q0c8vbqYaBuyudoSEG+yKa3Tf5EZLd7GMw5Zzct/vQT7+yFHqPeAQ78HkwJAbXjvnhqSPlF51s9@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/JGvSUtOGlAN6UGNz9AX9dlfJ3SoguUt2wyGMxBCTAxXqQtKs
	2RudU0uNHsYMh7rImqxwHJvZWINarK7JmBHQP0woiVcLZeMmZ7r8yLOYcQZK0mWCmQzb8xGClpa
	I2c3wMQ==
X-Received: from pjq11.prod.google.com ([2002:a17:90b:560b:b0:384:aeb6:624c])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:184c:b0:37f:9ce1:735a
 with SMTP id 98e67ed59e1d1-38ec658e892mr709493a91.27.1784762060184; Wed, 22
 Jul 2026 16:14:20 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:09 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=1765;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=bOj/gnaWbqCSO1dw0E/Ufv9dZGd8nQXtcW3IYQ+RbjE=; b=Fwd4fvyFJukTctt1WNFLyHmWmkoUi+2SW/wiXay2xsIEBRQnOVDGm6MjuzZw7NYD7fl7HIlgs
 4ynYSy6pNK1DYAyNeNpv3ljZihaRfmzv4bmj+B2fCdI0PwJSdaRXzqC
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-4-15ad654a50db@google.com>
Subject: [PATCH v14 04/22] KVM: selftests: TDX: Use KVM_TDX_CAPABILITIES to
 validate TDs' attribute configuration
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Isaku Yamahata <isaku.yamahata@intel.com>

Make sure that all the attributes enabled by the test are reported as
supported by both the TDX module and KVM. KVM filters out the attributes
not supported by itself.

This also exercises the KVM_TDX_CAPABILITIES ioctl.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index e1ffb67a106c..c01a26567b73 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -93,6 +93,16 @@ static void tdx_filter_cpuid(struct kvm_vm *vm,
 	}
 }
 
+static void tdx_check_attributes(struct kvm_vm *vm, u64 attributes)
+{
+	struct kvm_tdx_capabilities *tdx_cap;
+
+	tdx_cap = tdx_read_capabilities(vm);
+
+	/* Make sure all the attributes are reported as supported */
+	TEST_ASSERT_EQ(attributes & tdx_cap->supported_attrs, attributes);
+}
+
 void tdx_init_vm(struct kvm_vm *vm, u64 attributes)
 {
 	struct kvm_tdx_init_vm *init_vm;
@@ -112,6 +122,8 @@ void tdx_init_vm(struct kvm_vm *vm, u64 attributes)
 	memcpy(&init_vm->cpuid, cpuid, kvm_cpuid2_size(cpuid->nent));
 	free(cpuid);
 
+	tdx_check_attributes(vm, attributes);
+
 	init_vm->attributes = attributes;
 
 	tdx_vm_ioctl(vm, KVM_TDX_INIT_VM, 0, init_vm);

-- 
2.55.0.229.g6434b31f56-goog

