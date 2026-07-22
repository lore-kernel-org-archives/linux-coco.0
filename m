Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072ED47043B
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 23:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762079; cv=none; b=O0xaVN4kzI+8et1oYQJVtr0yq9V1a9+eCHu4crRZfuA9HCJW/xkoSHpdou+s0FcaQqKnP4MRLGHcL9irChLPRHueHjOCfOnQrxqfmvE+EhLhBR56d5BBQYnFdLMRRzQ46yGTA3UizY7KFevbe5mKFV/GwTVZpK/ipzXFvHTbmdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762079; c=relaxed/simple;
	bh=uLTnwqcKeWPbvmmCIr/K2/dvE3UjNBQWRlFbYisxcX4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O0/ekReApVxVSidkeJV44D0Wt/SrgsfCK8QTR7TD8FAIG+dJOEO8WFYQQGXYTC+qJHSzs6XsXOLLrXx/yFN+mDOlSNFsgFuBuonSU4kXnms6dAVTjmeYCGX3eYTxEkcQKblyoRbcK290OE5IWq7s0C2subOJstg8dAZssBHx4oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XtcbXYU1; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XtcbXYU1"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6ef846b33so3572011a12.1
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 16:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762077; x=1785366877; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTOm8OHTnD3CNXmOQdLQqFIFqpZnnwkDQGUQ6GB1D8M=;
        b=XtcbXYU11+e7t56lc4ZLa+u+JPpmco4RwDp4YL8hcuomWb0LpjnNK27hclS77KnX6d
         WzjxFdxfrUlHUOCIP+uM2TkPWYsa17AjK3NSkd5F/ySt4XPSxK1ENZnsRKnP2UsDnv3J
         Hb909b11gmbE/kizQFNGwKcMQS3LXBSilsgnnPddo4bZVBrCIKoG6KuOHvUG/8bBo1WP
         DVjONdUAJzbvcUby4Rrp5g2xP1Rqt2rx/3Rdbz7ca3NZVE8hV9o2Ph8jyDlQ8nzE37tY
         k2WaCQnFzEjRubqPQaaRpi422Ze7ShtYO4SDB/UplmZj4En9cf/PagDCkRaRpkNMO1mJ
         aTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762077; x=1785366877;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTOm8OHTnD3CNXmOQdLQqFIFqpZnnwkDQGUQ6GB1D8M=;
        b=gS6jXlwXcfYHN7pcg3/jb5LarsYBaxZbVAibQWEDIWmh26xucoRgT+mzB5UI8nqNY6
         ZsLjm8iN2+Vy8ltb0wAq+aNc8LK5Pz1kAZqrX458do7eORPCk/oyvaWe1JoykZYcUOA/
         Ca3viKWGAHu+dpHNRHvk2OReuXcBXDZQlzLf1S5lhbg8hxuH6b7/YYt1ukEQfMJSj+RU
         1jWLuQlCMsO26YQUe+JVGssaL3xPhQhLzDH+iK3EKDGCsBUpjJaUUk1e9HQ4e7oSKedb
         UcT4uzfULCw3wUqVV9wkKxKVBNF07JfrC4eTaUp0AQGi0wdI/IlNEdFP2qVaThhR5rG2
         yP0w==
X-Forwarded-Encrypted: i=1; AHgh+RpyFY/A+3pqC54ARhMqR6ag6J9ePLb8dPNqDNpj1aXrrmg9g/fHvOSTfXVSqBTGbTGFhO8DZXH9JbjE@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ9Sht/caYrPEU9bzBj5jI2toVzHiKWH/ZfjZXTB/ORElxz+7p
	GVswFGzImbSGd7Kf4u/dxzwY2/JZvdOpq8Rj2mgStn9RJyHT8MVhtKnAPm9CsHLtY16zNnXif8O
	RUXxssA==
X-Received: from pgge1.prod.google.com ([2002:a63:db01:0:b0:c99:aff5:7085])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:17a2:b0:3bf:ee42:192
 with SMTP id adf61e73a8af0-3c44c95687fmr237545637.6.1784762076814; Wed, 22
 Jul 2026 16:14:36 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:24 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=924;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=yyC4ok9Gt079Udujw0BAUtyTS1qt2jUAvdMSgkP9oBs=; b=YeT84Sa2s65ilrpiII4nei9gR+v8wtHB4zZkk41ORFiKELmdh1JFZMwUT8mna4O7S+2CS2dqi
 KxXOEWTWIPxAuemKnyLgH0/dUr1jhw1cs/O7LBZKHeibqJp7k9kfEac
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-19-15ad654a50db@google.com>
Subject: [PATCH v14 19/22] KVM: selftests: Finalize TD memory as part of kvm_arch_vm_finalize_vcpus
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

From: Sagi Shahar <sagis@google.com>

Finalize TDX VM after creation to make it runnable.

Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/lib/x86/processor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 4b97a9a1bb5e..8319ae3d9fe6 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1489,6 +1489,12 @@ bool kvm_arch_has_default_irqchip(void)
 	return true;
 }
 
+void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
+{
+	if (is_tdx_vm(vm))
+		tdx_vm_finalize(vm);
+}
+
 void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
 		 const void *smi_handler, size_t handler_size)
 {

-- 
2.55.0.229.g6434b31f56-goog

