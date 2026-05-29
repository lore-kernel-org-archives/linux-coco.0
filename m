Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442953EBF01
	for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065894; cv=none; b=VYS694SJ3nNKWicsL7e6TOMndy3oHKhQZgDCQWkRIPFkFi7EOX9lOEORMTZO//qpg1dPRh8amNl4b1Gi+L2N820/EjusxZ0gZB3C2g/sdW3FvlkbcsjL2mnWPYFQAwnmD/HonhqRJcbKVKrJIffvNAykkp2Z3gGhTBSqbyGe2rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065894; c=relaxed/simple;
	bh=XDZ/SxBGCrg/x8VTpeNWDH8FGBeUvAAaHIVl6yABrEg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JLwOSois87qwLPyNDV7IPWv+MAhh1lQm+osz8jswwT0TfdU38EDZzuesuHvLZLnX62301NwoWDhWVvRbpZay4B6PQ8Pi8zRi8l8969sq2aheBC2oAP+LQgjVG0Icn4IPlGuGNhhYAioZH3hZDJoOR/I8/A/Cu/y9nbFYUAJ581E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xlpo987Y; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xlpo987Y"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36603ad6709so11792584a91.2
        for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 07:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780065892; x=1780670692; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=L0mUatEZLxv6BfkDJUt0JsLCmFdWpOkVYX50Nml1d/w=;
        b=Xlpo987Y9FW1Kn+yUZcxdQJ7T+VIvE9Y0egMFMSeJY4DnBRf79F4/Tk4jeyuJboNdt
         d7cQI/3V7yCE9ZVOj3bB/O8CbV0a9L6DC/1GRJa9eeUfeLdnirTANmRuXRc7V+vlc10T
         CpLONgAlT+j0M6YQ2hk0PlJ95gCAeYu04RiAVLx4NeGYMPn96sIRjSXzhIsTfbBzuHHP
         XIqq7itNnKsV+SSvtKYBl2B3VxUDx/PEMvEF2q8Lx/jy+zRiqhoIiHWrTyQXjyvNKvzu
         HoWKtmDQGtVlecF8qFPqxttHYXf0y/Ex9ZITs/vKO9s0vcXLS+19vEilcC87XReNdTsv
         fGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065892; x=1780670692;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0mUatEZLxv6BfkDJUt0JsLCmFdWpOkVYX50Nml1d/w=;
        b=MtE0l464WkMge5KTm1TpdixUfvtG5MvTC9uh/t6aWHdZhDnqjaKXy6ko88QhwOITnl
         XWAfadL0vV3DjhieQOMPAL1erQQx2s0EMoEXepGQT/smYhSfCSkemCAVgfoz/wLjQRWZ
         vTZ4TKOI4++3bffGJxu3zxpfnggg6E+tVJQYpRvn9ba2l4XwdUYdQQca7APBDUIw32Nu
         tX4eYaHxqKBJV9YO/UrzIvJvcUjuM79VK69hsuMlniD/yH/fxuK9KWOa53W+KDcMFuq/
         2KPCqGjGbbsxGzc5YfErW8i9iozTsH4XiJmaOsbGrK8OMIqPGslJFC9chUCKrj2IYVN6
         NjkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WfpqP2NnmhF9WrLeZr46YgKz+RdRJhjoEJDZu728D1/t9S9SUIrhpwNlm1YHhgCUZGG2bSSz5Ybs3@lists.linux.dev
X-Gm-Message-State: AOJu0YwlyaIHAd5uGaofZjPTLxL1Rbv/4yGkD/t1ZQyXjf1PmUuY0Fa8
	VRg8LU2ysV4hx4tmQuK70Wp7swe/8xOLk18F5DOU7t2187bfD0qSgKB3Tv0w5ePQ4YmdyxhXSHw
	DdWJ43A==
X-Received: from pjbev8.prod.google.com ([2002:a17:90a:eac8:b0:36b:d883:98c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e707:b0:36a:d6dd:9fee
 with SMTP id 98e67ed59e1d1-36bbcd6f8c3mr3583126a91.12.1780065892195; Fri, 29
 May 2026 07:44:52 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:43:48 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-2-seanjc@google.com>
Subject: [PATCH v4 01/47] x86/tsc: Never re-calibrate TSC frequency if its
 exact timing is known
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Don't re-calibrate the TSC frequency if the TSC is known to run at a fixed
frequency.  In practice, this is likely one big nop, as re-calibration is
used only for SMP=n kernels, and only for hardware that is 20+ years old,
i.e. is extremely unlikely to collide with TSC_KNOWN_FREQ.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index c5110eb554bc..08cf6625d484 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -946,7 +946,8 @@ void recalibrate_cpu_khz(void)
 		return;
 
 	cpu_khz = x86_platform.calibrate_cpu();
-	tsc_khz = x86_platform.calibrate_tsc();
+	if (!boot_cpu_has(X86_FEATURE_TSC_KNOWN_FREQ))
+		tsc_khz = x86_platform.calibrate_tsc();
 	if (tsc_khz == 0)
 		tsc_khz = cpu_khz;
 	else if (abs(cpu_khz - tsc_khz) * 10 > tsc_khz)
-- 
2.54.0.823.g6e5bcc1fc9-goog

