Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE277DA73
	for <linux-coco@lists.linux.dev>; Tue, 25 Feb 2025 00:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740444447; cv=none; b=UmiSVijsIAGyRySiSFbqDPR+2Ylx4Aot0my2wFHrNI62Bcox8I8rh98pcxhdT91dFp/TmkKrwakmhRqvQvnGqa+aSBM+yaB3VTFgcabbviO1NjZNB/TrAQ52MYSwUPjMZcQaT3RQvSpia+3dMV6URy8VNckTzNVEf6SnB8NGAfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740444447; c=relaxed/simple;
	bh=T/cQq2gbcXMKaZsXGstnUvsS5gx3e8vAXQQMeBxex2A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pm5bT7ZAj7PK8nzSY+ezVUmvmfium092qhV1zgWKX1ixHntdKL7i+MM29jP9jM9HQH4dOgHBZkyIFAgFstJC5xSfen92A04XaIcQ2LLUBg14f7hplLNc0ydrywnIqK88WKYLn3mTU5MtEj2PnrC6wx9+rQnM44U5LwImHMFEA4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B1yq3M48; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B1yq3M48"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-220e62c4fc2so110166955ad.3
        for <linux-coco@lists.linux.dev>; Mon, 24 Feb 2025 16:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740444445; x=1741049245; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qy8TYReQarf8Nrq0hVwWXasfFIELVED1LEfWVnYQz38=;
        b=B1yq3M48euI5AgqseA8GePti2CMpm86laf0QwFvc3HavF8d8+twJ1GeJDwdSMpDKGW
         WlxJjoRCWhAdOyM5Y7NVUDL9v+eLu89hCA9ZvJvoEni7Gpmr+kLv2xhM1yBhproX7e1K
         yK/vk6zACeCTBqZLnZ8FSxqefU33ohzxbfIZ8MYZTPnZ66vqhtYj7UEHZTM3XKZVjy4Z
         0q1cAP1IcPiYsONmO/StoQCPUVq3rrF+NU5dQ6MU+SOWcr2GGPfLlfGUsEwIk+5/Pb3Q
         WVyScVn8vTctvXNrgwfX2Ekeuhi+HMzzQsUakai8z9AdW4bpEbndQbjUZtJib9I0VIGP
         PkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740444445; x=1741049245;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qy8TYReQarf8Nrq0hVwWXasfFIELVED1LEfWVnYQz38=;
        b=GNK3wPfMX0rosk2Vc0F20Pjuwbcqm+Tp79z/Cb4XCy+x8iBvAuFEApqG+GjHV8M9ku
         YfJhHwLstIKrYRvch3VW6/7VUSZkvgdy5L5VY4D2jeYF+nj4upr/xtJUtywmPIr1rFJp
         XfR/KjJEz7yf9sqsJ9vGCch/Jkw4pLWQmaPwN1WhPLkf37WaBxGCRZxdYb+cz0yLlD7Y
         Gwg803bDQQX+XSUnhVb4Fsr3V72NhjII9vCLapfymiXaAb28m+qE1wl0h+Dm66dxqUAW
         TjLn/1ftNWbHiyhfT/Kspp/NGAW8Cs7F9GccpT8HWVP73AA+fQoUm6CbBRAna1wab6Oi
         VEKA==
X-Forwarded-Encrypted: i=1; AJvYcCVjHfMzKRpwnI9dSDhBxkBNKAwcWUV+qY2DO3IwxjE9gP2X5lYPU/bEQ8TzI3I0SQTEiCLF1TrHSWue@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5HIYgUksJFjTBAXnnlVijNni8ylmVyw0qABYaythr9sDzuJ4q
	QD3YRr6wtpvpT5OuJJvocmMT2NPqJkijrxmnVOxmXk9lNBnISssbuQ0bl8yzzaDwiCmOrGE+RdV
	XRDZ8DYbsoPsL/99bzg==
X-Google-Smtp-Source: AGHT+IG5ZWwtjOfGO4up++fIH8Fd9d29YqqhhBkZbAuQom+4PbvZsYIdau1Ht7XhTV48M3uxa4Ns4uXofty1xJ89
X-Received: from pfod15.prod.google.com ([2002:aa7:868f:0:b0:730:451c:475c])
 (user=vannapurve job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:847:b0:730:75b1:7219 with SMTP id d2e1a72fcca58-73426ce8016mr24215790b3a.12.1740444445348;
 Mon, 24 Feb 2025 16:47:25 -0800 (PST)
Date: Tue, 25 Feb 2025 00:47:04 +0000
In-Reply-To: <20250225004704.603652-1-vannapurve@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250225004704.603652-1-vannapurve@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250225004704.603652-4-vannapurve@google.com>
Subject: [PATCH v6 3/3] x86/tdx: Emit warning if IRQs are enabled during HLT
 #VE handling
From: Vishal Annapurve <vannapurve@google.com>
To: dave.hansen@linux.intel.com, kirill.shutemov@linux.intel.com, 
	jgross@suse.com, ajay.kaher@broadcom.com, ak@linux.intel.com, 
	tony.luck@intel.com, thomas.lendacky@amd.com
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, 
	pbonzini@redhat.com, seanjc@google.com, kai.huang@intel.com, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, 
	afranji@google.com, kees@kernel.org, jikos@kernel.org, peterz@infradead.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com, 
	Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"

Direct HLT instruction execution causes #VEs for TDX VMs which is routed
to hypervisor via TDCALL. safe_halt() routines execute HLT in STI-shadow
so IRQs need to remain disabled until the TDCALL to ensure that pending
IRQs are correctly treated as wake events.

Emit warning and fail emulation if IRQs are enabled during HLT #VE handling
to avoid running into scenarios where IRQ wake events are lost resulting in
indefinite HLT execution times.

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Vishal Annapurve <vannapurve@google.com>
---
 arch/x86/coco/tdx/tdx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 6aad910d119d..a97ddc6a52c3 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -393,6 +393,14 @@ static int handle_halt(struct ve_info *ve)
 {
 	const bool irq_disabled = irqs_disabled();
 
+	/*
+	 * HLT with IRQs enabled is unsafe, as an IRQ that is intended to be a
+	 * wake event may be consumed before requesting HLT emulation, leaving
+	 * the vCPU blocking indefinitely.
+	 */
+	if (WARN_ONCE(!irq_disabled, "HLT emulation with IRQs enabled"))
+		return -EIO;
+
 	if (__halt(irq_disabled))
 		return -EIO;
 
-- 
2.48.1.658.g4767266eb4-goog

