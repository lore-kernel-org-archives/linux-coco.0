Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BAB26FD97
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 01:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771982462; cv=none; b=k3hnzgXCaXeEaGu78KXkDP3VJ1oXifzMubcQxeTBuqGZd54/1VRJN25yRz0Q35nqNe9AmKWHnDyNPly0zu88WVut5hQx5dgAZTxVxX8JpSrLtvQykTAQK8dPmIwvaF4Wc38krjRIH3nc1FnzzVbAQmumTmVvWFI87zIn0Lk1HmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771982462; c=relaxed/simple;
	bh=5WioRAn/exL/M/dDLMs+BGBP7zMGvVlgJ+hWWegWOB8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lbFD4jW5mSd1XJZmeiSEZguUlCXf2z5//4wtUC5fOJuG71ZwkJElsVBxVEjpZ6FgxW+7xlxZBZYaZnVCuGR1KMDMmcIheXvGoRUy82MsLlugsbij26TzxOTb3AcN01JB0CRI/xIwHXDL0ZY3kdmhT/74wQIf2VufDQxbBkxJ/pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mzYNWS+j; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mzYNWS+j"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b630753cc38so34290007a12.1
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 17:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771982460; x=1772587260; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dv3TZbd1nBU/AEQJbeAhZb6gpTw6vQIp0AVXQNpKYls=;
        b=mzYNWS+jcXwQmqt3JbhMEy7z9knBh2EYY7hiJqOtmuzD/NW0dCz850sIo9QSeIQXNN
         pTVEtEDKarigLfC7izM+yXDm1bauUgM79LhYu1LT8ap6AWPBJ1b1oyvY/HH1l2Ti0dVe
         BK4x7x1w1OqIWpLr9QmaOrHJP6Z4NXYplKVlTWPk90mEXCmJDpsWNtNIPQhsD199c7OO
         e7Crz5Q9m6X6khB+juRa6VQP5GZSWLwkB80c/sxZ5lJLEFJz7cgXM8XnvN863Gz9i3D0
         iO+YKbFoNINuyO1EumRmu+9e8EoGkYf6aixYa2ekb8QzqqT8W4q+PDTTS/2l7gd7FnWP
         26+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771982460; x=1772587260;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dv3TZbd1nBU/AEQJbeAhZb6gpTw6vQIp0AVXQNpKYls=;
        b=ubKkdMIPfoonOOd7E7k8BV+Gaj5HwNYgewZ5Maci7SxrqDfA/OZqdGygGAmBH11Dfx
         ARXX2Rjdt7PgEdE4bbEhupuejs1S3CctGcr+N22BAc0PK4P2vSnnjbEFlXmJJ0QugU28
         sd3mRxrK95P9ve6Kvkv07NgoBG4UnuFYOxAaHScM4z4w0j+hJfILJENcQTRneg37P0TX
         bi5DbVF+53GyFiNuJaL1c5/UTozacqsHNIzm5jXW55lAwPu256WLsqD0NRFjMwZmMasP
         BDl1aCYUMN11xVib3InGhiJhdm2nOewv7mDHtNJQ5bLei4zR445iS4uH3QFMtwIktqtO
         q/6g==
X-Forwarded-Encrypted: i=1; AJvYcCUCc+oRWSjS3nnuszW6tdoGFGK9icWzh9dvFcAlLLg6dhw7EZFgkbQLliTqMQiBmq391b8yWdf4Fqw9@lists.linux.dev
X-Gm-Message-State: AOJu0Yxzug3jL8jWxUqEut9MSFIz62cK+13CAfAw/aOKBKagJppGvp0y
	vs1S+2Xz0dfdPEdKjjfPkdCd9+M60InZ4vUTp+DedNomO1H5TTQrelloZTbsJ0Fb6ylQgeoXfig
	ZLYODZw==
X-Received: from pgbbq17.prod.google.com ([2002:a05:6a02:451:b0:c6e:288a:3ab9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:496:b0:394:f4fd:b751
 with SMTP id adf61e73a8af0-39545fc60c5mr11022872637.51.1771982460005; Tue, 24
 Feb 2026 17:21:00 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 24 Feb 2026 17:20:39 -0800
In-Reply-To: <20260225012049.920665-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225012049.920665-5-seanjc@google.com>
Subject: [PATCH 04/14] KVM: x86: Use local MMIO fragment variable to clean up emulator_read_write()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yashu Zhang <zhangjiaji1@huawei.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

Grab the MMIO fragment used by emulator_read_write() to initiate an exit
to userspace in a local variable to make the code easier to read.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a74ae3a81076..7cbd6f7d8578 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8231,7 +8231,7 @@ static int emulator_read_write(struct x86_emulate_ctxt *ctxt,
 			const struct read_write_emulator_ops *ops)
 {
 	struct kvm_vcpu *vcpu = emul_to_vcpu(ctxt);
-	gpa_t gpa;
+	struct kvm_mmio_fragment *frag;
 	int rc;
 
 	if (WARN_ON_ONCE((bytes > 8u || !ops->write) && object_is_on_stack(val)))
@@ -8287,17 +8287,16 @@ static int emulator_read_write(struct x86_emulate_ctxt *ctxt,
 	if (!vcpu->mmio_nr_fragments)
 		return X86EMUL_CONTINUE;
 
-	gpa = vcpu->mmio_fragments[0].gpa;
-
 	vcpu->mmio_needed = 1;
 	vcpu->mmio_cur_fragment = 0;
 
-	vcpu->run->mmio.len = min(8u, vcpu->mmio_fragments[0].len);
+	frag = &vcpu->mmio_fragments[0];
+	vcpu->run->mmio.len = min(8u, frag->len);
 	vcpu->run->mmio.is_write = vcpu->mmio_is_write = ops->write;
 	vcpu->run->exit_reason = KVM_EXIT_MMIO;
-	vcpu->run->mmio.phys_addr = gpa;
+	vcpu->run->mmio.phys_addr = frag->gpa;
 
-	return ops->read_write_exit_mmio(vcpu, gpa, val, bytes);
+	return ops->read_write_exit_mmio(vcpu, frag->gpa, val, bytes);
 }
 
 static int emulator_read_emulated(struct x86_emulate_ctxt *ctxt,
-- 
2.53.0.414.gf7e9f6c205-goog

