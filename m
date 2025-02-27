Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188561EB5F2
	for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 02:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740622771; cv=none; b=uLzLh9C3u+SA2TyxecyZZx5WJpkZM2JvlcKVWaY6GgXmjnEW+CpLtu7SjlVFuyrRgXCIAAV8iiE3kNNT+iP0JHRaLl0ddo6vWta2wnMeQ16+uabt067HD4nhd/eNNnEWHMIBVAd/R2O4CfAFiFFVas8/zXPkP/xs36Bd+jbc10E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740622771; c=relaxed/simple;
	bh=qrmPmOcptAmLgQCle3N1kl8WrTK3PJ1AWETKMFIpJ6A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KUm5J6hR/GyyDyqhD1TM0GxKKS5eGsRCHGkwyxMiZXNA+QH4S8ugjATWO1LSEUWRWChB/5bgzZR0flB5H8uIKt2pF2BAl84K+12vGgFl6J8femOmPk3GmvyQXrys6YXyubaqLUoDLqTC9EZ6Yi12j4WVn6CWSYN7Gv5s3Hdiq5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dvt+tKtZ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dvt+tKtZ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fc1a4c14d4so1063834a91.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 18:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622769; x=1741227569; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4/yyaam3CnBmuwJ2ykq85CXFFo+ZsEjkVRvpD/uHncQ=;
        b=dvt+tKtZZpt/MFv2ooD/+cCM6bsmfmFdGqhG1k60gJKiAOpIjnAlwMjylkvQtFJrDW
         6aRoWE3w5M/ItrL2x19vNSV0r5UOwUeoOBnzaL2UZ9j7mCVKZTzSEShMB3VvZyC7JwiZ
         e5rKgzDIZAue5A0mzNY4lq1nxF8ukRXRa+rkGupMmvQBbY3B/QVtu53cH8zTdhFPqHUT
         UlBEO+9GX7uatQqKSI8TgsVH0M8gSkU5EKBJLAGPGq0e5luVvYKWHKzfFM0LVUM1B7Ei
         PAmD4l/vVTvvAom1FqGk0QXq/9RkWGAOHZ897qmJq3GPmziB2Ubf93B97f2HBbnRhAh2
         nLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622769; x=1741227569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/yyaam3CnBmuwJ2ykq85CXFFo+ZsEjkVRvpD/uHncQ=;
        b=SIE7dEuoylmMoRYzCbmILaX3EygOlUyWUQFUmHsygffogcV/sX0APxXeUMHOUebd4s
         l1MF7gwwAPme7Rn6tHYTNxidICS0qG6Oo187Kap2Fh5JTaWqOiCgpqDMxnVRyb0I+aOM
         zQ9HF/FZx2XpsgU9gFs+5g+oVdIENrVrovmsk1Q4thDTcxsKCI3K1YFOFbR0k5bZ/CjA
         R6Tq36rLpegqMEr2TlNXT2JRj9wR2L5VFSgrCL6CWYFpBO+C6VhIXcpsuG61SK7RVcGN
         L/gr3VtbnMFEFUGoX9abSHU4ayNkbKJQTq0U8ku7GFoSBorKVrtVAD6zVWifaCiOx2ct
         jVcg==
X-Forwarded-Encrypted: i=1; AJvYcCXmLSJ90f4BgLFasatG7mljdY4h9kh4T9KbCX4hwj18/huvDdcj8hcQxdkIS30YR5uwicF8R5cKz3sq@lists.linux.dev
X-Gm-Message-State: AOJu0YyHkcKGTg+VDchbKUQMN9dHW5ECI7dbEIZLIel6oPHt63Spy4HG
	oHnV4+TOYGQXgl8DSE0yfURmhmckYgdWT3GHWgFV00cZbM3RqavmgNjSuNPLGY5OW4DnjD4LcDR
	vnw==
X-Google-Smtp-Source: AGHT+IHB6t2yNhuRRLSjnQcCsiQss9r1P7c1nIVM64h4xrkl38FU8N4jisiF+hTwqGE4B/+REyTZDinhF2Y=
X-Received: from pjbqb10.prod.google.com ([2002:a17:90b:280a:b0:2e0:915d:d594])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:280c:b0:2ee:5bc9:75c7
 with SMTP id 98e67ed59e1d1-2fe68ac9330mr14041142a91.5.1740622769336; Wed, 26
 Feb 2025 18:19:29 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:31 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-16-seanjc@google.com>
Subject: [PATCH v2 15/38] x86/xen/time: Nullify x86_platform's sched_clock
 save/restore hooks
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

Nullify the x86_platform sched_clock save/restore hooks when setting up
Xen's PV clock to make it somewhat obvious the hooks aren't used when
running as a Xen guest (Xen uses a paravirtualized suspend/resume flow).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/xen/time.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 9e2e900dc0c7..51eba986cd18 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -565,6 +565,12 @@ static void __init xen_init_time_common(void)
 	xen_sched_clock_offset = xen_clocksource_read();
 	static_call_update(pv_steal_clock, xen_steal_clock);
 	paravirt_set_sched_clock(xen_sched_clock);
+	/*
+	 * Xen has paravirtualized suspend/resume and so doesn't use the common
+	 * x86 sched_clock save/restore hooks.
+	 */
+	x86_platform.save_sched_clock_state = NULL;
+	x86_platform.restore_sched_clock_state = NULL;
 
 	tsc_register_calibration_routines(xen_tsc_khz, NULL);
 	x86_platform.get_wallclock = xen_get_wallclock;
-- 
2.48.1.711.g2feabab25a-goog

