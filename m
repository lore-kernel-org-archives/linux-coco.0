Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922481;
	b=bkSWjwK0QDcHdgEw5lqYayVitDogiww+Wbd/KqzYtHA4mNAWYmfkwH3bfBRxoKb8Elsz
	 O6rEgWt2y5iE+67PyKpHxlWVcu24EAtUMGHCnrKLzrbvDF18Vft7DD++KulwqT5Hl+G0+
	 VC0Mmak1hg2pz3MAGyJAncHPTtMe0JNzZL3cB8f2oKeVlOkC+48i3IMRb8O4dwq1wGCLs
	 bJFM1Pfk/oci2ctJhqNRn9AtxlrrZ/SEQkXl0HH5iBmOO6J4juqWR9tskJzFhwPbD8m4k
	 jsS71ax8TrRnqqp92jOxI+iWcPf3GAUg/dZEHmqiDqmcad4fdu26C1Y9TemG69AQ3Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=a1QLD2xcyGVhLJbNzuWXPP2Gml3MYrb+er2GK1r6mD4=;
	b=Ec7ay42jd2ykwJ5ISNxB5eCzRv60GvOFk/EYVWWyOeh1QDMUBX6FKmL7P3ZQqZX/iPtb
	 gJjO0w8nmpXNDQBWLJ9Gz57ecOdXRKbqosir+6a3QChfUq8aIlT4y1Sw2uHwRGY0b9mxv
	 b+9D6hm+LiLc8eNmPp8KlK50FdwYwuHJo9k/8oEvswGSNztfTicCDcU4c1pa2C36FIDAC
	 tUM7h6SvLVqpb257Cc+39erdh+e2s0vGP6JLtPF65/gCLjZWoVmxg/JTF4kS5y9LuAiQt
	 qUKMmgJYHLw1c3rTViVf4tt/xwYThFzu4c1/V0XUfv20mn3w9dK6ZJT5NCAR5Mdzjpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nerGjKM1;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A083C60A262E
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A083C60A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nerGjKM1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so31576b3a.1
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922475; x=1794527275; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1QLD2xcyGVhLJbNzuWXPP2Gml3MYrb+er2GK1r6mD4=;
        b=nerGjKM1A5tN+0qZ82/y7O/lCdGeLEOBnTNiI4/4etSvworJGJbSGqtH583zHZHXiC
         P/g6q+3Cc4Z5jXtXiVGnhgjt0bCKvfOnrtjFfRWR+tLaOnNESuoxe0SUGXH/CCVEtOx2
         LQFN7GwQ/Xc4MtfJ2Qffxsr7F6fQz+Wth+b3PrdNNFoeyIEMxajz7+n8jXKbF1haNK+J
         jnJXqmj4BcIpEW7Sm43mrhS7Vry8VTCKkhQLvEViMxt2qxdN3MLgnlbM4Oe2pQdqOuZh
         VUrb413pGshTwWspiXeOYcoxzmmy0PSShXBf6bgXGDaS9tMWTyzg+Ft4SPd9jw69cLPG
         04Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922475; x=1794527275;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1QLD2xcyGVhLJbNzuWXPP2Gml3MYrb+er2GK1r6mD4=;
        b=OSvHA2zoktZvJW/6clV0Uop0im/glW6Ahf7c0fHwvmBKLF2gS9fFyC1yNYZgJ4SuX6
         +SnAgaTW7uskJTRUk1MWUOl68Meq6Z6WXvbkx/ZBIVoTIq4U+cQ3BRORdjQ2fe0UvCTA
         FXr9OodXvmWnC6uKXxLamDm1EV9WHi6jZB6RLC2daiF7YAK1b9T5Cx7iSDpxiO1bQo5W
         II6GmO3QEGgEDXb+FF/U126Y7C8yqMw/wMDDGix2QmV99KcFejLM9pdnodnRs6Op7eoj
         saPjm1/lwLEWtt3OwUDcpCORhK5/92Hh4MyeRXZEI2wGqRD5wbanJpse6Dr1g5GDHDha
         xLhA==
X-Forwarded-Encrypted: i=1; AKwUvByF+9rvHhaZjhnaFQhXkNKO0cUEwMY+yuLYNA/t9s2D1mFcVpVN33a2LbmkU5q5tnJg5YU1DSRKJmrH@lists.linux.dev
X-Gm-Message-State: APuU4Z9JIYLI39jFbR1tOjjM1J33EuXWkwyMpXtaUydb5Sil62JqddwW
	vfnMDsJMHDy4E0GFhASu7T61JDc1ADw1roA5kWUlmdzrqBEYEzd/sn69Z2lLC9YFo0ZNYLfWi02
	ZrkU6iw==
X-Received: from pfjx4.prod.google.com ([2002:aa7:9a44:0:b0:891:63bf:32])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9a8:b0:89c:6036:c63
 with SMTP id d2e1a72fcca58-8b37b862efcmr575019b3a.32.1793922474556; Thu, 05
 Nov 2026 15:47:54 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:57 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=1858;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=NM6v7ONAFm4dNOExo6KcnYRESswxRmJRZoN0Wgy5vKo=; b=rxaC7zWae+B+wvnUQ6WsS8EzDvG4JDUhu9mkJ8j0pMZd6hTfMyQSdNAu+OQERPGWCU9V6tAHa
 SdL98gWfLccB0vNbP/TFPIBxbhYs/6mQh+jYJKA0Ph6k8zpPzB7saQw
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-13-2024e8fa517a@google.com>
Subject: [PATCH v16 13/20] KVM: selftests: Load per-vCPU guest stack in TDX
 boot parameters
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
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

From: Sagi Shahar <sagis@google.com>

Allocate a guest stack for each vCPU and record the GVA in the TDX boot
parameters region to allow proper vCPU initialization.

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 1719dc1bb060..84127618f05c 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -91,6 +91,20 @@ void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm)
 	params->gdtr.limit = kvm_get_default_gdt_limit();
 }
 
+static void tdx_vcpu_load_boot_parameters(struct kvm_vcpu *vcpu)
+{
+	struct td_boot_parameters *params =
+		addr_gpa2hva(vcpu->vm, TD_BOOT_PARAMETERS_GPA);
+	struct td_per_vcpu_parameters *vcpu_params =
+		&params->per_vcpu[vcpu->id];
+	gva_t esp_gva;
+
+	esp_gva = vm_alloc_stack(vcpu->vm, DEFAULT_STACK_PGS);
+	TEST_ASSERT(esp_gva < (1ULL << 32),
+		    "ESP GVA must be within 32-bit address space for 32-bit boot code");
+	vcpu_params->esp_gva = esp_gva;
+}
+
 void tdx_vcpu_init(struct kvm_vcpu *vcpu)
 {
 	struct kvm_cpuid2 *cpuid;
@@ -100,6 +114,8 @@ void tdx_vcpu_init(struct kvm_vcpu *vcpu)
 	vcpu_init_cpuid(vcpu, cpuid);
 	free(cpuid);
 	tdx_vcpu_ioctl(vcpu, KVM_TDX_INIT_VCPU, 0, NULL);
+
+	tdx_vcpu_load_boot_parameters(vcpu);
 }
 
 static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)

-- 
2.56.0.455.g6c5a503b38-goog

