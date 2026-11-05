Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922478;
	b=223bKiWuGLz520uFCQq0ltFrxhii8GylwRar3QnwJ4fagHkhwsG9g67l1G30CGjbp3QM
	 Pv19goGcLe6DP7FOQ2bANjWZbpqXai5B06xTKvABIp2WTSbliZOD9ewjRK+OuCVKqZhQf
	 LiKMwri1MegvbrGguSecu2UsZ0oDEWuUh99KsLzrvGzT56rcg/a7V+98bVM2HeQLZ6tJW
	 +WVOYqndEJP5/BZ5FSFKrafZ5wDomj4lIqnxG/EEGmqpMwq2EWvMBEtyBA9sEa7nAHsP9
	 tcGey1OUvhNgdnCbvjt0oJTzL1X4nSXpwlTiH4KnKVewsm6HdW3wttA9HbWLX85rsgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=fgvB7ryGI+VP1vEYkbqY8JtJCAmW2BQXzqaW/kbu2G8=;
	b=L0BnS7ks5fogx54MDX6Nl21V7655p3GtGBIVlUyJJN/JATtOgWMAxI1uKdOXmIa+TvyR
	 6RMvG8XhsXgLbplkxRwpv9jgxZRPuNFPW1spVLoe/UN4eGFd9xmwRnFg/sRkF9F13eKZE
	 HS6PtnvrhkzLJW7OvqD6xAdPSinq6WHQfC3HrKGsWR223BJoCbQQ7UxAVHcgsU33wNItD
	 QWtAKdy4Y+j5NeUrPnhK7edhqtz7PbDe8Jyrd96lByWuh7r2D9HkZYtvde3fALNOk+MLI
	 DYQvDvfF4GYFICaWdMYm9+qllpoQRzfV4Og3lCBpEGn41XlTt+W0WjfFPTC9IVkQ/Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pQa3Lh7V;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275CD6083618
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 275CD6083618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pQa3Lh7V
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed1fbae872so1090575ad.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922477; x=1794527277; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgvB7ryGI+VP1vEYkbqY8JtJCAmW2BQXzqaW/kbu2G8=;
        b=pQa3Lh7Vf2BoG7wEcsmQdzEngBPPRmvk19+mpEq453DbwmZb8lyEKFT9AFoY71Gt4N
         m0+AztWa4vN87RZBFql+2AOszHTLLCwIZ0GW+Wsn2Xnsnjv5y1ESyPBn9BEBZAoztlt2
         qUdbRxmsQXpMLuK+Lbqwt8tV0HlfSDJ3VDA9yeRbeaxNi/JhVq3ooajfqPBvr2gh9n1o
         sfF+uXizC8zU0obQE6ZzsDYmcN9PCkG/0phn30xVEo8fJwCesi1okDnE/yTX5+9dK83G
         l3+07k6ifQLrXYcbUnxA3atZ9apY+R92s9v6eXmn2fwKkXfDjTtmTOdSoed9T4XE1UeS
         sFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922477; x=1794527277;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgvB7ryGI+VP1vEYkbqY8JtJCAmW2BQXzqaW/kbu2G8=;
        b=ujrquNz7hCTeS2LwSyiwX6RMZxrFsouk51diV8Hv1iTL8D0A7TOkA8fWS7xtcWn+2x
         UonqxBqPZyBgfJTpDOm1KNdfqUkwiPrwYSy+4lXtDAXZtY47EY0Ta/HfcrvM7X5zGRX5
         OdYzND+QCRqvCwYt/1UNC0lzaJV5jAsd5L6a6TXjCdhuR3fuX8m1yEMMM0XtVgqpzzi4
         xYxHcFs4ug6bn3qDGfQ/LB3p8DJs9jgBl7SFIeo1bzDxhojjUJvtjfN3dQz9U0pUELIr
         NrmDHSgB+4NfS8zJjgNTlfrdFRFoT7p+XPBQ4wFhf/iZmnuP2ChemifkN2hbda837YIV
         mHdw==
X-Forwarded-Encrypted: i=1; AKwUvBz2kG7DdBnnT5zHeT+piH4JVfdNvgWUKvLuH/cqPPQoRUAARy6q+z4SlWsm6jLlcaDuM2mi88rQrl08@lists.linux.dev
X-Gm-Message-State: APuU4Z8ob8IB/vt51KFOFyK4G9HZB7cx+dyy6xfIYRmwXE4sgPpqOvgS
	QFTv2Qor3KNSqcSC5ktjLULdQEu4bhP9ysRaTtDNlgdZchSBChcMWpSetR2ATRFIQYUjRVGkTbd
	u0kvfow==
X-Received: from plic13.prod.google.com ([2002:a17:903:370d:b0:2eb:153c:2391])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d05:b0:2ec:ed58:2062
 with SMTP id d9443c01a7336-2ed4197e542mr11947205ad.35.1793922477243; Thu, 05
 Nov 2026 15:47:57 -0800 (PST)
Date: Thu, 05 Nov 2026 23:47:00 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=1655;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=eAuK6mynjXU4g9scBsf8osxDUNluz16TtjfwP534Mqw=; b=fuDGD8mFk2kezyisI0w6vD9nLF5EHCz8DYL5IKWXrWQlJD+wmgeWQ+Y1ZGY0oFpDoZ71oILr3
 SeqLs8WgWFBAZOWuMvl9z1pOG4vWv/UANcVEKdCrJXru2JQpc/g3Wzv
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-16-2024e8fa517a@google.com>
Subject: [PATCH v16 16/20] KVM: selftests: Load private memory and finalize
 TDX VM in kvm_arch_vm_finalize_vcpus()
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
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Initialize TDX private memory and finalize the TDX VM after VM and VCPU
creation.

Hook tdx_load_private_memory() and tdx_vm_finalize() into
kvm_arch_vm_finalize_vcpus() to avoid the need for every TDX selftest to
manually load initial private memory and finalize the VM. While this
prevents TDX selftests that use vm_create() helpers from customizing
memory before it is locked, no current selftests require this.

In TDX, finalization is a mandatory step to make the TD runnable. It
also finalizes the MRTD of the VM's initial memory and state, locking
them in for future attestation and preventing any further modifications.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 tools/testing/selftests/kvm/lib/x86/processor.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 11db6a3b0366..ee8a1715d844 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1503,6 +1503,14 @@ bool kvm_arch_has_default_irqchip(void)
 	return true;
 }
 
+void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
+{
+	if (is_tdx_vm(vm)) {
+		tdx_load_private_memory(vm);
+		tdx_vm_finalize(vm);
+	}
+}
+
 void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
 		 const void *smi_handler, size_t handler_size)
 {

-- 
2.56.0.455.g6c5a503b38-goog

