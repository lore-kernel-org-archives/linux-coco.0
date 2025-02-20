Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB3D1EDA37
	for <linux-coco@lists.linux.dev>; Thu, 20 Feb 2025 21:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740086200; cv=none; b=h+bIyX0uNdXqmVFx0T2vnDB6rAN2BXbTJNitCaT4naqcWDj1tomkcGmoPu19Pax+v8m8tdrcbkSLGhE+HurbLlFycjyDNERg/zfFyjhxGQss44Z4CA66jac2kjaJomyiYPca8bgCtGoMWjyRiYonNI3/JY69f/s88UlzFO4DpBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740086200; c=relaxed/simple;
	bh=+PPj/zrzjSYqXXCy96C5yaPEmwdaRWz6IyB/osiEhO8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sxEO8a028SmmhT57DRHQ0LOFljxrE0hKMVXiU9Q2wnnXdG5CRVz9KOYuFTDRnAFl/WeExmpu0cw3xHbSuHWEuSZbO9jj1CMpBfHNtoylgymZHc0+Y2lTjpjzKdh2oX41abAxZwD+90UbL/f+PFTUliRtpP4H0nS5XF6Dvn3IKHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LYChoPRd; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LYChoPRd"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2217b4a48a4so27903115ad.2
        for <linux-coco@lists.linux.dev>; Thu, 20 Feb 2025 13:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740086198; x=1740690998; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+TBBWdBjfmJP6Y5X3+NqIMZIzXEuRVkUfogK9DAPAw=;
        b=LYChoPRdJe4lKGyKm5ZCe+8lEJw2dxMBH0d5RCrHnxxgfMSV7nSbljPFXqQhoV4vBU
         Beq9ufKO1VVLr6Fk2CVBrVvnP8vAJn0d/BziseXmLWGpeBxh1bUvZ5d1KreBBGVyyV7g
         0yplCFrBRheij6+JueLSAezQE3zqnM8MsV2HYfKhzIOEMUrokdPfYD1ZCqwKNOAuteZC
         gYrxyQyrpoHNbHhxiWMILYbJX8N03gi2+0/BrBvV2Dpmfsgl4MsPrINj9rp9r26H793F
         JD2QuFJYhqchwFkUcluBjEcLvQ8+dxB0uRksd3r42BC0CCaloUvJeGIZagWCA2Vh8HI3
         DXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740086198; x=1740690998;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M+TBBWdBjfmJP6Y5X3+NqIMZIzXEuRVkUfogK9DAPAw=;
        b=b4OyG/dYeuVE70BMCvkOB/ZKeKy/2Qe6Ive/1IMycjIGt41zwgEpsko71O0EKeFxuG
         OjdrAfHH6sbmzlaTT3ZMqdlMl4ukVGYaz5w1Sww1ayRJazCGwBJgzu7xhZteZgznygMM
         ujr+QYM7hpLSXe9LAKV+CUy26Ths6d2Xk6/OzNmfzrAEkbO598oFNwBk8IAqOQZN3HT3
         tHmr+0Flj1rq2BIYtm6XgczVKYt9ujPdf2YFV29PM2mCSdyUFu8Io+AtjYI/GLEeijfs
         Q8IzWw9mbtOJ6qLwl+oBTb8vwc0Gg5tFYEVl4MCligErCxSzSThPgnax6B5e8Ed6CSdv
         dVrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyt24YVjQ6B302q+z9GJ8dvl8GY14KJnX3PE3V0YmTVyJ6/1QoNgYbsr+CtUipqYTBBrpnVwayIV88@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn7TAknTPFiaKa2DwlTdm+KMPXImvpZKJwWXhMVne1DXY4KYfe
	pbLVlJ0uTXj11lxG0rQHi58wP9TNZxMPrPnSXOC/t8ztxBlRe6JVJn1tZpGboDedJ09iqYqKkLW
	jGPa5NhTt07zdD5luPw==
X-Google-Smtp-Source: AGHT+IFBNlC2O2lCqWhKeQbyAtagcsPixzHArx3alpasUksoCuLOtkF4bpyxaKtp+sZkIRPUeSQUbnmVmkWHtYVc
X-Received: from pgbfe4.prod.google.com ([2002:a05:6a02:2884:b0:ad5:4620:b05d])
 (user=vannapurve job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3989:b0:1ee:dee8:5a21 with SMTP id adf61e73a8af0-1eef52c9126mr489345637.6.1740086198423;
 Thu, 20 Feb 2025 13:16:38 -0800 (PST)
Date: Thu, 20 Feb 2025 21:16:27 +0000
In-Reply-To: <20250220211628.1832258-1-vannapurve@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250220211628.1832258-1-vannapurve@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250220211628.1832258-4-vannapurve@google.com>
Subject: [PATCH V5 3/4] x86/tdx: Emit warning if IRQs are enabled during HLT
 #VE handling
From: Vishal Annapurve <vannapurve@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev
Cc: pbonzini@redhat.com, seanjc@google.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, oupton@google.com, 
	pgonda@google.com, kirill@shutemov.name, dave.hansen@linux.intel.com, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, jgross@suse.com, 
	ajay.kaher@broadcom.com, alexey.amakhalov@broadcom.com, 
	Vishal Annapurve <vannapurve@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
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
index 7ab427e85bd3..16ac337df9fa 100644
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
2.48.1.601.g30ceb7b040-goog

