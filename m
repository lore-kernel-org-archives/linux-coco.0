Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984028;
	b=x68TQhUuY6dX9jlXzJ6WIYWQy1Kf3KcKIaVVfESVbbnMRR1LYw0OxrhAR9BmCmDjieKc
	 +9/+9RBoKEMJ7nv9RaiO6HlNRvkHPJ9p4Vl1GyX+CilbsYPwMpG/I7ayrm1EEUmR6gRE9
	 MMeO1+RzWf5Hc+vvyyiTAdLdQNlr4RbGJGpndYN+VYa1+pnmnDem4Xgj/H9Ls/gobGlwW
	 MyAhnrJllB/onuCWn0ZtZtTEXcvyG9cH8PZErNUldSHzGc5/MYvGmneX9mBH6aIeLEfH2
	 JDTfo0P/9N8LJIRK6DjIipt92D+/FLCmEQ5H5GW7aLn2FTKuAHNqAMTWTZP3XpkbldA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984028;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=WGXSzPoaoRZhYGRZwzYW9Xi8SgZA3sFH/3kCEUuvBxU=;
	b=ocV9iOte6tvyOp18fn2EhxS0cOr73VZE5VsCBXPT9kClgpbArgPqGi2lDHq6IJ1PPvXR
	 ItzW7xfzW/smK6groiT2cq+N+YXdl9G4C4Q1OZA+xipsKwj2mTSH2Bi05Yz3zclT7kZHM
	 65HxO4Xbne4EAX7y8wVPs4UGZMl2Cf33tygY2U93La4Ogu2w1UED3KvuYvqQOrz5QWT5/
	 qT3/SXe0HG1xXI7MNZqbRnHKzw2jAIz5+/yQmVspRK/MebKcspFm+5JtKzp8012pFB/RA
	 e8aosG8QQRs86Ky9rUbZZg+YVjlwxohM+QvZoyMxjqc4hiuFQsCXtmCKBqMXP6zydvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VmfRxsD+;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E0B606A333
	for <linux-coco@lists.linux.dev>; Wed, 18 Nov 2026 06:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26E0B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VmfRxsD+
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb9f760337so1049014a12.0
        for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 22:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984027; x=1795588827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WGXSzPoaoRZhYGRZwzYW9Xi8SgZA3sFH/3kCEUuvBxU=;
        b=EBbclnBarFac9SnaEVJZEiwz54aYTulGfF2xouGKw6sQzOFqhLKa7oVrZIz+uhezFM
         RRaa+xbet7lVpCBLhPFY+YgWw1smfoIN7mSlAYaDqClmZ4duCBLnHBBNvaVzd3CVFwpe
         6lrIc6PD3mvEbP/voqXhYUDbKN12O/4de4VP0Ht/OPz7aR+10nnW3Vuotoh4OsE0Fa0y
         jdvRQzg0EDn5Cgr5OWFvArouYnLdw7mw4p7sa6UHsqeZJm6gukYATWUmx7TZ+T+V7G3Y
         aFE1IGCRZjC6b8Io4RCFEE4Z9eXp3RXoVtNuchcDyh7LGwnHBsOG4xPQvysKX99s+uk1
         AkeA==
X-Forwarded-Encrypted: i=1; AL+hErEGrnAGzsdvJSjBp7EPzSH+oX0XTMK/LARraGWFd9y8Fa49/1K3NCUCPTQpkcqnlAlReUN7fwetgL+S@lists.linux.dev
X-Gm-Message-State: APuU4Z9RoU+zMNVBCr6nG6atL/qxZlPlPw4kE7gGPS04/5cA3Y2PhJDY
	yNzvfUQSRxvbS6MBh9ycwDFZMfKYkEas0loedC+HrDoJ4FZRkRpyO5lYEGHdafOvM5cmMvTiz/4
	ryvPJ2wsRoM1ypYO5Xb9tut0tiOL0RQk/iJCK43p+X19mFZwybjOgH8qGd34o48wX+gvjL9YGzO
	4gLYDioCQayrtT6i7zcd1DlUbdX3dilngByHvMrCyzTDUGiINhOjH9Gy4H78QSNSfeNxEPSsCud
	6J4GOJGXiluWQ==
X-Gm-Gg: AZFdTZcGuoSyH9L7BPwtAwgzLvs24fDyuSqNbtFmNdmlYxLIzKerMOmii9vQAu7+ygk
	9ra1usFrgB6uwvRKJq8l1PObNoBGtBOS02u3dazGF7H/13QALrrronau0YhlzMF4FIaerbGInNc
	KCUrI7h/W1ekfD0SxaVCm/et7070EmvZcLtzrmAf0lIjbXQCBAviZ5OXaH1i9pIiytcAzIYgKBy
	VCRa5e47nDEEHdfn6wQ8Wumz7KjlwMH5CZFexPrB1eRJ7KvBww6HupozRgYMuJaRkPs/Pr7fmtg
	/ppxPd5OMysAqogzlRPl2gtbVXHaAtSEgecGxLSWb4lFbjY1SVhNunheWo52tvNb2qQXDhLpEIO
	CNCw9FdLqTCamBgq58j346exiJ5x/6jVplJIeHiSJJJYxrlfdjBmSXU2YtZ5gFmJWScEkE2RIfL
	bwZW6XdvzMnt+gmL5wm5IoDdt10wO9D5mLZnw=
X-Received: by 2002:a17:90b:4c50:b0:3b0:9f78:4c18 with SMTP id 98e67ed59e1d1-3b3ac29557bmr4381315a91.41.1794984027438;
        Tue, 17 Nov 2026 22:40:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d8b8ce6esm214539a91.4.2026.11.17.22.40.27
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:40:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d53d0bd3dso8572561cf.1
        for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 22:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794984026; x=1795588826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGXSzPoaoRZhYGRZwzYW9Xi8SgZA3sFH/3kCEUuvBxU=;
        b=VmfRxsD+cQh0XkNnaqxKQobxnMpeFRnSnS0i/RCyewvi0wrM2IDdxES/P9bOUh2WNG
         AnZB3xkLjuJSUxHsXi1KyfoHU+fbnfWYlmuJLN8PWsMuRlpjyFBbRJPfhVe2mHsKDpRs
         zNFJn/H4d1kJiUHyoKbtxCyElVZ/fe6GK76kI=
X-Forwarded-Encrypted: i=1; AL+hErHpUrHGrmzvdmaFX+X62mcjLHqqP7LwDTU1dMZFZwLiZxXiRHqu4T5u/CBFtPC9nCHoioSWkIYy0LZp@lists.linux.dev
X-Received: by 2002:a05:622a:4185:b0:545:de78:a6ef with SMTP id d75a77b69052e-55d5a747c5amr22156141cf.38.1794984025899;
        Tue, 17 Nov 2026 22:40:25 -0800 (PST)
X-Received: by 2002:a05:622a:4185:b0:545:de78:a6ef with SMTP id d75a77b69052e-55d5a747c5amr22155911cf.38.1794984025512;
        Tue, 17 Nov 2026 22:40:25 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d61cf3b56sm2078141cf.13.2026.11.17.22.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:40:24 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v4 3/3] x86/cpufeatures: Remove unused VMware hypercall feature bits
Date: Wed, 18 Nov 2026 01:40:13 -0500
Message-ID: <bcc9b471c176d5b162e6935b2c0c7f96c65ac8a6.1794206170.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794206170.git.zack.rusin@broadcom.com>
References: <cover.1794206170.git.zack.rusin@broadcom.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The static-call conversion removed the alternative instruction templates
that used X86_FEATURE_VMCALL and X86_FEATURE_VMW_VMMCALL. Their remaining
users only force the bits during VMware setup; no code tests either bit.

Remove the forced capabilities and mark both positions free in the kernel
header. Neither feature has a cpuinfo name, so this changes no
userspace-visible flag.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/include/asm/cpufeatures.h | 4 ++--
 arch/x86/kernel/cpu/vmware.c       | 4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 61930f0d4578..b7633930020f 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -233,8 +233,8 @@
 #define X86_FEATURE_VMMCALL		( 8*32+15) /* "vmmcall" Prefer VMMCALL to VMCALL */
 #define X86_FEATURE_XENPV		( 8*32+16) /* Xen paravirtual guest */
 #define X86_FEATURE_EPT_AD		( 8*32+17) /* "ept_ad" Intel Extended Page Table access-dirty bit */
-#define X86_FEATURE_VMCALL		( 8*32+18) /* Hypervisor supports the VMCALL instruction */
-#define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* VMware prefers VMMCALL hypercall instruction */
+// free: was #define X86_FEATURE_VMCALL ( 8*32+18) /* Hypervisor supports VMCALL */
+// free: was #define X86_FEATURE_VMW_VMMCALL ( 8*32+19) /* VMware prefers VMMCALL */
 // free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
 #define X86_FEATURE_VCPUPREEMPT		( 8*32+21) /* PV vcpu_is_preempted function */
 #define X86_FEATURE_TDX_GUEST		( 8*32+22) /* "tdx_guest" Intel Trust Domain Extensions Guest */
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index c104681d0945..39f0bdbd1eab 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -505,10 +505,6 @@ static void __init vmware_set_capabilities(void)
 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 	if (vmware_tsc_khz)
 		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
-	if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMCALL)
-		setup_force_cpu_cap(X86_FEATURE_VMCALL);
-	else if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMMCALL)
-		setup_force_cpu_cap(X86_FEATURE_VMW_VMMCALL);
 }
 
 static void __init vmware_init_hypercall(void)
