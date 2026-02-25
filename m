Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E96248F54
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 01:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771982468; cv=none; b=UclX1yXzmqnMdPzu8xz++FdBqYMj7gDzWb/QNqGZgvZDdPSxbZDxDwFNPHD5Oxnnpb+9oUYDKWtexRkPiwidQIuv1xLtuEnUQ2pj7GBV97AyqU62/+7WD1/sZ5ApN76joHDG0ta/grE4mouOB3gPah8XiC+INxdw/ZjJkL9guWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771982468; c=relaxed/simple;
	bh=iyxIPblZQF7VigUXYeAExOzxkERFEm+SJWV+/cinaYk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V9LSx1pUe0dpsKuIqvctNMC3NxDe/ehQS+bLVtlB3eIYWYGFJXmJPiRuT3tYYLV6XiApR/PPfI4CY3FY40FdkXc4gbdJudpTkF/rnzy6af/QXwaGSf+ZmXdbZuJKqV71VPYUPAb0eWj/RNFKVbciYBfZLKhYV/ddCX7Q6aws4No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xYgM2E5k; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xYgM2E5k"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b6097ca315bso32948778a12.3
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 17:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771982462; x=1772587262; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=iAM51bp4Q7vtLVTuwPEvx5LguTW6LfJ4+fu/BmQleqk=;
        b=xYgM2E5km4sxjR9rIPI2DleGTbFLTxLZJOP/9ZNlwoW5G2RqyESI+ZudSccGhvYYDI
         SWUTThEZAYYkejCtQ26Vt6e3uJHh1DiWuPPwvqVePWBdQryRCL9Bv6MgOVHLw9sQ4XX8
         o/dZsAnrJVenaatxVrjlMJP5Tw1SGAGZLe7PhrzDwEXfWW8kHObrw0jyWLe5QF83wk3T
         q5aeEvpLocJ6uLMcmga9ZVSlduxAh0P9yjip2pzQ9B4VjgsxMrsUPxwxmNHcs97mpVVb
         fO2dGj4EsMD3O9piEHrVJ9jTOKQ5V4oAnGklYY6arstR09r+We0wKDNZIzf3qaw3MAAe
         vYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771982462; x=1772587262;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAM51bp4Q7vtLVTuwPEvx5LguTW6LfJ4+fu/BmQleqk=;
        b=MB5q7Vt7mmQl/Z7IHANUXqvmu28wqpt+9R9UtWNPcXzjUBDzKLTWe/6/ffTLTUEpqN
         VxhOBkgjS8MiPmJsj+2t0rVocKYXr4CM3hjDI/lLQ1ZUAQygHDy04v2Vx7hzAQOY622n
         h41R3ebDQytKHHUAoIBxhFzjQt84UrqLjyaDDsuTqdoxwYSaPypGdpUKPvb+q9J33tEv
         MHJl3GwLEbInzdVK+fOokQYuuVayvKrvBMg1pPMxJ5cj7LjNANtzWhwmLcGI2rtoP/Xg
         IqKypNcalRNCpiEiAhYIhY+FVQs/swYQVa6C6hHe5cL2zdekMWVPH+biAwYz3xHQbINW
         ZhZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbC8ibZbZQz4rsK6UBilkjvbvo/2+LvuU7mxYVKrN1O49fy7/sgW0IG5UXF3QQFutelMSqnXW5z9vd@lists.linux.dev
X-Gm-Message-State: AOJu0Yza0K8hyAGRrRu8dTqQl/jiK/QgAPCm6hEPrh0iOdfHoXfUSYuv
	WM3XRIiaQ3qM3TNNS5jDQ4WLLHWl8/5U//nMHFPaWpaxJUqpuljiSOqCTmOC6NU+FsX+N5bc5I3
	U6t8UAw==
X-Received: from pgla15.prod.google.com ([2002:a63:b4f:0:b0:c07:89a0:6746])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4c0e:b0:393:7575:a8d5
 with SMTP id adf61e73a8af0-39545ed0443mr12719399637.22.1771982461746; Tue, 24
 Feb 2026 17:21:01 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 24 Feb 2026 17:20:40 -0800
In-Reply-To: <20260225012049.920665-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225012049.920665-6-seanjc@google.com>
Subject: [PATCH 05/14] KVM: x86: Open code read vs. write userspace MMIO exits
 in emulator_read_write()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yashu Zhang <zhangjiaji1@huawei.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

Open code the differences in read vs. write userspace MMIO exits instead
of burying three lines of code behind indirect callbacks, as splitting the
logic makes it extremely hard to track that KVM's handling of reads vs.
write is _significantly_ different.  Add a comment to explain why the
semantics are different, and how on earth an MMIO write ends up triggering
an exit to userspace.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7cbd6f7d8578..5fde5bb010e7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8116,8 +8116,6 @@ struct read_write_emulator_ops {
 				  void *val, int bytes);
 	int (*read_write_mmio)(struct kvm_vcpu *vcpu, gpa_t gpa,
 			       int bytes, void *val);
-	int (*read_write_exit_mmio)(struct kvm_vcpu *vcpu, gpa_t gpa,
-				    void *val, int bytes);
 	bool write;
 };
 
@@ -8139,31 +8137,14 @@ static int write_mmio(struct kvm_vcpu *vcpu, gpa_t gpa, int bytes, void *val)
 	return vcpu_mmio_write(vcpu, gpa, bytes, val);
 }
 
-static int read_exit_mmio(struct kvm_vcpu *vcpu, gpa_t gpa,
-			  void *val, int bytes)
-{
-	return X86EMUL_IO_NEEDED;
-}
-
-static int write_exit_mmio(struct kvm_vcpu *vcpu, gpa_t gpa,
-			   void *val, int bytes)
-{
-	struct kvm_mmio_fragment *frag = &vcpu->mmio_fragments[0];
-
-	memcpy(vcpu->run->mmio.data, frag->data, min(8u, frag->len));
-	return X86EMUL_CONTINUE;
-}
-
 static const struct read_write_emulator_ops read_emultor = {
 	.read_write_emulate = read_emulate,
 	.read_write_mmio = vcpu_mmio_read,
-	.read_write_exit_mmio = read_exit_mmio,
 };
 
 static const struct read_write_emulator_ops write_emultor = {
 	.read_write_emulate = write_emulate,
 	.read_write_mmio = write_mmio,
-	.read_write_exit_mmio = write_exit_mmio,
 	.write = true,
 };
 
@@ -8296,7 +8277,19 @@ static int emulator_read_write(struct x86_emulate_ctxt *ctxt,
 	vcpu->run->exit_reason = KVM_EXIT_MMIO;
 	vcpu->run->mmio.phys_addr = frag->gpa;
 
-	return ops->read_write_exit_mmio(vcpu, frag->gpa, val, bytes);
+	/*
+	 * For MMIO reads, stop emulating and immediately exit to userspace, as
+	 * KVM needs the value to correctly emulate the instruction.  For MMIO
+	 * writes, continue emulating as the write to MMIO is a side effect for
+	 * all intents and purposes.  KVM will still exit to userspace, but
+	 * after completing emulation (see the check on vcpu->mmio_needed in
+	 * x86_emulate_instruction()).
+	 */
+	if (!ops->write)
+		return X86EMUL_IO_NEEDED;
+
+	memcpy(vcpu->run->mmio.data, frag->data, min(8u, frag->len));
+	return X86EMUL_CONTINUE;
 }
 
 static int emulator_read_emulated(struct x86_emulate_ctxt *ctxt,
-- 
2.53.0.414.gf7e9f6c205-goog

