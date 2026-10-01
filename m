Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742D353A3A9
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 19:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883543; cv=none; b=P7pk2rNGz6kbOuundISZykkai6OUZ43zUvIh2OOructJq+fi2L2bXvMIXsFvZGyeoh+xRKhNQv7yrhseWvsmIcqexxhE0Os1FcfsYPbKeXfuHotk9xUd0fea2ctxAAKBsnYEpHuZw2nbfYg+A2CX6bx1bouLSyvScC0O7PMrUnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883543; c=relaxed/simple;
	bh=llNcDEvG5ONSzD4dGt4NNNxutqgk+Vh63Ml8CuMiltM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nLwNKsuYM6TIGZDho2gRXA5m2KY7cyAkDClWon4Bh39uUl2TRyvoI5icMT63G2va1tbQ0YSoqbXQUN/hQOpteMurjSmtURbfxQOKYXTHOvx8/s3pZiDfSu+10qIGQBsTPfdm6PDBOb32jjWQhlhiq6n/FuUFF7axh5LBKjdHuFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=duX4BOUN; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="duX4BOUN"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d55d8cd938so103330095ad.1
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 12:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883539; x=1791488339; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTS9MVYDjyZn0FMdpJO1jd26R6doN//zdf6O3PVKEHc=;
        b=duX4BOUNatkFrb266EJ0vkQ5LEOrZfSek3so3q09QrijuiUUfB3nhrVBJoyA57oOLt
         OwH95SwOdmRz/JK0C1zKX9X3MNm/p9cAXJVqv2mtQlOZUR92a/eA2E6ummXD6spohN/D
         VSRDttTAVZc0HxhEPot4VeEe/KrSxwA0EL3za/brGFUMjuBkPXnDx4CQ45VH8a+UXvec
         nBdfnrHMWyWpm7X7geP5YNazY0uVY/SU013MvHnMOaWycbpfS6kQsmWqAsfIfh1neWex
         gEjhfKB0GXHWu/eupH4AMebcedEVlQ1CRuh1/gELJx28rkP8tInGAziNw9F1xEUf1XwJ
         OZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883539; x=1791488339;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTS9MVYDjyZn0FMdpJO1jd26R6doN//zdf6O3PVKEHc=;
        b=lppnAtzXiL6q508wEHdNjfUwgHj0P10GxqxAbA0OMW0Cq9QGkbUZAZFn+NbgsGkAzc
         VZ/8J6NEuRXcb6eXIB2QyO8rqmBjNz8ktdMzR4Bj/PonQDgoPxIIV2UvxMxViEtVacpY
         40ZDW7A4Zgfl+IIkzYIstSx2p9fqrCOSCIfJ9OqVNrzYyfNe9oXwjUDRtWghQFbSlX9L
         oYFYi5f2WuVu4gpqDTw0wbnRs241kOlkInCWZE7OGjIAO10giOLZetA9mLXAFxw3oUb6
         VCCBbqHe1TvhNmWMae+ESwd25gntM5Xd4MBfcQteTCmbL/eEs4pFISi+1/Ia1Etoz944
         Ds+A==
X-Forwarded-Encrypted: i=1; AKwUvByQQ7klayCjAsf+jO7xUHy87XJzsmiOVRDY6tdyZcXU8gPYJG+PdIjldedrJFGDQLJx+nmEQl7YDLUr@lists.linux.dev
X-Gm-Message-State: AFuF++nGDRukZvjX0gvT/xgczu29aEtIkbs7WNNiOC3jU5y3IBPR/6D6
	iwBq0kxFYUoeO2PRIoqC1sCTUs72H3zZmYgAYkWUTmKVqP7GvsOSfmUIBGt+d5vE1PFv8UCvjur
	3SVsrtg==
X-Received: from pgvi18.prod.google.com ([2002:a65:61b2:0:b0:cc7:d53a:a250])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7346:b0:3dd:a196:69da
 with SMTP id adf61e73a8af0-3e0bcffdc3bmr382730637.53.1790883538817; Thu, 01
 Oct 2026 12:38:58 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:46 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=1475;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=dHazRHKBQXLPWxA291EnS2jS18PMgn3EB4oA4YyhfRw=; b=tgwt8HjwGicHZ76GFPLwalGPdHjLjBULDiEbZpWVQMS4MtToLYJAFVZZBQaYYAekz7/9dcVOU
 3qCled8xn9NCQz41bKF0lqBRmeb7alSlvI8zr5o0D8rThRu3XAiEemS
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-19-7c62a5d8a992@google.com>
Subject: [PATCH v15 19/23] KVM: selftests: Finalize TDX VM in kvm_arch_vm_finalize_vcpus()
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

Finalize TDX VM after VM and VCPU creation and memory initialization.

To integrate TDX VM finalization seamlessly, the finalization is hooked
into kvm_arch_vm_finalize_vcpus(). This approach avoids the need for
every TDX selftest to manually finalize the VM. While it does prevent
TDX selftests from customizing memory before it is locked, no current
selftests require this.

In TDX, finalization is a mandatory step to make the TD runnable. It
also finalizes the MRTD of the VM's initial memory and state, locking
them in for future attestation and preventing any further modifications.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
---
 tools/testing/selftests/kvm/lib/x86/processor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index b4b76dc505ae..e1d0fd5ed1f6 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1536,6 +1536,12 @@ bool kvm_arch_has_default_irqchip(void)
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
2.56.0.rc1.315.gc6ed9934b7-goog

