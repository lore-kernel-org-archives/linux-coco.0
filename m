Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE3122C33A
	for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 02:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740622783; cv=none; b=nWIFChlES6cohTBpvCg/yH63CKaAsq3OCtxgGpx6NaSIaAvHl0cVgHhlcJMpRB4CMjjdbcJ1jk+NdpB/8eyYXIr79GAgXzNRFH8lw9TdcaHWta5EEVvvctrvuybydlyEFd9xLf01dONb/2m+f4aFZSRuVJI+MS7PVrXRZr7fW44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740622783; c=relaxed/simple;
	bh=xZNJmibFAKYDGISYNbW/hm8YjPy9RQVjkpaMVV1EGPI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fpAidrPfB/JEZAcm2gAxZ8hdf6z2f5/osPSK9sq9ASq9Yc7Ymac3T0PCnzW5D4XfDbne1OYU7ZINTXGpRI05b9uBPWZmss3BvAN+jFtZG1WbmhBdV39xn97wmMkZSgBatX99h+187mZZ2fOYyL5odnkmHaKGMopUvibUmcpRczs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wELkmm7B; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wELkmm7B"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fc4dc34291so1061131a91.3
        for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 18:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622781; x=1741227581; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=idfxGEE7w4MZK5vL28VhSjtN1o6ADW/NzBB0c7HM3Jg=;
        b=wELkmm7BgQ9LLS1KsDm3JAZLzQkOns+uNRr+66jf4It5x4X3Hx/XokxrDu1KcJCZKa
         1SyAEuOOCyduLCQAc4FRDu00+PneCbdeoTqPagdjIxHv+cuagpr5BhW/0K8T2nk20Jdn
         W8S+TWCUcyPxQKKPJUY9Q4KXyBPHI55mfJDt/zhTPCP2/uNcdTQcmfRt3FVwcM58Z8aK
         lyH1OyMaEHCKSTdwLU+UHwEQr6UvgtoSqFQuV7cTQOnDEkuMwq4jcNG+9HbU6fun8eZU
         XtJ2KMeYksbXwnjTM1xnH6WV7rDud5EIhJrkwfeyhY967+qRziKmlpm7voAhNlL9x3RO
         EDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622781; x=1741227581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idfxGEE7w4MZK5vL28VhSjtN1o6ADW/NzBB0c7HM3Jg=;
        b=cYX08Jwv36fuG0zrhCOi58rcZGLzwP33T5BR7gdrchL5BLLbhgUUyQiwx6ZeIk0r/h
         IJwj7ppFVZajlbtKmbcWphKNKN6YEVVi5wHPISK73zvhyvtzUfj5LTBPlxDoDaTYH60A
         zjEhFhMhaVxmoaxR9x+jUchfrZvo6l9CLaznjiQNHC0H7DbWz2ZMcInMKPSIvLxpZxft
         r+CQMA7LZX1H8cXXJBpZdWVgmfQ2eWCXJ4nWbHNJXPsmKqWzbH3GTy00nYxWeUoZiAw6
         dqwgdfVnIEduKijVGePOj2C1JPuSEYGxGO+KQOC8V5WZXypj/0E9cb1hthOfCsrKm3wN
         feBw==
X-Forwarded-Encrypted: i=1; AJvYcCWxRxPmu9i/Gl8RxW/JApcWMDQRxlLhtYMVsZSDlpLoOoJKS40WcnZ9eSh8pCqaRPF/b94AsU1SbuoQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3FpRFGj7PWue6RJb8PVbjqkUjHjXxnqshhGHPnPlvC4HmzJ+4
	ZN5wqJp2ebm1W6uBA8NQIKlUzJFSsuCagNhojxvfP9+fSPMvK34nM0re8nCwpD1Pf6N7EYBs0yG
	OWA==
X-Google-Smtp-Source: AGHT+IHCzPrRKHA3wP3HVgIKrQRSiWCMkFG4NMbhGFfjlCu1Pi9S6BKyZnSxtjm5Zx+28kwNIdNRFoi5Jdo=
X-Received: from pjbqi7.prod.google.com ([2002:a17:90b:2747:b0:2f5:4762:e778])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c04:b0:2fa:20f4:d27f
 with SMTP id 98e67ed59e1d1-2fce7b23bb5mr32633734a91.32.1740622781602; Wed, 26
 Feb 2025 18:19:41 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:38 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-23-seanjc@google.com>
Subject: [PATCH v2 22/38] x86/pvclock: WARN if pvclock's valid_flags are overwritten
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="UTF-8"

WARN if the common PV clock valid_flags are overwritten; all PV clocks
expect that they are the one and only PV clock, i.e. don't guard against
another PV clock having modified the flags.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/pvclock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/pvclock.c b/arch/x86/kernel/pvclock.c
index a51adce67f92..8d098841a225 100644
--- a/arch/x86/kernel/pvclock.c
+++ b/arch/x86/kernel/pvclock.c
@@ -21,6 +21,7 @@ static struct pvclock_vsyscall_time_info *pvti_cpu0_va __ro_after_init;
 
 void __init pvclock_set_flags(u8 flags)
 {
+	WARN_ON(valid_flags);
 	valid_flags = flags;
 }
 
-- 
2.48.1.711.g2feabab25a-goog

