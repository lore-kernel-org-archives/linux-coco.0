Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A0F197A76
	for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 02:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740622758; cv=none; b=Th6hUxTBne2Fa3chAovsCYKtg83RYA1G2jI1sQvFbMeC4IOxXS7Uoabs1CtU+UppxoL2Ix/h6Q4eQ6g+aYdgqGlXo/KiqF57hM9ThPiO+3R45ijt2xpXWYbLb2gbYy91R+k9yS0xGuXi9TmEQgd7nQeWB071UHUe9+FgVVw0LPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740622758; c=relaxed/simple;
	bh=X5UL+eTktXYoDPfW4LhmVxWuD5wQW055Sxbi/QZyZe8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AaNWCM2nJO0TFQQ+lGMusK3BZjYiO7vYovtXFvuwfF8+X4cpWau2j/+EEg3YyMFJUTSDj2GmFtEUFcT5wc0O6KNUMQ7bvDAE6+nv49DAjzEhYRKxOODGSeNdTMPubvS/8i5NnpOu21aeManYjhZiyPMGkPe86NkPLs5MYY1MTh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jsjvxQyd; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jsjvxQyd"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fc1e7efdffso1555486a91.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 18:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622755; x=1741227555; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YtBqucRQyVVjFtgUlGbh/U8C9xbSv2L/3t5kwpG/0fs=;
        b=jsjvxQydjKxgyD6VVGBBnPRmwUbMoY6Osw+jLlg7uRrHEdyjF2C+I3VGhYD37j3rei
         bFeCRhAsmmGe8ZGaF1M7BSUGdOAfcQGaQgZ4Tq7ygIFi5rNXZfrKwe7m7ZpxPE1AytHC
         72eOXGMqRlQCF0v/LJXJnduepdfERnSOg3LJdWRhZPjypyk6gCNFE1+wBBfo6A9R8EnY
         wCxXgA7vvLCiPD9ajnR0bsgimsigCAK7w9pKnZ9lmTrpxEc+j+paARMDN8KHft49tUwv
         qutxUl6xqUyWMc1jksv0uCTHGsxucPN26QdbUaC5dVkzrFmhVlEwIomuRPjCVfHAsazY
         r39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622755; x=1741227555;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtBqucRQyVVjFtgUlGbh/U8C9xbSv2L/3t5kwpG/0fs=;
        b=EfS3QVswAB1SC2I9AxRP7GAx7V1fTSRx2BaAsvLgN/xy+c8KXAydQwaeGpHy0IcWvH
         fT0xajvaqlqxVQ4Zso6nZLh/aBtti2+dmMMyr2Xk965Rfl1pbR6vlBTg+96M3XvX+m9g
         n4uScgWYHSxnPSZ/a/V4EgUpjq3Sez9fHfjp+GajqSU+4CCAbpf4faXjg/SGwHCPE44J
         R43Dbiq5RHbai2o1CJ9q3iA9wXiMc3lQmSWv0xktqWDjlrLlN4q7EmPtYLegSBsnYPLU
         gRGOtZfzc262gE1eN+iZYDcX/CPPxe2buJYiRDyuA4jb6VKzwuhpLqWBjlNldMTymVDW
         z88w==
X-Forwarded-Encrypted: i=1; AJvYcCXJW+VD5Ahxk6q8VL2IcZjyXOz2CoHB9ldV4Wuu9d5ffjeFhCs6wbIVtob/nWzHhEuUA6Y/CJ4ry9JR@lists.linux.dev
X-Gm-Message-State: AOJu0YxzETjabu0V38yeYpQwycvFSw71eRdarmrR6SsNqnpo1S2fPy0N
	J5FF/4UvV4u22fW+/xoSB1HKwQH7VIep9JUIVkRZWvwX+rJ8yXnNPJBGOIT/XUrLXGHxns4/eKX
	3PQ==
X-Google-Smtp-Source: AGHT+IH9Y0SwBcAS02xHNq+a4IakpnWSLKqVw4P68iCQM2m6waYT1AwLAOPZPnrjzYdSpJiao+kBYkSTr34=
X-Received: from pjb4.prod.google.com ([2002:a17:90b:2f04:b0:2ef:78ff:bc3b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dc8:b0:2fa:ba3:5457
 with SMTP id 98e67ed59e1d1-2fe68ae6c4fmr17520974a91.17.1740622755379; Wed, 26
 Feb 2025 18:19:15 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:23 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-8-seanjc@google.com>
Subject: [PATCH v2 07/38] x86/acrn: Mark TSC frequency as known when using
 ACRN for calibration
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

Mark the TSC frequency as known when using ACRN's PV CPUID information.
Per commit 81a71f51b89e ("x86/acrn: Set up timekeeping") and common sense,
the TSC freq is explicitly provided by the hypervisor.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/acrn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index c1506cb87d8c..2da3de4d470e 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -29,6 +29,7 @@ static void __init acrn_init_platform(void)
 	/* Install system interrupt handler for ACRN hypervisor callback */
 	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
 
+	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	tsc_register_calibration_routines(acrn_get_tsc_khz,
 					  acrn_get_tsc_khz);
 }
-- 
2.48.1.711.g2feabab25a-goog

