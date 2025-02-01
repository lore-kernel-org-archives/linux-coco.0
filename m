Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCA0446A1
	for <linux-coco@lists.linux.dev>; Sat,  1 Feb 2025 02:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738376256; cv=none; b=Mc4/3Rj8Id37Z0Kiz2YahXboy6GqmGxvE8bVd2ohCtCpsKpIyKtmMXdjRNPpH0XrVrWybOkUZhdQNTb69C2v1l7ML2UalveCe0ZAU5WL1APmwSkSnc+XjL13NkOY+nbX9J1i10E7Va/a0PS+FsGI6n/3KnENU2DQ8xz48LADOe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738376256; c=relaxed/simple;
	bh=IAZ81L9edk4QC0pX5hltlfX8CufP2WccrKBU/+/H8Yk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ubuNaWkLms4AIlJ7rTW9VG/w2NAl+fcInFdof9KhesmWIC726r5bobmkTNw2lr6dnRkHCqWISnt5rj6J7ik7R4Bvj6AU1olDfeSMuSj9yLofVPCpKqSI/hpUhbQK7iv+w4C8PNC/4T4GsQ+UMXSTAnFiMXR1MniBb8PeYJNo3rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FyMwxqdZ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FyMwxqdZ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2167141e00eso62339625ad.2
        for <linux-coco@lists.linux.dev>; Fri, 31 Jan 2025 18:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376254; x=1738981054; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=MDyJubTgvsqHYl0zNK5/PK8+bagsI5N8h9xCVnMunLg=;
        b=FyMwxqdZgTNlJ680Rk7I6XzU47wJGNHAGUL3mOIy+WWerWC/dj0yPX4vh+m1dzdpr1
         GPDGX76dnn3+yEacTCiHRhitfacBZynYsvINKDgcj6vZZ8BGoU18hOEg+I+EprB/tfgn
         AZLd6vPD07pR01ls2CcxnXg2+mQIsjS+bLbkSTIupAJ07eM4dUCvIyMiIP3JLAUplmG4
         tC1BIZCznH2cQdHyUh4+TamMqrHyaj1XP+1ZP+ce/tWjKsm+fbDE8n9zmMppuqzapCr5
         RHn1Mxn9YEhhEyCPl9Y9wfHv+f72Ve0PBKw26nbDUY3MTnoKB05C3g0AoNXLEF8cnBw7
         Y/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376254; x=1738981054;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDyJubTgvsqHYl0zNK5/PK8+bagsI5N8h9xCVnMunLg=;
        b=E9UoJ4QgpZNvl0uTC/UnxDjGVZzUP4KD//V2w0rKXuSml38s5BARn2Iwzd0Jzinbbw
         cedTu0rX2mifiY4r6jsjEBEtyDhb/ReNUwYsggpnf663ufWxa0WNDjoDVQOEcCt+fjgw
         SiOzdCU55yKcUcpucDl02wuxBRTISIaPk2zqL3XsQLiq8zL9LdgCtDktX6s6kI6KCdCZ
         XKJDn8AJLUWR/SR1aqT49Z+Zqfe1psjHvnTSSLfjD70euYdbRTcDoiEOdfIw4yBWmOyi
         U/rt8Vo+ev2al2z0YgzuLL4XWoTqFwiXNLkCKalYg1CQpn2aas6Q6U2d1x7TEmIaBlPF
         Zavg==
X-Forwarded-Encrypted: i=1; AJvYcCWAVX0ylAdHIGTF4oc7y5zeGgz4hPiqg1iClWOa18Qi+k82wrkwZsAXATahczCoXauCGqHsg8neTUxG@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5ejr3AJe24nMAMQ5yK2La8kbKqNl4Vincgw54UNmuNznyzPPH
	dA6gKecJy5190Jqbr8nDV9Y2C8165liNgBzmezcI99vAcaq1NAFmPwAgKQwfQs8hsApdnIoymmV
	AOQ==
X-Google-Smtp-Source: AGHT+IGkjSAAWxmwHiu0qCv61xkb4iGGZ5alFNn1UCDa8mCUkr+gLXYmTCgtlrE3otTrUQeGakGB8oHEBGw=
X-Received: from pjj16.prod.google.com ([2002:a17:90b:5550:b0:2e5:8726:a956])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db04:b0:216:4c88:d93a
 with SMTP id d9443c01a7336-21dd7dd7356mr228949515ad.48.1738376254204; Fri, 31
 Jan 2025 18:17:34 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:06 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-5-seanjc@google.com>
Subject: [PATCH 04/16] x86/sev: Mark TSC as reliable when configuring Secure TSC
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	jailhouse-dev@googlegroups.com, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Sean Christopherson <seanjc@google.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Move the code to mark the TSC as reliable from sme_early_init() to
snp_secure_tsc_init().  The only reader of TSC_RELIABLE is the aptly
named check_system_tsc_reliable(), which runs in tsc_init(), i.e.
after snp_secure_tsc_init().

This will allow consolidating the handling of TSC_KNOWN_FREQ and
TSC_RELIABLE when overriding the TSC calibration routine.

Cc: Nikunj A Dadhania <nikunj@amd.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c      | 2 ++
 arch/x86/mm/mem_encrypt_amd.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 684cef70edc1..e6ce4ca72465 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -3288,6 +3288,8 @@ void __init snp_secure_tsc_init(void)
 		return;
 
 	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+
 	rdmsrl(MSR_AMD64_GUEST_TSC_FREQ, tsc_freq_mhz);
 	snp_tsc_freq_khz = (unsigned long)(tsc_freq_mhz * 1000);
 
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index b56c5c073003..774f9677458f 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -541,9 +541,6 @@ void __init sme_early_init(void)
 	 * kernel mapped.
 	 */
 	snp_update_svsm_ca();
-
-	if (sev_status & MSR_AMD64_SNP_SECURE_TSC)
-		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 }
 
 void __init mem_encrypt_free_decrypted_mem(void)
-- 
2.48.1.362.g079036d154-goog

